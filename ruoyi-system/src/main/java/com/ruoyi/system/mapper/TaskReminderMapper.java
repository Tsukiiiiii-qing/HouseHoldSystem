package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.TaskReminder;

/**
 * 事物提醒Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
public interface TaskReminderMapper 
{
    /**
     * 查询事物提醒
     * 
     * @param reminderId 事物提醒主键
     * @return 事物提醒
     */
    public TaskReminder selectTaskReminderByReminderId(Long reminderId);

    /**
     * 查询事物提醒列表
     * 
     * @param taskReminder 事物提醒
     * @return 事物提醒集合
     */
    public List<TaskReminder> selectTaskReminderList(TaskReminder taskReminder);

    /**
     * 新增事物提醒
     * 
     * @param taskReminder 事物提醒
     * @return 结果
     */
    public int insertTaskReminder(TaskReminder taskReminder);

    /**
     * 修改事物提醒
     * 
     * @param taskReminder 事物提醒
     * @return 结果
     */
    public int updateTaskReminder(TaskReminder taskReminder);

    /**
     * 删除事物提醒
     * 
     * @param reminderId 事物提醒主键
     * @return 结果
     */
    public int deleteTaskReminderByReminderId(Long reminderId);

    /**
     * 批量删除事物提醒
     * 
     * @param reminderIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTaskReminderByReminderIds(Long[] reminderIds);
}
