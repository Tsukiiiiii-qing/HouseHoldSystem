<template>
  <div class="app-container">
    <el-card shadow="never">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="日期" prop="budgetDate">
          <el-date-picker clearable
            v-model="queryParams.budgetDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预算金额" prop="amount">
          <el-input
            v-model="queryParams.amount"
            placeholder="请输入预算金额"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['system:dailyBudget:add']"
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['system:dailyBudget:export']"
          >导出</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList">
          <el-button-group>
            <el-tooltip content="卡片视图" placement="top">
              <el-button size="mini" :type="viewMode==='card'?'primary':''" icon="el-icon-menu" @click="viewMode='card'" />
            </el-tooltip>
            <el-tooltip content="表格视图" placement="top">
              <el-button size="mini" :type="viewMode==='table'?'primary':''" icon="el-icon-tickets" @click="viewMode='table'" />
            </el-tooltip>
          </el-button-group>
        </right-toolbar>
      </el-row>

      <!-- 卡片视图 -->
      <div v-if="viewMode==='card'">
        <el-empty v-if="!dailyBudgetList || dailyBudgetList.length === 0" description="暂无预算数据"></el-empty>
        <el-row :gutter="12" v-else>
          <el-col :span="cardSpan" v-for="item in dailyBudgetList" :key="item.id" style="margin-bottom: 12px;">
            <el-card shadow="hover" class="budget-card">
              <div class="card-header">
                <div class="left">
                  <i class="el-icon-date"></i>
                  <span class="date">{{ item.budgetDate }}</span>
                </div>
                <div class="right">
                  <el-tag type="success">￥{{ (item.amount || 0).toFixed(2) }}</el-tag>
                </div>
              </div>
              <div class="card-body">
                <div class="line"><i class="el-icon-user"></i> {{ item.userName || '-' }}</div>
                <div class="line remark" v-if="item.remark"><i class="el-icon-document"></i> {{ item.remark }}</div>
              </div>
              <div class="card-footer">
                <el-button type="text" size="mini" icon="el-icon-edit" @click="handleUpdate(item)">修改</el-button>
                <el-divider direction="vertical"></el-divider>
                <el-button type="text" size="mini" icon="el-icon-delete" @click="handleDelete(item)">删除</el-button>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </div>

      <!-- 表格视图 -->
      <el-table v-else v-loading="loading" :data="dailyBudgetList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="用户" align="center" prop="userName" />
        <el-table-column label="日期" align="center" prop="budgetDate" width="180">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.budgetDate, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="预算金额" align="center" prop="amount" />
        <el-table-column label="备注" align="center" prop="remark" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:dailyBudget:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:dailyBudget:remove']"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </el-card>

    <!-- 添加或修改每日预算对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="日期" prop="budgetDate">
          <el-date-picker clearable
            v-model="form.budgetDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="预算金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入预算金额" />
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
import { listDailyBudget, getDailyBudget, delDailyBudget, addDailyBudget, updateDailyBudget } from "@/api/system/dailyBudget"

export default {
  name: "DailyBudget",
  data() {
    return {
      viewMode: 'card',
      cardSpan: 6,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 每日预算表格数据
      dailyBudgetList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        budgetDate: null,
        amount: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        budgetDate: [
          { required: true, message: "日期不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "预算金额不能为空", trigger: "blur" }
        ],
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询每日预算列表 */
    getList() {
      this.loading = true
      listDailyBudget(this.queryParams).then(response => {
        this.dailyBudgetList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        userId: null,
        budgetDate: null,
        amount: null,
        remark: null,
        createTime: null,
        updateTime: null
      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加每日预算"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getDailyBudget(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改每日预算"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDailyBudget(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addDailyBudget(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除每日预算编号为"' + ids + '"的数据项？').then(function() {
        return delDailyBudget(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/dailyBudget/export', {
        ...this.queryParams
      }, `dailyBudget_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>

<style scoped>
.budget-card {
  border-radius: 8px;
}
.card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 12px;
  padding-bottom: 8px;
  border-bottom: 1px solid #f0f0f0;
}
.card-header .left {
  display: flex;
  align-items: center;
  gap: 6px;
  color: #606266;
}
.card-header .right {
  display: flex;
  align-items: center;
}
.card-header .right .el-tag {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  font-weight: 600;
  line-height: 1; /* 取消基线偏移，文本垂直居中 */
  padding: 6px 12px;
  vertical-align: middle;
}
.card-header .date {
  font-weight: bold;
  font-size: 18px;
  color: #303133;
}
.card-body {
  color: #606266;
  font-size: 15px;
  line-height: 28px;
  min-height: 56px; /* 至少两行高，避免错位 */
}
.card-body .line {
  display: flex;
  align-items: center;
}
.card-body .line.remark {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.card-body .line i {
  margin-right: 6px;
  color: #909399;
}
.card-footer {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  margin-top: 12px;
  padding-top: 8px;
  border-top: 1px solid #f0f0f0;
}
</style>
