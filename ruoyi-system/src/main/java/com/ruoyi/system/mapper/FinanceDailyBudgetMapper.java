package com.ruoyi.system.mapper;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import com.ruoyi.system.domain.FinanceDailyBudget;
import org.apache.ibatis.annotations.Param;

/**
 * 每日预算Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
public interface FinanceDailyBudgetMapper 
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
     * 删除每日预算
     * 
     * @param id 每日预算主键
     * @return 结果
     */
    public int deleteFinanceDailyBudgetById(Long id);

    /**
     * 批量删除每日预算
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFinanceDailyBudgetByIds(Long[] ids);

    int existsByUserAndDate(@Param("userId") Long userId, @Param("date") Date budgetDate);
    BigDecimal selectAmountByUserAndDate(@Param("userId") Long userId, @Param("date") Date budgetDate);
    int updateByUserAndDate(@Param("userId") Long userId,
                            @Param("date") Date budgetDate,
                            @Param("amount") BigDecimal amount,
                            @Param("remark") String remark,
                            @Param("updateTime") Date updateTime);
}
