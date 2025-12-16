package com.ruoyi.system.mapper;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.system.domain.FinanceBudget;
import org.apache.ibatis.annotations.Param;

/**
 * 月度预算Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
public interface FinanceBudgetMapper 
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
     * 删除月度预算
     * 
     * @param budgetId 月度预算主键
     * @return 结果
     */
    public int deleteFinanceBudgetByBudgetId(Long budgetId);

    /**
     * 批量删除月度预算
     * 
     * @param budgetIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFinanceBudgetByBudgetIds(Long[] budgetIds);


    BigDecimal selectAmountByUserAndMonth(@Param("userId") Long userId,
                                          @Param("ym") String yearMonth);


    int countByUserAndMonth(@Param("userId") Long userId, @Param("ym") String yearMonth);
}
