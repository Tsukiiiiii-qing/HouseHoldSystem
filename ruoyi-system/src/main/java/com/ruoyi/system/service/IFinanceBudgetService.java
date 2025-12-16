package com.ruoyi.system.service;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.system.domain.FinanceBudget;

/**
 * 月度预算Service接口
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
public interface IFinanceBudgetService 
{
    /**
     * 查询月度预算
     * 
     * @param budgetId 月度预算主键
     * @return 月度预算
     */
    public FinanceBudget selectFinanceBudgetByBudgetId(Long budgetId);

    /**
     * 查询月度预算列表
     * 
     * @param financeBudget 月度预算
     * @return 月度预算集合
     */
    public List<FinanceBudget> selectFinanceBudgetList(FinanceBudget financeBudget);

    /**
     * 新增月度预算
     * 
     * @param financeBudget 月度预算
     * @return 结果
     */
    public int insertFinanceBudget(FinanceBudget financeBudget);

    /**
     * 修改月度预算
     * 
     * @param financeBudget 月度预算
     * @return 结果
     */
    public int updateFinanceBudget(FinanceBudget financeBudget);

    /**
     * 批量删除月度预算
     * 
     * @param budgetIds 需要删除的月度预算主键集合
     * @return 结果
     */
    public int deleteFinanceBudgetByBudgetIds(Long[] budgetIds);

    /**
     * 删除月度预算信息
     * 
     * @param budgetId 月度预算主键
     * @return 结果
     */
    public int deleteFinanceBudgetByBudgetId(Long budgetId);


    public BigDecimal selectAmountByUserAndMonth(Long userId, String ym);
}
