<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb20">
      <el-col :span="24">
        <el-card shadow="never">
          <div slot="header" class="clearfix">
            <span>记账统计</span>
            <div style="float:right">
              <el-button type="primary" size="mini" icon="el-icon-download" @click="handleExport" v-hasPermi="['system:statistic:export']">导出</el-button>
            </div>
          </div>

          <!-- 统计类型选择 -->
          <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" label-width="100px" class="mb20">
            <el-form-item label="统计类型" prop="statisticType">
              <el-select v-model="queryParams.statisticType" placeholder="请选择统计类型" clearable @change="handleQuery">
                <el-option label="按日期" value="date" />
                <el-option label="按类别" value="category" />
                <el-option label="按用户" value="user" />
              </el-select>
            </el-form-item>
            <el-form-item label="过滤项" prop="statisticKey">
              <el-input v-model="queryParams.statisticKey" clearable placeholder="可按日期/类别/用户精确筛选" style="width: 240px;" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">查询</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
          </el-form>

          <!-- 统计表格 -->
          <el-table v-loading="loading" :data="pagedList" stripe border>
            <el-table-column :label="keyLabel" align="center" prop="statisticKey" min-width="180">
              <template slot-scope="scope">
                <span>{{ scope.row.displayKey || scope.row.statisticKey }}</span>
              </template>
            </el-table-column>
            <el-table-column label="收入总额" align="center" prop="incomeAmount" width="150">
              <template slot-scope="scope">
                <span style="color: #67c23a;">{{ scope.row.incomeAmount }}</span>
              </template>
            </el-table-column>
            <el-table-column label="支出总额" align="center" prop="expenseAmount" width="150">
              <template slot-scope="scope">
                <span style="color: #f56c6c;">{{ scope.row.expenseAmount }}</span>
              </template>
            </el-table-column>
            <el-table-column label="结余" align="center" width="150">
              <template slot-scope="scope">
                <span :style="{ color: (scope.row.incomeAmount - scope.row.expenseAmount) >= 0 ? '#67c23a' : '#f56c6c' }">
                  {{ (scope.row.incomeAmount - scope.row.expenseAmount).toFixed(2) }}
                </span>
              </template>
            </el-table-column>
          </el-table>

          <pagination
            v-show="statisticList.length > 0"
            :total="statisticList.length"
            :page.sync="queryParams.pageNum"
            :limit.sync="queryParams.pageSize"
            layout="prev, pager, next, sizes, jumper"
            @pagination="handlePageChange"
          />

          <!-- 统计汇总 -->
          <el-row :gutter="20" class="mt20">
            <el-col :span="6">
              <el-statistic title="总收入" :value="totalIncome" :precision="2">
                <template #prefix>
                  <i class="el-icon-arrow-up" style="color: #67c23a;"></i>
                </template>
              </el-statistic>
            </el-col>
            <el-col :span="6">
              <el-statistic title="总支出" :value="totalExpense" :precision="2">
                <template #prefix>
                  <i class="el-icon-arrow-down" style="color: #f56c6c;"></i>
                </template>
              </el-statistic>
            </el-col>
            <el-col :span="6">
              <el-statistic title="结余" :value="totalBalance" :precision="2" :value-style="{ color: totalBalance >= 0 ? '#67c23a' : '#f56c6c' }">
                <template #prefix>
                  <i class="el-icon-s-unfold"></i>
                </template>
              </el-statistic>
            </el-col>
            <el-col :span="6">
              <el-statistic title="统计项数" :value="statisticList.length">
                <template #prefix>
                  <i class="el-icon-data-analysis"></i>
                </template>
              </el-statistic>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { listStatistic } from "@/api/system/statistic";
import request from "@/utils/request";
import { parseTime } from "@/utils/ruoyi";
import { getDicts } from "@/api/system/dict/data";

