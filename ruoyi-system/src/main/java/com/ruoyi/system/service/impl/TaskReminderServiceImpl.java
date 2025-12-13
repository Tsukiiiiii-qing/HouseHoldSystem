package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.TaskReminderMapper;
import com.ruoyi.system.domain.TaskReminder;
import com.ruoyi.system.service.ITaskReminderService;

/**
 * 事物提醒Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
@Service
public class TaskReminderServiceImpl implements ITaskReminderService 
{
    @Autowired
    private TaskReminderMapper taskReminderMapper;

    /**
     * 查询事物提醒
     * 
     * @param reminderId 事物提醒主键
     * @return 事物提醒
     */
    @Override
    public TaskReminder selectTaskReminderByReminderId(Long reminderId)
    {
        return taskReminderMapper.selectTaskReminderByReminderId(reminderId);
    }

    /**
     * 查询事物提醒列表
     * 
     * @param taskReminder 事物提醒
     * @return 事物提醒
     */
    @Override
    public List<TaskReminder> selectTaskReminderList(TaskReminder taskReminder)
    {
        return taskReminderMapper.selectTaskReminderList(taskReminder);
    }

    /**
     * 新增事物提醒
     * 
     * @param taskReminder 事物提醒
     * @return 结果
     */
    @Override
    public int insertTaskReminder(TaskReminder taskReminder)
    {
        return taskReminderMapper.insertTaskReminder(taskReminder);
    }

    /**
     * 修改事物提醒
     * 
     * @param taskReminder 事物提醒
     * @return 结果
     */
    @Override
    public int updateTaskReminder(TaskReminder taskReminder)
    {
        return taskReminderMapper.updateTaskReminder(taskReminder);
    }

    /**
     * 删除事物提醒
     * 
     * @param reminderId 事物提醒主键
     * @return 结果
     */
    @Override
    public int deleteTaskReminderByReminderId(Long reminderId)
    {
        return taskReminderMapper.deleteTaskReminderByReminderId(reminderId);
    }

    /**
     * 批量删除事物提醒
     * 
     * @param reminderIds 需要删除的数据主键集合
     * @return 结果
     */
    @Override
    public int deleteTaskReminderByReminderIds(Long[] reminderIds)
    {
        return taskReminderMapper.deleteTaskReminderByReminderIds(reminderIds);
    }
}
