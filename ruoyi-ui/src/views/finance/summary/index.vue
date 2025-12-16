<template>
  <div class="app-container">
    <!-- 汇总卡片 -->
    <el-row :gutter="10" class="mb8">
      <!-- 今日结算 -->
      <el-col :span="12">
        <el-card shadow="never">
          <div slot="header" class="clearfix">
            <span>今日结算</span>
            <div style="float:right">
              <el-date-picker
                v-model="dailyDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择日期"
                size="mini"
                @change="onDayChange"
              />
            </div>
          </div>
          <el-row :gutter="10">
            <el-col :span="8">
              <div>收入</div>
              <div class="num">{{ money(dailySummaryData.incomeTotal) }}</div>
            </el-col>
            <el-col :span="8">
              <div>支出</div>
              <div class="num">{{ money(dailySummaryData.expenseTotal) }}</div>
            </el-col>
            <el-col :span="8">
              <div>结余</div>
              <div class="num">{{ money(dailySummaryData.balance) }}</div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>

      <!-- 本月结算 -->
      <el-col :span="12">
        <el-card shadow="never">
          <div slot="header" class="clearfix">
            <span>本月结算</span>
            <div style="float:right">
              <el-date-picker
                v-model="monthYm"
                type="month"
                value-format="yyyy-MM"
                placeholder="选择月份"
                size="mini"
                @change="onMonthChange"
              />
            </div>
          </div>
          <el-row :gutter="10">
            <el-col :span="8">
              <div>收入</div>
              <div class="num">{{ money(monthlySummaryData.incomeTotal) }}</div>
            </el-col>
            <el-col :span="8">
              <div>支出</div>
              <div class="num">{{ money(monthlySummaryData.expenseTotal) }}</div>
            </el-col>
            <el-col :span="8">
              <div>结余</div>
              <div class="num">{{ money(monthlySummaryData.balance) }}</div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>

    <!-- 预留：分类占比图 & 超支提醒（下一步加） -->
    <!-- 分类占比：今日 -->
    <el-card shadow="never" class="mb8">
      <div slot="header" class="clearfix">
        <span>今日分类占比</span>
      </div>
      <el-row :gutter="10">
        <el-col :span="12">
          <div class="chart-title">支出占比</div>
          <div ref="dailyExpensePieRef" class="pie-box"></div>
        </el-col>
        <el-col :span="12">
          <div class="chart-title">收入占比</div>
          <div ref="dailyIncomePieRef" class="pie-box"></div>
        </el-col>
      </el-row>
    </el-card>

    <!-- 分类占比：本月 -->
    <el-card shadow="never" class="mb8">
      <div slot="header" class="clearfix">
        <span>本月分类占比</span>
      </div>
      <el-row :gutter="10">
        <el-col :span="12">
          <div class="chart-title">支出占比</div>
          <div ref="monthlyExpensePieRef" class="pie-box"></div>
        </el-col>
        <el-col :span="12">
          <div class="chart-title">收入占比</div>
          <div ref="monthlyIncomePieRef" class="pie-box"></div>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
import { dailySummary, monthlySummary } from '@/api/system/record'
import { getDicts } from '@/api/system/dict/data'
import * as echarts from 'echarts'
import { getCurrentBudget } from '@/api/system/budget'
import { getCurrentDailyBudget, setSelfDailyBudget } from '@/api/system/dailyBudget'

