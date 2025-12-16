package com.ruoyi.system.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FinanceBudgetMapper;
import com.ruoyi.system.domain.FinanceBudget;
import com.ruoyi.system.service.IFinanceBudgetService;

/**
 * 月度预算Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
@Service
public class FinanceBudgetServiceImpl implements IFinanceBudgetService 
{
    @Autowired
    private FinanceBudgetMapper financeBudgetMapper;

    /**
     * 查询月度预算
     * 
     * @param budgetId 月度预算主键
     * @return 月度预算
     */
    @Override
    public FinanceBudget selectFinanceBudgetByBudgetId(Long budgetId)
    {
        return financeBudgetMapper.selectFinanceBudgetByBudgetId(budgetId);
    }

    /**
     * 查询月度预算列表
     * 
     * @param financeBudget 月度预算
     * @return 月度预算
     */
    @Override
    public List<FinanceBudget> selectFinanceBudgetList(FinanceBudget financeBudget)
    {
//        return financeBudgetMapper.selectFinanceBudgetList(financeBudget);
        Long loginUserId = SecurityUtils.getUserId();
        financeBudget.setUserId(loginUserId);
        return financeBudgetMapper.selectFinanceBudgetList(financeBudget);
    }

    /**
     * 新增月度预算
     * 
     * @param budget 月度预算
     * @return 结果
     */
//    @Override
//    public int insertFinanceBudget(FinanceBudget financeBudget)
//    {
//        financeBudget.setCreateTime(DateUtils.getNowDate());
//        return financeBudgetMapper.insertFinanceBudget(financeBudget);
//    }
    @Override
    public int insertFinanceBudget(FinanceBudget budget) {
        Long loginUserId = SecurityUtils.getUserId();
        // 仅本人：强制归属当前登录用户
        budget.setUserId(loginUserId);
        // 同用户同月份唯一
        if (financeBudgetMapper.countByUserAndMonth(loginUserId, budget.getYearMonth()) > 0) {
            throw new ServiceException("该月份预算已存在");
        }
        budget.setCreateTime(new Date());
        return financeBudgetMapper.insertFinanceBudget(budget);
    }

    /**
     * 修改月度预算
     * 
     * @param financeBudget 月度预算
     * @return 结果
     */
    @Override
    public int updateFinanceBudget(FinanceBudget financeBudget)
    {
//        financeBudget.setUpdateTime(DateUtils.getNowDate());
//        return financeBudgetMapper.updateFinanceBudget(financeBudget);
        Long loginUserId = SecurityUtils.getUserId();
        // 校验归属，防止编辑他人（也可按需放开给管理员）
        FinanceBudget db = financeBudgetMapper.selectFinanceBudgetByBudgetId(financeBudget.getBudgetId());
        if (db == null || !loginUserId.equals(db.getUserId())) {
            throw new ServiceException("无权操作他人预算");
        }
        financeBudget.setUserId(loginUserId); // 保持归属不变
        financeBudget.setUpdateTime(new Date());
        return financeBudgetMapper.updateFinanceBudget(financeBudget);
    }

    /**
     * 批量删除月度预算
     * 
     * @param budgetIds 需要删除的月度预算主键
     * @return 结果
     */
    @Override
    public int deleteFinanceBudgetByBudgetIds(Long[] budgetIds)
    {
        return financeBudgetMapper.deleteFinanceBudgetByBudgetIds(budgetIds);
    }

    /**
     * 删除月度预算信息
     * 
     * @param budgetId 月度预算主键
     * @return 结果
     */
    @Override
    public int deleteFinanceBudgetByBudgetId(Long budgetId)
    {
        return financeBudgetMapper.deleteFinanceBudgetByBudgetId(budgetId);
    }

    @Override
    public BigDecimal selectAmountByUserAndMonth(Long userId, String ym) {
        return financeBudgetMapper.selectAmountByUserAndMonth(userId, ym);
    }
}
