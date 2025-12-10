package com.ruoyi.system.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.vo.FinanceSummaryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FinanceRecordMapper;
import com.ruoyi.system.domain.FinanceRecord;
import com.ruoyi.system.service.IFinanceRecordService;

/**
 * 家庭理财-账目Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-08
 */
@Service
public class FinanceRecordServiceImpl implements IFinanceRecordService 
{
    @Autowired
    private FinanceRecordMapper financeRecordMapper;

    /**
     * 查询家庭理财-账目
     * 
     * @param recordId 家庭理财-账目主键
     * @return 家庭理财-账目
     */
    @Override
    public FinanceRecord selectFinanceRecordByRecordId(Long recordId)
    {
        return financeRecordMapper.selectFinanceRecordByRecordId(recordId);
    }

    /**
     * 查询家庭理财-账目列表
     * 
     * @param financeRecord 家庭理财-账目
     * @return 家庭理财-账目
     */
    @Override
    public List<FinanceRecord> selectFinanceRecordList(FinanceRecord financeRecord)
    {
        return financeRecordMapper.selectFinanceRecordList(financeRecord);
    }

    /**
     * 新增家庭理财-账目
     * 
     * @param financeRecord 家庭理财-账目
     * @return 结果
     */
    @Override
    public int insertFinanceRecord(FinanceRecord financeRecord)
    {
        // 自动带入当前登录用户ID
        Long currentUserId = SecurityUtils.getUserId();
        financeRecord.setUserId(currentUserId);
        financeRecord.setCreateTime(DateUtils.getNowDate());
        return financeRecordMapper.insertFinanceRecord(financeRecord);
    }

    /**
     * 修改家庭理财-账目
     * 
     * @param financeRecord 家庭理财-账目
     * @return 结果
     */
    @Override
    public int updateFinanceRecord(FinanceRecord financeRecord)
    {
        return financeRecordMapper.updateFinanceRecord(financeRecord);
    }

    /**
     * 批量删除家庭理财-账目
     * 
     * @param recordIds 需要删除的家庭理财-账目主键
     * @return 结果
     */
    @Override
    public int deleteFinanceRecordByRecordIds(Long[] recordIds)
    {
        return financeRecordMapper.deleteFinanceRecordByRecordIds(recordIds);
    }

    /**
     * 删除家庭理财-账目信息
     * 
     * @param recordId 家庭理财-账目主键
     * @return 结果
     */
    @Override
    public int deleteFinanceRecordByRecordId(Long recordId)
    {
        return financeRecordMapper.deleteFinanceRecordByRecordId(recordId);
    }

    @Override
    public FinanceSummaryVO getDailySummary(Date day, Long userId) {
        Map<String, BigDecimal> sums = financeRecordMapper.selectSummary(userId, day, null, null);
        return buildSummaryVO(sums, financeRecordMapper.selectCategoryBreakdown(userId, day, null, null));
    }

    @Override
    public FinanceSummaryVO getRangeSummary(Date start, Date end, Long userId) {
        Map<String, BigDecimal> sums = financeRecordMapper.selectSummary(userId, null, start, end);
        return buildSummaryVO(sums, financeRecordMapper.selectCategoryBreakdown(userId, null, start, end));
    }

    private FinanceSummaryVO buildSummaryVO(Map<String, BigDecimal> sums, List<Map<String, Object>> rows) {
        BigDecimal income = val(sums, "income_total");
        BigDecimal expense = val(sums, "expense_total");
        FinanceSummaryVO vo = new FinanceSummaryVO();
        vo.setIncomeTotal(income);
        vo.setExpenseTotal(expense);
        vo.setBalance(income.subtract(expense));

        List<FinanceSummaryVO.CategoryStat> list = new ArrayList<>();
        for (Map<String, Object> r : rows) {
            FinanceSummaryVO.CategoryStat cs = new FinanceSummaryVO.CategoryStat();
            cs.setCategory((String) r.get("category"));
            Object t = r.get("type");
            cs.setType(t == null ? null : Integer.valueOf(String.valueOf(t)));
            Object total = r.get("total");
            cs.setTotal(total == null ? BigDecimal.ZERO : new BigDecimal(String.valueOf(total)));
            list.add(cs);
        }
        vo.setByCategory(list);
        return vo;
    }

    private BigDecimal val(Map<String, BigDecimal> map, String key) {
        if (map == null) return BigDecimal.ZERO;
        BigDecimal v = map.get(key);
        if (v == null) v = map.get(key.toUpperCase());
        if (v == null) v = map.get(key.toLowerCase());
        return v == null ? BigDecimal.ZERO : v;
    }
}
