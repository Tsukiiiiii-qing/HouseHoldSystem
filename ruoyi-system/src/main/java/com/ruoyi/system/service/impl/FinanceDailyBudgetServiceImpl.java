package com.ruoyi.system.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FinanceDailyBudgetMapper;
import com.ruoyi.system.domain.FinanceDailyBudget;
import com.ruoyi.system.service.IFinanceDailyBudgetService;

/**
 * 每日预算Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
@Service
public class FinanceDailyBudgetServiceImpl implements IFinanceDailyBudgetService 
{
    @Autowired
    private FinanceDailyBudgetMapper financeDailyBudgetMapper;

    /**
     * 查询每日预算
     * 
     * @param id 每日预算主键
     * @return 每日预算
     */
    @Override
    public FinanceDailyBudget selectFinanceDailyBudgetById(Long id)
    {
        return financeDailyBudgetMapper.selectFinanceDailyBudgetById(id);
    }

    /**
     * 查询每日预算列表
     * 
     * @param financeDailyBudget 每日预算
     * @return 每日预算
     */
    @Override
    public List<FinanceDailyBudget> selectFinanceDailyBudgetList(FinanceDailyBudget financeDailyBudget) {
        Long loginUserId = SecurityUtils.getUserId();
        financeDailyBudget.setUserId(loginUserId); // 只查本人
        return financeDailyBudgetMapper.selectFinanceDailyBudgetList(financeDailyBudget);
    }

    /**
     * 新增每日预算
     * 
     * @param financeDailyBudget 每日预算
     * @return 结果
     */
    @Override
    public int insertFinanceDailyBudget(FinanceDailyBudget financeDailyBudget)
    {
//        financeDailyBudget.setCreateTime(DateUtils.getNowDate());
//        return financeDailyBudgetMapper.insertFinanceDailyBudget(financeDailyBudget);
        Long loginUserId = SecurityUtils.getUserId();
        financeDailyBudget.setUserId(loginUserId); // 仅本人
        // 同用户同日唯一
        if (financeDailyBudgetMapper.existsByUserAndDate(loginUserId, financeDailyBudget.getBudgetDate()) > 0) {
            throw new ServiceException("该日期预算已存在");
        }
        financeDailyBudget.setCreateTime(new Date());
        return financeDailyBudgetMapper.insertFinanceDailyBudget(financeDailyBudget);
    }

    /**
     * 修改每日预算
     * 
     * @param budget 每日预算
     * @return 结果
     */
    @Override
    public int updateFinanceDailyBudget(FinanceDailyBudget budget) {
        Long loginUserId = SecurityUtils.getUserId();
        FinanceDailyBudget db = financeDailyBudgetMapper.selectFinanceDailyBudgetById(budget.getId());
        if (db == null || !loginUserId.equals(db.getUserId())) {
            throw new ServiceException("无权操作他人预算");
        }
        budget.setUserId(loginUserId);
        budget.setUpdateTime(new Date());
        return financeDailyBudgetMapper.updateFinanceDailyBudget(budget);
    }

    /**
     * 批量删除每日预算
     * 
     * @param ids 需要删除的每日预算主键
     * @return 结果
     */
    @Override
    public int deleteFinanceDailyBudgetByIds(Long[] ids)
    {
        return financeDailyBudgetMapper.deleteFinanceDailyBudgetByIds(ids);
    }

    /**
     * 删除每日预算信息
     * 
     * @param id 每日预算主键
     * @return 结果
     */
    @Override
    public int deleteFinanceDailyBudgetById(Long id)
    {
        return financeDailyBudgetMapper.deleteFinanceDailyBudgetById(id);
    }

    @Override
    public BigDecimal selectAmountByUserAndDate(Long userId, Date date) {
        return financeDailyBudgetMapper.selectAmountByUserAndDate(userId, date);
    }

    @Override
    public void upsert(Long userId, Date date, BigDecimal amount, String remark) {
        Integer exists = financeDailyBudgetMapper.existsByUserAndDate(userId, date);
        Date now = new Date();
        if (exists != null && exists > 0) {
            // 已存在：按 用户+日期 更新
            financeDailyBudgetMapper.updateByUserAndDate(userId, date, amount, remark, now);
        } else {
            // 不存在：插入
            com.ruoyi.system.domain.FinanceDailyBudget b = new com.ruoyi.system.domain.FinanceDailyBudget();
            b.setUserId(userId);
            b.setBudgetDate(date);
            b.setAmount(amount);
            b.setRemark(remark);
            b.setCreateTime(now);
            financeDailyBudgetMapper.insertFinanceDailyBudget(b);
        }
    }
}
