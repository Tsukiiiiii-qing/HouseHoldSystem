<template>
  <div class="app-container">
    <el-row :gutter="10">
      <!-- 左侧：收入 -->
      <el-col :span="12">
        <el-card shadow="never">
          <div slot="header" class="clearfix">
            <span>收入</span>
            <div style="float:right">
              <el-button type="primary" size="mini" icon="el-icon-plus" @click="handleAddIncome" v-hasPermi="['system:record:add']">新增收入</el-button>
              <el-button type="warning" size="mini" icon="el-icon-download" @click="handleExportIncome" v-hasPermi="['system:record:export']">导出</el-button>
            </div>
          </div>

          <el-form :model="incomeQuery" ref="incomeQueryForm" size="small" :inline="true" label-width="68px">
            <el-form-item label="类别" prop="category">
              <el-select v-model="incomeQuery.category" placeholder="请选择" clearable>
                <el-option v-for="d in incomeCategoryOptions" :key="d.dictValue" :label="d.dictLabel" :value="d.dictValue" />
              </el-select>
            </el-form-item>
            <el-form-item label="日期" prop="recordDate">
              <el-date-picker clearable v-model="incomeQuery.recordDate" type="date" value-format="yyyy-MM-dd" placeholder="请选择日期" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleIncomeQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetIncomeQuery">重置</el-button>
            </el-form-item>
          </el-form>

          <el-table v-loading="loadingIncome" :data="incomeList">

            <el-table-column label="用户" align="center" prop="userName" width="120" />
<!--            <el-table-column label="收支类型" align="center" prop="type" width="100">-->
<!--              <template slot-scope="scope">-->
<!--                <dict-tag :options="typeOptions" :value="String(scope.row.type)" />-->
<!--              </template>-->
<!--            </el-table-column>-->
            <el-table-column label="消费类别" align="center" prop="category" width="120">
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
            <el-table-column label="操作" align="center" width="160">
              <template slot-scope="scope">
                <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:record:edit']">修改</el-button>
                <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:record:remove']">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <pagination v-show="incomeTotal>0" :total="incomeTotal" :page.sync="incomeQuery.pageNum" :limit.sync="incomeQuery.pageSize" @pagination="getIncomeList" />
        </el-card>
      </el-col>

      <!-- 右侧：支出 -->
      <el-col :span="12">
        <el-card shadow="never">
          <div slot="header" class="clearfix">
            <span>支出</span>
            <div style="float:right">
              <el-button type="primary" size="mini" icon="el-icon-plus" @click="handleAddExpense" v-hasPermi="['system:record:add']">新增支出</el-button>
              <el-button type="warning" size="mini" icon="el-icon-download" @click="handleExportExpense" v-hasPermi="['system:record:export']">导出</el-button>
            </div>
          </div>

          <el-form :model="expenseQuery" ref="expenseQueryForm" size="small" :inline="true" label-width="68px">
            <el-form-item label="类别" prop="category">
              <el-select v-model="expenseQuery.category" placeholder="请选择" clearable>
                <el-option v-for="d in expenseCategoryOptions" :key="d.dictValue" :label="d.dictLabel" :value="d.dictValue" />
              </el-select>
            </el-form-item>
            <el-form-item label="日期" prop="recordDate">
              <el-date-picker clearable v-model="expenseQuery.recordDate" type="date" value-format="yyyy-MM-dd" placeholder="请选择日期" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleExpenseQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetExpenseQuery">重置</el-button>
            </el-form-item>
          </el-form>

          <el-table v-loading="loadingExpense" :data="expenseList">

            <el-table-column label="用户" align="center" prop="userName" width="120" />
<!--            <el-table-column label="收支类型" align="center" prop="type" width="100">-->
<!--              <template slot-scope="scope">-->
<!--                <dict-tag :options="typeOptions" :value="String(scope.row.type)" />-->
<!--              </template>-->
<!--            </el-table-column>-->
            <el-table-column label="消费类别" align="center" prop="category" width="120">
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
            <el-table-column label="操作" align="center" width="160">
              <template slot-scope="scope">
                <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:record:edit']">修改</el-button>
                <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:record:remove']">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <pagination v-show="expenseTotal>0" :total="expenseTotal" :page.sync="expenseQuery.pageNum" :limit.sync="expenseQuery.pageSize" @pagination="getExpenseList" />
        </el-card>
      </el-col>
    </el-row>

    <!-- 添加或修改对话框（共用） -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="收支类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择">
            <el-option v-for="d in typeOptions" :key="d.dictValue" :label="d.dictLabel" :value="d.dictValue" />
          </el-select>
        </el-form-item>
        <el-form-item label="消费类别" prop="category">
          <el-select v-model="form.category" placeholder="请选择">
            <el-option v-for="d in dialogCategoryOptions" :key="d.dictValue" :label="d.dictLabel" :value="d.dictValue" />
          </el-select>
        </el-form-item>
        <el-form-item label="金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入金额" />
        </el-form-item>
        <el-form-item label="日期" prop="recordDate">
          <el-date-picker clearable v-model="form.recordDate" type="date" value-format="yyyy-MM-dd" placeholder="请选择日期" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRecord, getRecord, delRecord, addRecord, updateRecord } from "@/api/system/record"
