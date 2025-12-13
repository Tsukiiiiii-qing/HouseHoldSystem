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
                <el-option label="按日期统计" value="date" />
                <el-option label="按类别统计" value="category" />
                <el-option label="按用户统计" value="user" />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">查询</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
          </el-form>

          <!-- 统计表格 -->
          <el-table v-loading="loading" :data="statisticList" stripe border>
            <el-table-column label="统计项目" align="center" prop="statisticKey" width="200" />
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
            <el-table-column label="创建时间" align="center" prop="createTime" width="180">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>
          </el-table>

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
import { listStatistic, getStatistic, delStatistic, addStatistic, updateStatistic } from "@/api/system/statistic";
import { parseTime } from "@/utils/ruoyi";

export default {
  name: "Statistic",
  data() {
    return {
      loading: false,
      statisticList: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        statisticType: ""
      },
      totalIncome: 0,
      totalExpense: 0,
      totalBalance: 0
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      listStatistic(this.queryParams).then(response => {
        this.statisticList = response.data;
        this.calculateTotals();
        this.loading = false;
      }).catch(() => {
        this.loading = false;
      });
    },
    /** 计算汇总 */
    calculateTotals() {
      this.totalIncome = 0;
      this.totalExpense = 0;
      this.statisticList.forEach(item => {
        this.totalIncome += parseFloat(item.incomeAmount || 0);
        this.totalExpense += parseFloat(item.expenseAmount || 0);
      });
      this.totalBalance = this.totalIncome - this.totalExpense;
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.queryParams.statisticType = "";
      this.handleQuery();
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$confirm('是否确认导出所有统计数据?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.download('/system/statistic/export', {
          ...this.queryParams
        }, `statistic_${new Date().getTime()}.xlsx`);
      }).catch(() => {});
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