export default {
  name: 'FinanceSummary',
  data() {
    return {
      dailySummaryData: { incomeTotal: 0, expenseTotal: 0, balance: 0, byCategory: [] },
      monthlySummaryData: { incomeTotal: 0, expenseTotal: 0, balance: 0, byCategory: [] },
      dailyDate: '',
      monthYm: '',
      chartDailyExpense: null,
      chartDailyIncome: null,
      chartMonthlyExpense: null,
      chartMonthlyIncome: null,
      monthBudget: 0,
      monthRemain: 0,
      monthOver: false,
      dayRemain: 0,
      dayOver: false,
      categoryOptions: [],
      categoryLabelMap: {},
    }
  },
  created() {
    this.initDates()
    this.loadDailySummary()
    this.loadMonthlySummary()
    this.loadDicts()
  },
  async mounted() {
    this._resizeHandler = () => {
      const list = [
        this['dailyExpensePieRefInst'],
        this['dailyIncomePieRefInst'],
        this['monthlyExpensePieRefInst'],
        this['monthlyIncomePieRefInst']
      ]
      list.forEach(i => i && i.resize())
    }
    window.addEventListener('resize', this._resizeHandler)
    await this.loadDailySummary()
    await this.loadMonthlySummary()
    await this.loadMonthBudgetAndWarn()
    await this.loadDayBudgetAndWarn()
  },
  activated() {
    this.refreshAll()
  },
  methods: {
    // 初始化默认日期/月份
    initDates() {
      const now = new Date()
      this.dailyDate = this.formatDate(now)
      this.monthYm = this.formatYm(now)
    },
    async refreshAll() {
      await this.loadDailySummary()
      await this.loadMonthlySummary()
      await this.loadMonthBudgetAndWarn()
      await this.loadDayBudgetAndWarn()
    },
    // mounted() {
    //   this._resizeHandler = () => {
    //     const list = [
    //       this['dailyExpensePieRefInst'],
    //       this['dailyIncomePieRefInst'],
    //       this['monthlyExpensePieRefInst'],
    //       this['monthlyIncomePieRefInst']
    //     ]
    //     list.forEach(i => i && i.resize())
    //   }
    //   window.addEventListener('resize', this._resizeHandler)
    // },

    beforeDestroy() {
      window.removeEventListener('resize', this._resizeHandler)
    },
    // 加载数据字典（分类中文标签）
    loadDicts() {
      getDicts('finance_category').then(res => {
        const list = res.data || []
        this.categoryOptions = list
        // 构建映射：value -> label
        const map = {}
        list.forEach(d => { map[String(d.dictValue)] = d.dictLabel })
        this.categoryLabelMap = map

        // 字典就绪后，重绘今日/本月饼图（确保中文）
        this.$nextTick(() => {
          this.renderDailyPies()
          this.renderMonthlyPies()
        })
      })
    },
    onMonthChange() {
      this.loadMonthlySummary().then(() => this.loadMonthBudgetAndWarn())
    },
    onDayChange() {
      this.loadDailySummary().then(() => this.loadDayBudgetAndWarn())
    },
    async loadMonthBudgetAndWarn() {
      const ym = this.monthYm || this.formatYm(new Date())
      const res = await getCurrentBudget(ym)
      this.monthBudget = Number((res && res.data) || 0)

      const monthExpense = Number(this.monthlySummaryData.expenseTotal || 0)
      this.monthRemain = this.monthBudget - monthExpense
      this.monthOver = this.monthRemain < 0

      // 日均额度（给“今日提醒”用）
      const dt = new Date(ym + '-01')
      const days = new Date(dt.getFullYear(), dt.getMonth() + 1, 0).getDate()
      const dailyAllowance = days ? this.monthBudget / days : 0
      const dayExpense = Number(this.dailySummaryData.expenseTotal || 0)
      this.dayRemain = dailyAllowance - dayExpense
      this.dayOver = this.dayRemain < 0

      // 超支提醒（按档位：每增加 STEP 元再提醒一次）
      const today = this.formatDate(new Date())
      if (this.monthBudget > 0 && this.monthOver) {
        const over = monthExpense - this.monthBudget                   // 超出金额（正数）
        const STEP = 100                                             // 步长，按需改为 100 / 500 / 1000 …
        const bucket = STEP > 0 ? Math.floor(over / STEP) : 0          // 当前所处的档位（0,1,2,...）
        const key = `budgetWarn_${ym}_${today}_${bucket}`              // 当天、该档位是否已提醒
        if (!localStorage.getItem(key)) {
          this.$alert(
            `您本月已超支：${this.money(over)}，请注意控制支出。`,
            '超支提醒',
            { type: 'warning', confirmButtonText: '我知道了' }
          )
          localStorage.setItem(key, '1')
        }
      }
    },
    // 日提醒：优先使用每日预算
    async loadDayBudgetAndWarn() {
      const date = this.dailyDate || this.formatDate(new Date())
      const res = await getCurrentDailyBudget(date)
      const dayBudget = Number((res && res.data) || 0)
      const dayExpense = Number(this.dailySummaryData.expenseTotal || 0)

      if (dayBudget > 0) {
        // 用“每日预算”直接对比今日支出
        this.dayRemain = dayBudget - dayExpense
        this.dayOver = this.dayRemain < 0

        if (this.dayOver) {
          const over = dayExpense - dayBudget                 // 超出金额（正数）
          const STEP = 20                                   // 步长：100/500/1000 均可
          const bucket = STEP > 0 ? Math.floor(over / STEP) : 0
          const key = `dayBudgetWarn_${date}_${bucket}`       // 当天该档位是否已提醒
          if (!localStorage.getItem(key)) {
            this.$alert(
              `今日已超支：${this.money(over)}，请注意控制支出。`,
              '今日超支提醒',
              { type: 'warning', confirmButtonText: '我知道了' }
            )
            localStorage.setItem(key, '1')
          }
        }
      } else {
        // 未配置“每日预算” → 回退为“月度日均额度”
        this.recalcDayWarn()
      }
    },

    loadDailySummary() {
      const date = this.dailyDate || this.formatDate(new Date())
      return dailySummary(date).then(res => {
        this.dailySummaryData = res.data || { incomeTotal: 0, expenseTotal: 0, balance: 0, byCategory: [] }
        this.$nextTick(() => this.renderDailyPies())
      })
    },
    loadMonthlySummary() {
      const ym = this.monthYm || this.formatYm(new Date())
      return monthlySummary(ym).then(res => {
        this.monthlySummaryData = res.data || { incomeTotal: 0, expenseTotal: 0, balance: 0, byCategory: [] }
        this.$nextTick(() => this.renderMonthlyPies())
      })
    },
    recalcDayWarn() {
      const ym = this.monthYm || this.formatYm(new Date())
      const dt = new Date(ym + '-01')
      const days = new Date(dt.getFullYear(), dt.getMonth() + 1, 0).getDate()
      const dailyAllowance = days ? this.monthBudget / days : 0
      const dayExpense = Number(this.dailySummaryData.expenseTotal || 0)
      this.dayRemain = dailyAllowance - dayExpense
      this.dayOver = this.dayRemain < 0
    },
    // loadDailySummary() {
    //   const date = this.dailyDate || this.formatDate(new Date())
    //   dailySummary(date).then(res => {
    //     this.dailySummaryData = res.data || { incomeTotal: 0, expenseTotal: 0, balance: 0, byCategory: [] }
    //     this.$nextTick(() => this.renderDailyPies())
    //   })
    // },
    //
    // loadMonthlySummary() {
    //   const ym = this.monthYm || this.formatYm(new Date())
    //   monthlySummary(ym).then(res => {
    //     this.monthlySummaryData = res.data || { incomeTotal: 0, expenseTotal: 0, balance: 0, byCategory: [] }
    //     this.$nextTick(() => this.renderMonthlyPies())
    //   })
    // },
    // 工具：格式化
    formatDate(d) {
      const pad = n => (n < 10 ? '0' + n : '' + n)
      const dt = new Date(d)
      return dt.getFullYear() + '-' + pad(dt.getMonth() + 1) + '-' + pad(dt.getDate())
    },
    formatYm(d) {
      const pad = n => (n < 10 ? '0' + n : '' + n)
      const dt = new Date(d)
      return dt.getFullYear() + '-' + pad(dt.getMonth() + 1)
    },
    money(n) {
      const v = Number(n || 0)
      return v.toFixed(2)
    },
    // 从字典取中文标签
    labelFromOptions(value) {
      const key = String(value)
      return this.categoryLabelMap[key] || value
    },

// 将 byCategory 转换为 echarts 需要的数据 [{name, value}]
    buildPieData(byCategory = [], type /* 0=支出 1=收入 */) {
      const map = new Map()
      ;(byCategory || [])
        .filter(x => Number(x.type) === Number(type))
        .forEach(x => {
          const key = this.labelFromOptions(x.category) // 中文
          const v = Number(x.total || 0)
          map.set(key, (map.get(key) || 0) + v)
        })
      // 过滤掉 0 值
      return Array.from(map.entries())
        .filter(([,v]) => v > 0)
        .map(([name, value]) => ({ name, value }))
    },

// 饼图通用 option
    buildPieOption(title, seriesData) {
      return {
        title: { text: title, left: 'center', top: 0, textStyle: { fontSize: 14, fontWeight: 'normal' } },
        tooltip: { trigger: 'item', formatter: '{b}<br/>{c} ({d}%)' },
        legend: { bottom: 0, type: 'scroll' },
        series: [
          {
            name: title,
            type: 'pie',
            radius: ['35%','60%'],
            center: ['50%','50%'],
            avoidLabelOverlap: true,
            data: seriesData,
            label: { formatter: '{b} {d}%' }
          }
        ]
      }
    },

// 渲染某个饼图
    renderPie(refName, title, data) {
      const el = this.$refs[refName]
      if (!el) return
      let inst = this[refName + 'Inst']
      if (!inst) {
        inst = echarts.init(el)
        this[refName + 'Inst'] = inst
      }
      inst.setOption(this.buildPieOption(title, data), true)
    },

// 渲染今日四象限中的两个饼图
    renderDailyPies() {
      const exp = this.buildPieData(this.dailySummaryData.byCategory, 0)
      const inc = this.buildPieData(this.dailySummaryData.byCategory, 1)
      this.renderPie('dailyExpensePieRef', '今日支出占比', exp)
      this.renderPie('dailyIncomePieRef', '今日收入占比', inc)
    },

// 渲染本月两个饼图
    renderMonthlyPies() {
      const exp = this.buildPieData(this.monthlySummaryData.byCategory, 0)
      const inc = this.buildPieData(this.monthlySummaryData.byCategory, 1)
      this.renderPie('monthlyExpensePieRef', '本月支出占比', exp)
      this.renderPie('monthlyIncomePieRef', '本月收入占比', inc)
    },
  }
}
</script>

<style scoped>
.num {
  font-weight: 600;
  font-size: 16px;
}
.mb8 {
  margin-bottom: 8px;
}

.pie-box {
  width: 100%;
  height: 300px;
}
.chart-title {
  margin: 4px 0 8px;
  font-size: 13px;
  color: #666;
}
</style>