import { getDicts } from "@/api/system/dict/data"

export default {
  name: "RecordSplit",
  computed: {
    dialogCategoryOptions() {
      const t = this.form.type
      const isIncome = t === '1' || t === 1
      return isIncome ? this.incomeCategoryOptions : this.expenseCategoryOptions
    }
  },
  data() {
    return {
      // 字典
      typeOptions: [],
      categoryOptions: [],        // 全部类别
      incomeCategoryOptions: [],  // 收入类别（dict_sort >= 100）
      expenseCategoryOptions: [], // 支出类别（dict_sort < 100）
      // 左：收入
      loadingIncome: true,
      incomeList: [],
      categoryTagOptions: [],
      incomeTotal: 0,
      incomeQuery: {
        pageNum: 1,
        pageSize: 10,
        category: null,
        recordDate: null
      },
      // 右：支出
      loadingExpense: true,
      expenseList: [],
      expenseTotal: 0,
      expenseQuery: {
        pageNum: 1,
        pageSize: 10,
        category: null,
        recordDate: null
      },
      // 弹窗
      title: "",
      open: false,
      form: {},
      rules: {
        // type: [{ required: true, message: "收支类型不能为空", trigger: "change" }],
        category: [{ required: true, message: "消费类别不能为空", trigger: "change" }],
        amount: [{ required: true, message: "金额不能为空", trigger: "blur" }],
        recordDate: [{ required: true, message: "日期不能为空", trigger: "blur" }],
      }
    }
  },
  created() {
    this.loadDicts()
    this.getIncomeList()
    this.getExpenseList()
  },
  methods: {
    loadDicts() {
      getDicts('finance_type').then(res => {
        this.typeOptions = res.data || []
      })
      getDicts('finance_category').then(res => {
        const list = res.data || []
        this.categoryOptions = list
        const getSort = d => Number(d.dictSort != null ? d.dictSort : (d.dict_sort != null ? d.dict_sort : 0))
        this.incomeCategoryOptions = list.filter(d => getSort(d) >= 100)
        this.expenseCategoryOptions = list.filter(d => getSort(d) < 100)
        this.categoryTagOptions = list.map(d => ({
          value: String(d.dictValue),
          label: d.dictLabel,
          raw: d
        }))
      })
    },
    // 收入
    getIncomeList() {
      this.loadingIncome = true
      listRecord({ ...this.incomeQuery, type: '1' }).then(res => {
        this.incomeList = res.rows
        this.incomeTotal = res.total
        this.loadingIncome = false
      })
    },
    handleIncomeQuery() {
      this.incomeQuery.pageNum = 1
      this.getIncomeList()
    },
    resetIncomeQuery() {
      this.incomeQuery = { pageNum: 1, pageSize: 10, category: null, recordDate: null }
      this.getIncomeList()
    },
    handleAddIncome() {
      this.resetFormModel()
      this.form.type = '1'
      this.title = '新增收入'
      this.open = true
    },
    handleExportIncome() {
      this.download('system/record/export', { ...this.incomeQuery, type: '1' }, `income_${new Date().getTime()}.xlsx`)
    },
    // 支出
    getExpenseList() {
      this.loadingExpense = true
      listRecord({ ...this.expenseQuery, type: '0' }).then(res => {
        this.expenseList = res.rows
        this.expenseTotal = res.total
        this.loadingExpense = false
      })
    },
    handleExpenseQuery() {
      this.expenseQuery.pageNum = 1
      this.getExpenseList()
    },
    resetExpenseQuery() {
      this.expenseQuery = { pageNum: 1, pageSize: 10, category: null, recordDate: null }
      this.getExpenseList()
    },
    handleAddExpense() {
      this.resetFormModel()
      this.form.type = '0'
      this.title = '新增支出'
      this.open = true
    },
    handleExportExpense() {
      this.download('system/record/export', { ...this.expenseQuery, type: '0' }, `expense_${new Date().getTime()}.xlsx`)
    },
    // 公共
    cancel() {
      this.open = false
      this.resetForm('form')
    },
    resetFormModel() {
      this.form = {
        recordId: null,
        userId: null,
        type: null,
        category: null,
        amount: null,
        recordDate: null,
        remark: null
      }
      this.resetForm('form')
    },
    handleUpdate(row) {
      getRecord(row.recordId).then(res => {
        this.form = res.data
        this.title = '修改账目'
        this.open = true
      })
    },
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (!valid) return
        const req = this.form.recordId ? updateRecord(this.form) : addRecord(this.form)
        req.then(() => {
          this.$modal.msgSuccess(this.form.recordId ? '修改成功' : '新增成功')
          this.open = false
          this.getIncomeList()
          this.getExpenseList()
        })
      })
    },
    handleDelete(row) {
      this.$modal.confirm('是否确认删除账目编号为"' + row.recordId + '"的数据项？').then(() => {
        return delRecord(row.recordId)
      }).then(() => {
        this.$modal.msgSuccess('删除成功')
        this.getIncomeList()
        this.getExpenseList()
      }).catch(() => {})
    }
  }
}
</script>
