package com.ruoyi.system.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.ruoyi.system.domain.FinanceDailyBudget;

/**
 * 每日预算Service接口
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
public interface IFinanceDailyBudgetService 
{
    /**
     * 查询每日预算
     * 
     * @param id 每日预算主键
     * @return 每日预算
     */
    public FinanceDailyBudget selectFinanceDailyBudgetById(Long id);

    /**
     * 查询每日预算列表
     * 
     * @param financeDailyBudget 每日预算
     * @return 每日预算集合
     */
    public List<FinanceDailyBudget> selectFinanceDailyBudgetList(FinanceDailyBudget financeDailyBudget);

    /**
     * 新增每日预算
     * 
     * @param financeDailyBudget 每日预算
     * @return 结果
     */
    public int insertFinanceDailyBudget(FinanceDailyBudget financeDailyBudget);

    /**
     * 修改每日预算
     * 
     * @param financeDailyBudget 每日预算
     * @return 结果
     */
    public int updateFinanceDailyBudget(FinanceDailyBudget financeDailyBudget);

    /**
     * 批量删除每日预算
     * 
     * @param ids 需要删除的每日预算主键集合
     * @return 结果
     */
    public int deleteFinanceDailyBudgetByIds(Long[] ids);

    /**
     * 删除每日预算信息
     * 
     * @param id 每日预算主键
     * @return 结果
     */
    public int deleteFinanceDailyBudgetById(Long id);

    BigDecimal selectAmountByUserAndDate(Long userId, Date date);
    void upsert(Long userId, Date date, BigDecimal amount, String remark);
}
