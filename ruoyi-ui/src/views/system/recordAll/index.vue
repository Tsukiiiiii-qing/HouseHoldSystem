<template>
  <div class="app-container">
    <el-card shadow="never">
      <div slot="header" class="clearfix">
        <span>账目总览</span>
        <div style="float:right">
          <el-button type="warning" size="mini" icon="el-icon-download"
                     @click="handleExportAll"
                     v-hasPermi="['system:record:all:export']">
            导出
          </el-button>
        </div>
      </div>

      <el-form :model="query" ref="queryForm" size="small" :inline="true" label-width="68px">
        <el-form-item label="收支类型" prop="type">
          <el-select v-model="query.type" placeholder="请选择" clearable style="width: 120px">
            <el-option v-for="d in typeOptions" :key="d.dictValue" :label="d.dictLabel" :value="d.dictValue" />
          </el-select>
        </el-form-item>
        <el-form-item label="类别" prop="category">
          <el-select v-model="query.category" placeholder="请选择" clearable style="width: 160px">
            <el-option v-for="d in categoryOptions" :key="d.dictValue" :label="d.dictLabel" :value="d.dictValue" />
          </el-select>
        </el-form-item>
        <el-form-item label="日期" prop="recordDate">
          <el-date-picker clearable v-model="query.recordDate" type="date" value-format="yyyy-MM-dd" placeholder="请选择日期" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <el-table v-loading="loading" :data="list" border>
        <el-table-column label="用户" align="center" prop="userName" width="120" />
        <el-table-column label="收支类型" align="center" prop="type" width="100">
          <template slot-scope="scope">
            <span>{{ scope.row.type == 1 ? '收入' : (scope.row.type == 0 ? '支出' : '-') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="类别" align="center" prop="category" width="140">
          <template slot-scope="scope">
            <dict-tag :options="categoryTagOptions" :value="String(scope.row.category)" />
          </template>
        </el-table-column>
        <el-table-column label="金额" align="center" prop="amount" width="120" />
        <el-table-column label="日期" align="center" prop="recordDate" width="130">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.recordDate, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="备注" align="center" prop="remark" show-overflow-tooltip />
      </el-table>

      <pagination v-show="total>0"
                  :total="total"
                  :page.sync="query.pageNum"
                  :limit.sync="query.pageSize"
                  @pagination="getList" />
    </el-card>
  </div>
</template>

<script>
import { listRecordAll } from '@/api/system/record'
import { getDicts } from '@/api/system/dict/data'

export default {
  name: 'RecordAllReadonly',
  data() {
    return {
      loading: false,
      list: [],
      total: 0,
      query: {
        pageNum: 1,
        pageSize: 10,
        type: null,
        category: null,
        recordDate: null
      },
      typeOptions: [],
      categoryOptions: [],
      categoryTagOptions: []
    }
  },
  created() {
    this.loadDicts()
    this.getList()
  },
  methods: {
    loadDicts() {
      getDicts('finance_type').then(res => { this.typeOptions = res.data || [] })
      getDicts('finance_category').then(res => {
        const list = res.data || []
        this.categoryOptions = list
        this.categoryTagOptions = list.map(d => ({
          value: String(d.dictValue),
          label: d.dictLabel,
          raw: d
        }))
      })
    },
    getList() {
      this.loading = true
      listRecordAll(this.query).then(res => {
        this.list = res.rows
        this.total = res.total
        this.loading = false
      })
    },
    handleQuery() {
      this.query.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.query = { pageNum: 1, pageSize: 10, type: null, category: null, recordDate: null }
      this.getList()
    },
    handleExportAll() {
      // 复用全局下载工具
      this.download('system/record/all/export', { ...this.query }, `record_all_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
