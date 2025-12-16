package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 每日预算对象 finance_daily_budget
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
public class FinanceDailyBudget extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 用户 */
    @Excel(name = "用户")
    private String userName;

    /** 用户ID */
    private Long userId;

    /** 日期(yyyy-MM-dd) */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日期(yyyy-MM-dd)", width = 30, dateFormat = "yyyy-MM-dd")
    private Date budgetDate;

    /** 预算金额 */
    @Excel(name = "预算金额")
    private BigDecimal amount;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setBudgetDate(Date budgetDate) 
    {
        this.budgetDate = budgetDate;
    }

    public Date getBudgetDate() 
    {
        return budgetDate;
    }

    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("budgetDate", getBudgetDate())
            .append("amount", getAmount())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
