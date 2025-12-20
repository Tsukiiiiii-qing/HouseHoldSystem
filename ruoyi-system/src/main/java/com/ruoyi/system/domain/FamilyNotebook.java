package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 家庭记事本对象 family_notebook
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
public class FamilyNotebook extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记事本ID */
    private Long notebookId;

    /** 用户ID */
    private Long userId;

    /** 用户名称（冗余显示用） */
    // 仅用于导入/显示，不参与导出
    @Excel(name = "用户", type = Excel.Type.IMPORT)
    private String userName;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 标签 */
    @Excel(name = "标签")
    private String tag;

    public void setNotebookId(Long notebookId) 
    {
        this.notebookId = notebookId;
    }

    public Long getNotebookId() 
    {
        return notebookId;
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

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public void setTag(String tag) 
    {
        this.tag = tag;
    }

    public String getTag() 
    {
        return tag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("notebookId", getNotebookId())
            .append("userId", getUserId())
            .append("title", getTitle())
            .append("content", getContent())
            .append("tag", getTag())
            .append("createTime", getCreateTime())
            .append("remark", getRemark())
            .toString();
    }
}
