package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 记账统计对象 finance_statistic
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
public class FinanceStatistic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 统计ID */
    private Long statisticId;

    /** 用户ID */
    private Long userId;

    /** 统计类型（date日期 category类别 user用户） */
    @Excel(name = "统计类型")
    private String statisticType;

    /** 统计键（日期/类别/用户名） */
    @Excel(name = "统计键")
    private String statisticKey;

    /** 收入总额 */
    @Excel(name = "收入总额")
    private BigDecimal incomeAmount;

    /** 支出总额 */
    @Excel(name = "支出总额")
    private BigDecimal expenseAmount;

    public void setStatisticId(Long statisticId) 
    {
        this.statisticId = statisticId;
    }

    public Long getStatisticId() 
    {
        return statisticId;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setStatisticType(String statisticType) 
    {
        this.statisticType = statisticType;
    }

    public String getStatisticType() 
    {
        return statisticType;
    }

    public void setStatisticKey(String statisticKey) 
    {
        this.statisticKey = statisticKey;
    }

    public String getStatisticKey() 
    {
        return statisticKey;
    }

    public void setIncomeAmount(BigDecimal incomeAmount) 
    {
        this.incomeAmount = incomeAmount;
    }

    public BigDecimal getIncomeAmount() 
    {
        return incomeAmount;
    }

    public void setExpenseAmount(BigDecimal expenseAmount) 
    {
        this.expenseAmount = expenseAmount;
    }

    public BigDecimal getExpenseAmount() 
    {
        return expenseAmount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("statisticId", getStatisticId())
            .append("userId", getUserId())
            .append("statisticType", getStatisticType())
            .append("statisticKey", getStatisticKey())
            .append("incomeAmount", getIncomeAmount())
            .append("expenseAmount", getExpenseAmount())
            .append("createTime", getCreateTime())
            .toString();
    }
}
