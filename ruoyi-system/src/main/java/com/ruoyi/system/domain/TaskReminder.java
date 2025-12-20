package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 事物提醒对象 task_reminder
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
public class TaskReminder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 提醒ID */
    private Long reminderId;

    /** 用户ID */
    private Long userId;

    /** 用户名称（冗余显示用） */
    @Excel(name = "用户")
    private String userName;

    /** 提醒标题 */
    @Excel(name = "提醒标题")
    private String reminderTitle;

    /** 提醒时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "提醒时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date reminderTime;

    /** 状态（0未完成 1已完成） */
    @Excel(name = "状态")
    private Long status;

    public void setReminderId(Long reminderId) 
    {
        this.reminderId = reminderId;
    }

    public Long getReminderId() 
    {
        return reminderId;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setReminderTitle(String reminderTitle) 
    {
        this.reminderTitle = reminderTitle;
    }

    public String getReminderTitle() 
    {
        return reminderTitle;
    }

    public void setReminderTime(Date reminderTime) 
    {
        this.reminderTime = reminderTime;
    }

    public Date getReminderTime() 
    {
        return reminderTime;
    }

    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("reminderId", getReminderId())
            .append("userId", getUserId())
            .append("reminderTitle", getReminderTitle())
            .append("reminderTime", getReminderTime())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("remark", getRemark())
            .toString();
    }
}
