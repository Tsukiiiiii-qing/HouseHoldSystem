<template>
  <div class="app-container">
    <el-row :gutter="10">
      <el-col :span="24">
        <el-card shadow="never">
          <div slot="header" class="clearfix">
            <span>事物提醒</span>
            <div style="float:right">
              <el-button type="primary" size="mini" icon="el-icon-plus" @click="handleAdd" v-hasPermi="['system:reminder:add']">新增</el-button>
              <el-button type="warning" size="mini" icon="el-icon-download" @click="handleExport" v-hasPermi="['system:reminder:export']">导出</el-button>
            </div>
          </div>

          <!-- 搜索表单 -->
          <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" label-width="100px">
            <el-form-item label="提醒标题" prop="reminderTitle">
              <el-input v-model="queryParams.reminderTitle" placeholder="请输入提醒标题" clearable @keyup.enter="handleQuery" />
            </el-form-item>
            <el-form-item label="状态" prop="status">
              <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
                <el-option label="未完成" value="0" />
                <el-option label="已完成" value="1" />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
          </el-form>

          <!-- 提醒列表 -->
          <el-table v-loading="loading" :data="reminderList" stripe border>
            <el-table-column label="提醒标题" align="center" prop="reminderTitle" width="200" show-overflow-tooltip />
            <el-table-column label="提醒时间" align="center" prop="reminderTime" width="180">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.reminderTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
              </template>
            </el-table-column>
            <el-table-column label="状态" align="center" prop="status" width="100">
              <template slot-scope="scope">
                <el-tag v-if="scope.row.status == 0" type="info">未完成</el-tag>
                <el-tag v-else type="success">已完成</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="创建时间" align="center" prop="createTime" width="180">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>
            <el-table-column label="操作" align="center" width="160" class-name="small-padding fixed-width">
              <template slot-scope="scope">
                <el-button link type="primary" size="mini" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:reminder:edit']">修改</el-button>
                <el-button link type="danger" size="mini" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:reminder:remove']">删除</el-button>
              </template>
            </el-table-column>
          </el-table>

          <!-- 分页 -->
          <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />
        </el-card>
      </el-col>
    </el-row>

    <!-- 新增或修改对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="70%" @close="cancel">
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="提醒标题" prop="reminderTitle">
          <el-input v-model="form.reminderTitle" placeholder="请输入提醒标题" />
        </el-form-item>
        <el-form-item label="提醒时间" prop="reminderTime">
          <el-date-picker v-model="form.reminderTime" type="datetime" placeholder="选择提醒时间" value-format="yyyy-MM-dd HH:mm:ss" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio :label="0">未完成</el-radio>
            <el-radio :label="1">已完成</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" rows="3" />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { listReminder, getReminder, delReminder, addReminder, updateReminder } from "@/api/system/reminder";
import { parseTime } from "@/utils/ruoyi";
import pagination from "@/components/Pagination";
import { mapGetters } from "vuex";

export default {
  name: "Reminder",
  components: {
    pagination
  },
  computed: {
    ...mapGetters(["name", "avatar", "roles", "id"])
  },
  data() {
    return {
      loading: false,
      reminderList: [],
      total: 0,
      open: false,
      title: "",
      reminderUpdateHandler: null,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        reminderTitle: "",
        status: ""
      },
      form: {},
      rules: {
        reminderTitle: [
          { required: true, message: "提醒标题不能为空", trigger: "blur" }
        ],
        reminderTime: [
          { required: true, message: "提醒时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.reminderUpdateHandler = () => this.handleExternalUpdate();
    window.addEventListener('reminder-updated', this.reminderUpdateHandler);
    const reminderId = this.$route.query && this.$route.query.reminderId;
    if (reminderId) {
      this.handleUpdate({ reminderId });
      this.$router.replace({ path: this.$route.path, query: {} });
    }
  },
  beforeDestroy() {
    sessionStorage.removeItem('taskReminderEditing');
    if (this.reminderUpdateHandler) {
      window.removeEventListener('reminder-updated', this.reminderUpdateHandler);
    }
  },
  watch: {
    '$route.query.reminderId'(reminderId) {
      if (reminderId) {
        this.handleUpdate({ reminderId });
        this.$router.replace({ path: this.$route.path, query: {} });
      }
    },
    open(val) {
      if (val) {
        sessionStorage.setItem('taskReminderEditing', '1');
      } else {
        sessionStorage.removeItem('taskReminderEditing');
      }
    }
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      listReminder(this.queryParams).then(response => {
        this.reminderList = response.data;
        this.total = response.total;
        this.loading = false;
      }).catch(() => {
        this.loading = false;
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.open = true;
      this.title = "添加事物提醒";
      this.form = {
        userId: this.id,
        status: 0
      };
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.open = true;
      this.title = "修改事物提醒";
      getReminder(row.reminderId).then(response => {
        this.form = response.data;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.reminderId != undefined) {
            updateReminder(this.form).then(response => {
              this.$message.success("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addReminder(this.form).then(response => {
              this.$message.success("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      this.$confirm('是否确认删除该提醒?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        return delReminder(row.reminderId);
      }).then(() => {
        this.$message.success("删除成功");
        this.getList();
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$confirm('是否确认导出所有提醒数据?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.download('/system/reminder/export', {
          ...this.queryParams
        }, `reminder_${new Date().getTime()}.xlsx`);
      }).catch(() => {});
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.resetForm("form");
    },
    /** 外部完成后刷新列表（来自全局弹窗） */
    handleExternalUpdate() {
      this.getList();
    }
  }
};
</script>
