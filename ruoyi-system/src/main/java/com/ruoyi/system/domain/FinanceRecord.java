package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 家庭理财-账目对象 finance_record
 * 
 * @author ruoyi
 * @date 2025-12-08
 */
public class FinanceRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long recordId;

    /** 用户ID */
    private Long userId;

    /** 用户名称（冗余显示用） */
    @Excel(name = "用户")
    private String userName;

    /** 0=支出 1=收入 */
    @Excel(name = "0=支出 1=收入")
    private Long type;

    /** 消费类别 */
    @Excel(name = "消费类别")
    private String category;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal amount;

    /** 消费日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "消费日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordDate;

    public void setRecordId(Long recordId) 
    {
        this.recordId = recordId;
    }

    public Long getRecordId() 
    {
        return recordId;
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

    public void setType(Long type) 
    {
        this.type = type;
    }

    public Long getType() 
    {
        return type;
    }

    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }

    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }

    public void setRecordDate(Date recordDate) 
    {
        this.recordDate = recordDate;
    }

    public Date getRecordDate() 
    {
        return recordDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("userId", getUserId())
            .append("type", getType())
            .append("category", getCategory())
            .append("amount", getAmount())
            .append("recordDate", getRecordDate())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .toString();
    }
}
