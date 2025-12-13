<template>
  <div class="app-container">
    <el-row :gutter="10">
      <el-col :span="24">
        <el-card shadow="never">
          <div slot="header" class="clearfix">
            <span>家庭记事本</span>
            <div style="float:right">
              <el-button type="primary" size="mini" icon="el-icon-plus" @click="handleAdd" v-hasPermi="['system:notebook:add']">新增</el-button>
              <el-button type="warning" size="mini" icon="el-icon-download" @click="handleExport" v-hasPermi="['system:notebook:export']">导出</el-button>
            </div>
          </div>

          <!-- 搜索表单 -->
          <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" label-width="68px">
            <el-form-item label="标题" prop="title">
              <el-input v-model="queryParams.title" placeholder="请输入标题" clearable @keyup.enter="handleQuery" />
            </el-form-item>
            <el-form-item label="标签" prop="tag">
              <el-input v-model="queryParams.tag" placeholder="请输入标签" clearable @keyup.enter="handleQuery" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
          </el-form>

          <!-- 记事本列表 -->
          <el-table v-loading="loading" :data="notebookList" stripe border>
            <el-table-column label="标题" align="center" prop="title" width="200" show-overflow-tooltip />
            <el-table-column label="内容" align="center" prop="content" show-overflow-tooltip />
            <el-table-column label="标签" align="center" prop="tag" width="100">
              <template slot-scope="scope">
                <el-tag v-if="scope.row.tag">{{ scope.row.tag }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="创建时间" align="center" prop="createTime" width="180">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
              </template>
            </el-table-column>
            <el-table-column label="操作" align="center" width="160" class-name="small-padding fixed-width">
              <template slot-scope="scope">
                <el-button link type="primary" size="mini" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:notebook:edit']">修改</el-button>
                <el-button link type="danger" size="mini" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['system:notebook:remove']">删除</el-button>
              </template>
            </el-table-column>
          </el-table>

          <!-- 分页 -->
          <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />
        </el-card>
      </el-col>
    </el-row>

    <!-- 新增或修改对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="80%" @close="cancel">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input v-model="form.content" type="textarea" placeholder="请输入内容" rows="8" />
        </el-form-item>
        <el-form-item label="标签" prop="tag">
          <el-input v-model="form.tag" placeholder="请输入标签" />
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
import { listNotebook, getNotebook, delNotebook, addNotebook, updateNotebook } from "@/api/system/notebook";
import { parseTime } from "@/utils/ruoyi";
import pagination from "@/components/Pagination";
import { mapGetters } from "vuex";

export default {
  name: "Notebook",
  components: {
    pagination
  },
  computed: {
    ...mapGetters(["name", "avatar", "roles", "id"])
  },
  data() {
    return {
      loading: false,
      notebookList: [],
      total: 0,
      open: false,
      title: "",
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: "",
        tag: ""
      },
      form: {},
      rules: {
        title: [
          { required: true, message: "标题不能为空", trigger: "blur" }
        ],
        content: [
          { required: true, message: "内容不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      listNotebook(this.queryParams).then(response => {
        this.notebookList = response.data;
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
      this.title = "添加记事本";
      this.form = {
        userId: this.id
      };
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.open = true;
      this.title = "修改记事本";
      getNotebook(row.notebookId).then(response => {
        this.form = response.data;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.notebookId != undefined) {
            updateNotebook(this.form).then(response => {
              this.$message.success("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addNotebook(this.form).then(response => {
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
      this.$confirm('是否确认删除该记事本?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        return delNotebook(row.notebookId);
      }).then(() => {
        this.$message.success("删除成功");
        this.getList();
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.$confirm('是否确认导出所有记事本数据?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.download('/system/notebook/export', {
          ...this.queryParams
        }, `notebook_${new Date().getTime()}.xlsx`);
      }).catch(() => {});
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.resetForm("form");
    }
  }
};
</script>
