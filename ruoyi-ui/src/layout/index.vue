<template>
  <div :class="classObj" class="app-wrapper" :style="{'--current-color': theme}">
    <div v-if="device==='mobile'&&sidebar.opened" class="drawer-bg" @click="handleClickOutside"/>
    <sidebar v-if="!sidebar.hide" class="sidebar-container"/>
    <div :class="{hasTagsView:needTagsView,sidebarHide:sidebar.hide}" class="main-container">
      <div :class="{'fixed-header':fixedHeader}">
        <navbar @setLayout="setLayout"/>
        <tags-view v-if="needTagsView"/>
      </div>
      <app-main/>
      <settings ref="settingRef"/>
    </div>
  </div>
</template>

<script>
import { AppMain, Navbar, Settings, Sidebar, TagsView } from './components'
import ResizeMixin from './mixin/ResizeHandler'
import { mapState } from 'vuex'
import variables from '@/assets/styles/variables.scss'
import { dailySummary, monthlySummary } from '@/api/system/record'
import { getCurrentBudget } from '@/api/system/budget'
import { getCurrentDailyBudget } from '@/api/system/dailyBudget'
import { getDueReminder, updateReminder } from '@/api/system/reminder'

export default {
  name: 'Layout',
  components: {
    AppMain,
    Navbar,
    Settings,
    Sidebar,
    TagsView
  },
  data() {
    return {
      reminderPollTimer: null,
      reminderDialogOpen: false,
      reminderPollPausedUntil: 0
    }
  },
  mounted() {
    this.checkBudgetStatus()
    this.startReminderPolling()
  },
  beforeDestroy() {
    if (this.reminderPollTimer) {
      clearInterval(this.reminderPollTimer)
      this.reminderPollTimer = null
    }
  },
  mixins: [ResizeMixin],
  computed: {
    ...mapState({
      theme: state => state.settings.theme,
      sideTheme: state => state.settings.sideTheme,
      sidebar: state => state.app.sidebar,
      device: state => state.app.device,
      needTagsView: state => state.settings.tagsView,
      fixedHeader: state => state.settings.fixedHeader
    }),
    classObj() {
      return {
        hideSidebar: !this.sidebar.opened,
        openSidebar: this.sidebar.opened,
        withoutAnimation: this.sidebar.withoutAnimation,
        mobile: this.device === 'mobile'
      }
    },
    variables() {
      return variables
    }
  },
  methods: {
    handleClickOutside() {
      this.$store.dispatch('app/closeSideBar', { withoutAnimation: false })
    },
    setLayout() {
      this.$refs.settingRef.openSetting()
    },
    async checkBudgetStatus() {
      const now = new Date()
      const pad = n => (n < 10 ? '0' + n : '' + n)
      const ym = now.getFullYear() + '-' + pad(now.getMonth() + 1)
      const today = ym + '-' + pad(now.getDate())

      const [
        dailySumRes,
        monthlySumRes,
        dailyBudgetRes,
        monthlyBudgetRes
      ] = await Promise.all([
        dailySummary(today),
        monthlySummary(ym),
        getCurrentDailyBudget(today),
        getCurrentBudget(ym)
      ]).catch(err => {
        console.error('获取预算或汇总失败', err)
        return [null, null, null, null]
      })

      if (monthlySumRes && monthlyBudgetRes) {
        const monthBudget = Number((monthlyBudgetRes && monthlyBudgetRes.data) || 0)
        const monthExpense = Number((monthlySumRes.data && monthlySumRes.data.expenseTotal) || 0)
        const isMonthOver = monthBudget > 0 && monthExpense > monthBudget

        if (isMonthOver) {
          const overAmount = monthExpense - monthBudget
          const STEP = 100
          const bucket = STEP > 0 ? Math.floor(overAmount / STEP) : 0
          const key = `globalBudgetWarn_month_${ym}_${today}_${bucket}`

          if (!localStorage.getItem(key)) {
            this.$alert(
              `您本月已超支：${overAmount.toFixed(2)}，请注意控制支出。`,
              '月度超支提醒',
              { type: 'warning', confirmButtonText: '我知道了' }
            )
            localStorage.setItem(key, '1')
          }
        }
      }

      if (dailySumRes && dailyBudgetRes) {
        const dayBudget = Number((dailyBudgetRes && dailyBudgetRes.data) || 0)
        const dayExpense = Number((dailySumRes.data && dailySumRes.data.expenseTotal) || 0)

        let dailyAllowance = 0
        let isDayOver = false
        let dayOverAmount = 0

        if (dayBudget > 0) {
          dailyAllowance = dayBudget
          isDayOver = dayExpense > dailyAllowance
          dayOverAmount = dayExpense - dailyAllowance
        } else {
          const monthBudget = Number((monthlyBudgetRes && monthlyBudgetRes.data) || 0)
          if (monthBudget > 0) {
            const daysInMonth = new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate()
            dailyAllowance = daysInMonth ? monthBudget / daysInMonth : 0
            isDayOver = dayExpense > dailyAllowance
            dayOverAmount = dayExpense - dailyAllowance
          }
        }

        if (isDayOver) {
          const STEP = 20
          const bucket = STEP > 0 ? Math.floor(dayOverAmount / STEP) : 0
          const key = `globalBudgetWarn_day_${today}_${bucket}`

          if (!localStorage.getItem(key)) {
            this.$alert(
              `今日已超支：${dayOverAmount.toFixed(2)}，请注意控制支出。`,
              '今日超支提醒',
              { type: 'warning', confirmButtonText: '我知道了' }
            )
            localStorage.setItem(key, '1')
          }
        }
      }
    },
    startReminderPolling() {
      this.checkDueReminder()

      if (this.reminderPollTimer) {
        clearInterval(this.reminderPollTimer)
      }

      this.reminderPollTimer = setInterval(() => {
        this.checkDueReminder()
      }, 10000) // 提醒轮询加快到 10s，提升实时性
    },
    async checkDueReminder() {
      if (this.reminderDialogOpen) {
        return
      }
      if (this.reminderPollPausedUntil && Date.now() < this.reminderPollPausedUntil) {
        return
      }

      const editingFlag = sessionStorage.getItem('taskReminderEditing')
      const currentPath = this.$route && this.$route.path
      if (editingFlag === '1' && currentPath && currentPath.indexOf('/finance/reminder') === 0) {
        return
      }

      const res = await getDueReminder().catch(() => null)
      const reminder = res && res.data
      if (!reminder || !reminder.reminderId) {
        return
      }

      this.reminderDialogOpen = true

      this.$confirm(
        reminder.reminderTitle,
        '事物提醒',
        {
          type: 'warning',
          confirmButtonText: '已完成',
          cancelButtonText: '未完成',
          distinguishCancelAndClose: true,
          showClose: false,
          closeOnClickModal: false,
          closeOnPressEscape: false
        }
      ).then(async () => {
        this.reminderDialogOpen = false
        this.$msgbox.close()
        await updateReminder({ reminderId: reminder.reminderId, status: 1 }).catch(() => {})
        window.dispatchEvent(new CustomEvent('reminder-updated', { detail: reminder.reminderId }))
        this.reminderPollPausedUntil = Date.now() + 10000
        if (this.$route && this.$route.query && this.$route.query.reminderId) {
          this.$router.replace({ path: this.$route.path, query: {} })
        }
        sessionStorage.removeItem('taskReminderEditing')
      }).catch(action => {
        if (action === 'cancel') {
          this.reminderDialogOpen = false
          this.$msgbox.close()
          sessionStorage.setItem('taskReminderEditing', '1')
          setTimeout(() => {
            this.$router.push({ path: '/finance/reminder', query: { reminderId: reminder.reminderId } })
          }, 150)
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
  @import "~@/assets/styles/mixin.scss";
  @import "~@/assets/styles/variables.scss";

  .app-wrapper {
    @include clearfix;
    position: relative;
    height: 100%;
    width: 100%;

    &.mobile.openSidebar {
      position: fixed;
      top: 0;
    }
  }

  .main-container:has(.fixed-header) {
    height: 100vh;
    overflow: hidden;
  }

  .drawer-bg {
    background: #000;
    opacity: 0.3;
    width: 100%;
    top: 0;
    height: 100%;
    position: absolute;
    z-index: 999;
  }

  .fixed-header {
    position: fixed;
    top: 0;
    right: 0;
    z-index: 9;
    width: calc(100% - #{$base-sidebar-width});
    transition: width 0.28s;
  }

  .hideSidebar .fixed-header {
    width: calc(100% - 54px);
  }

  .sidebarHide .fixed-header {
    width: 100%;
  }

  .mobile .fixed-header {
    width: 100%;
  }
</style>