export default {
  name: "Statistic",
  data() {
    return {
      loading: false,
      statisticList: [],
      rawList: [],
      categoryLabelMap: {
        salary: '工资',
        gift_income: '奖金',
        red_packet_income: '红包',
        reimbursement: '报销',
        shopping: '购物',
        clothing: '服饰',
        entertainment: '娱乐',
        transport: '交通',
        utilities: '水电气',
        dining: '餐饮',
        medical: '医疗',
        education: '教育',
        housing: '住房',
        others: '其他'
      },
      queryParams: {
        statisticType: "date",
        statisticKey: "",
        pageNum: 1,
        pageSize: 10
      },
      totalIncome: 0,
      totalExpense: 0,
      totalBalance: 0
    };
  },
  created() {
    this.loadCategoryDicts();
    this.getList();
  },
  methods: {
    async loadCategoryDicts() {
      const dictRes = await getDicts('finance_category').catch(() => null);
      const map = {};
      if (dictRes && dictRes.data) {
        dictRes.data.forEach(d => {
          if (d.dictValue) {
            map[String(d.dictValue).trim()] = d.dictLabel || d.dictValue;
          }
        });
      }
      // 合并静态与动态，动态覆盖静态
      this.categoryLabelMap = { ...this.categoryLabelMap, ...map };
    },
    /** 查询列表 */
    async getList() {
      this.loading = true;
      const type = this.queryParams.statisticType || "date";
      // 直接前端聚合（兼容后端返回空或权限受限）
      await this.fallbackAggregate(type);
      this.applyFilter();
    },
    async fallbackAggregate(statisticType) {
      const type = statisticType || "date";
      // 优先请求全量账目接口（需要相应权限），失败则退回当前用户账目
      const records = await request({
        url: '/system/record/all/list',
        method: 'get',
        params: { pageNum: 1, pageSize: 99999 }
      }).then(res => (res && res.rows) ? res.rows : []).catch(async () => {
        return request({
          url: '/system/record/list',
          method: 'get',
          params: { pageNum: 1, pageSize: 99999 }
        }).then(res => (res && res.rows) ? res.rows : []).catch(() => []);
      });

      const map = {};
      records.forEach(r => {
        if (!r) return;
        let key = '';
        if (type === 'category') {
          key = String(r.category || '未分类').trim();
        } else if (type === 'user') {
          key = r.userName || `用户${r.userId || ''}`;
        } else {
          const d = parseTime(r.recordDate, '{y}-{m}-{d}');
          key = d || String(r.recordDate || '').toString().substring(0, 10);
        }
        const income = String(r.type) === '1' ? Number(r.amount || 0) : 0;
        const expense = String(r.type) === '0' ? Number(r.amount || 0) : 0;
        if (!map[key]) {
          map[key] = { statisticKey: key, incomeAmount: 0, expenseAmount: 0 };
        }
        map[key].incomeAmount += income;
        map[key].expenseAmount += expense;
      });
      this.rawList = Object.values(map);
      this.statisticList = this.rawList;
      // 按日期降序 / 其他升序
      if (type === 'date') {
        this.statisticList.sort((a, b) => (b.statisticKey || '').localeCompare(a.statisticKey || ''));
      } else {
        this.statisticList.sort((a, b) => (a.statisticKey || '').localeCompare(b.statisticKey || ''));
      }
      this.calculateTotals();
      this.loading = false;
    },
    applyFilter() {
      const type = this.queryParams.statisticType || 'date';
      const kw = (this.queryParams.statisticKey || '').trim().toLowerCase();
      if (!kw) {
        this.statisticList = [...this.rawList];
      } else {
        this.statisticList = this.rawList.filter(item => {
          const key = item && item.statisticKey ? String(item.statisticKey).trim() : '';
          const display = type === 'category'
            ? (this.categoryLabelMap[key] || this.categoryLabelMap[key.toLowerCase()] || key)
            : key;
          return key.toLowerCase().includes(kw) || display.toLowerCase().includes(kw);
        });
      }
      this.calculateTotals();
    },
    /** 计算汇总 */
    calculateTotals() {
      this.totalIncome = 0;
      this.totalExpense = 0;
      (this.statisticList || []).forEach(item => {
        if (!item) return;
        const inc = parseFloat(item.incomeAmount || 0);
        const exp = parseFloat(item.expenseAmount || 0);
        this.totalIncome += isNaN(inc) ? 0 : inc;
        this.totalExpense += isNaN(exp) ? 0 : exp;
      });
      this.totalBalance = this.totalIncome - this.totalExpense;
    },
    /** 当前页数据 */
    currentPageList() {
      const start = (this.queryParams.pageNum - 1) * this.queryParams.pageSize;
      const end = start + this.queryParams.pageSize;
      return this.statisticList.slice(start, end);
    },
    /** 分页变更 */
    handlePageChange({ page, limit }) {
      this.queryParams.pageNum = page;
      this.queryParams.pageSize = limit;
    },
    /** 搜索按钮操作 */
    handleQuery() {
      if (!this.queryParams.statisticType) {
        this.queryParams.statisticType = "date";
      }
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.queryParams.statisticType = "date";
      this.queryParams.statisticKey = "";
      this.handleQuery();
    },
    /** 导出按钮操作（前端聚合结果导出 CSV，避免后端空表） */
    async handleExport() {
      this.$confirm('是否确认导出当前统计结果?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(async () => {
        // 确保最新数据
        await this.getList();
        const type = this.queryParams.statisticType || 'date';
        const typeLabel = { date: '按日期', category: '按类别', user: '按用户' }[type] || type;
        const rows = this.statisticList.map(item => {
          const key = item && item.statisticKey ? String(item.statisticKey).trim() : '';
          let displayKey = key;
          if (type === 'category') {
            displayKey = this.categoryLabelMap[key] || this.categoryLabelMap[key.toLowerCase()] || key;
          } else if (type === 'date') {
            // 统一日期格式 yyyy-MM-dd，前置制表符保持文本防止 Excel 解析异常显示 ####
            const normalized = key.replace(/\//g, '-');
            displayKey = `\t${normalized}`;
          }
          return [typeLabel, displayKey, item.incomeAmount || 0, item.expenseAmount || 0];
        });
        const header = ['统计类型', type === 'date' ? '日期' : (type === 'category' ? '类别' : '用户'), '收入总额', '支出总额'];
        const csv = [header, ...rows].map(r =>
          r.map(field => `"${String(field).replace(/"/g, '""')}"`).join(',')
        ).join('\n');
        const blob = new Blob(['\uFEFF' + csv], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = `statistic_${new Date().getTime()}.csv`;
        link.click();
        URL.revokeObjectURL(link.href);
      }).catch(() => {});
    }
  },
  computed: {
    pagedList() {
      const type = this.queryParams.statisticType || 'date';
      return this.currentPageList().map(item => {
        const key = item && item.statisticKey ? item.statisticKey : '';
        const normKey = String(key).trim();
        const displayKey = type === 'category'
          ? (this.categoryLabelMap[normKey] || this.categoryLabelMap[normKey.toLowerCase()] || normKey)
          : key;
        return {
          statisticKey: key,
          displayKey,
          incomeAmount: item && item.incomeAmount != null ? item.incomeAmount : 0,
          expenseAmount: item && item.expenseAmount != null ? item.expenseAmount : 0
        };
      });
    },
    keyLabel() {
      switch (this.queryParams.statisticType) {
        case 'category': return '类别';
        case 'user': return '用户';
        default: return '日期';
      }
    }
  }
};
</script>

<style scoped>
.mt20 {
  margin-top: 20px;
}
.mb20 {
  margin-bottom: 20px;
}
</style>
