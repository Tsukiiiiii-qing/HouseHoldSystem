package com.ruoyi.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 月度预算对象 finance_budget
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
public class FinanceBudget extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long budgetId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    @Excel(name = "用户")
    private String userName;

    /** 月份(yyyy-MM) */
    @Excel(name = "月份(yyyy-MM)")
    private String yearMonth;

    /** 预算金额 */
    @Excel(name = "预算金额")
    private BigDecimal amount;



    public void setBudgetId(Long budgetId) 
    {
        this.budgetId = budgetId;
    }

    public Long getBudgetId() 
    {
        return budgetId;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setYearMonth(String yearMonth) 
    {
        this.yearMonth = yearMonth;
    }

    public String getYearMonth() 
    {
        return yearMonth;
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
            .append("budgetId", getBudgetId())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("yearMonth", getYearMonth())
            .append("amount", getAmount())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
