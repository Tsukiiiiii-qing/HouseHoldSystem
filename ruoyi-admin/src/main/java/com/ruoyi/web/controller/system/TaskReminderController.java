package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.TaskReminder;
import com.ruoyi.system.service.ITaskReminderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.SecurityUtils;

/**
 * 事物提醒Controller
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
@RestController
@RequestMapping("/system/reminder")
public class TaskReminderController extends BaseController
{
    @Autowired
    private ITaskReminderService taskReminderService;

    /**
     * 查询事物提醒列表
     */
    @PreAuthorize("@ss.hasPermi('system:reminder:list')")
    @GetMapping("/list")
    public AjaxResult list(TaskReminder taskReminder)
    {
        List<TaskReminder> list = taskReminderService.selectTaskReminderList(taskReminder);
        return success(list);
    }

    /**
     * 获取当前用户最早一条到期未完成提醒
     */
    @PreAuthorize("@ss.hasPermi('system:reminder:list')")
    @GetMapping("/dueReminder")
    public AjaxResult due()
    {
        Long userId = SecurityUtils.getUserId();
        return success(taskReminderService.selectDueTaskReminder(userId));
    }

    /**
     * 导出事物提醒列表
     */
    @PreAuthorize("@ss.hasPermi('system:reminder:export')")
    @Log(title = "事物提醒", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TaskReminder taskReminder)
    {
        List<TaskReminder> list = taskReminderService.selectTaskReminderList(taskReminder);
        ExcelUtil<TaskReminder> util = new ExcelUtil<TaskReminder>(TaskReminder.class);
        util.exportExcel(response, list, "事物提醒数据");
    }

    /**
     * 获取事物提醒详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:reminder:query')")
    @GetMapping(value = "/{reminderId}")
    public AjaxResult getInfo(@PathVariable("reminderId") Long reminderId)
    {
        return success(taskReminderService.selectTaskReminderByReminderId(reminderId));
    }

    /**
     * 新增事物提醒
     */
    @PreAuthorize("@ss.hasPermi('system:reminder:add')")
    @Log(title = "事物提醒", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskReminder taskReminder)
    {
        return toAjax(taskReminderService.insertTaskReminder(taskReminder));
    }

    /**
     * 修改事物提醒
     */
    @PreAuthorize("@ss.hasPermi('system:reminder:edit')")
    @Log(title = "事物提醒", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskReminder taskReminder)
    {
        return toAjax(taskReminderService.updateTaskReminder(taskReminder));
    }

    /**
     * 删除事物提醒
     */
    @PreAuthorize("@ss.hasPermi('system:reminder:remove')")
    @Log(title = "事物提醒", businessType = BusinessType.DELETE)
    @DeleteMapping("/{reminderIds}")
    public AjaxResult remove(@PathVariable Long[] reminderIds)
    {
        return toAjax(taskReminderService.deleteTaskReminderByReminderIds(reminderIds));
    }
}
