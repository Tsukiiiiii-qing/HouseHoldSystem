package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FinanceRecord;
import com.ruoyi.system.domain.vo.FinanceSummaryVO;
import java.util.Date;
/**
 * 家庭理财-账目Service接口
 * 
 * @author ruoyi
 * @date 2025-12-08
 */
public interface IFinanceRecordService 
{
    /**
     * 查询家庭理财-账目
     * 
     * @param recordId 家庭理财-账目主键
     * @return 家庭理财-账目
     */
    public FinanceRecord selectFinanceRecordByRecordId(Long recordId);

    /**
     * 查询家庭理财-账目列表
     * 
     * @param financeRecord 家庭理财-账目
     * @return 家庭理财-账目集合
     */
    public List<FinanceRecord> selectFinanceRecordList(FinanceRecord financeRecord);

    /**
     * 新增家庭理财-账目
     * 
     * @param financeRecord 家庭理财-账目
     * @return 结果
     */
    public int insertFinanceRecord(FinanceRecord financeRecord);

    /**
     * 修改家庭理财-账目
     * 
     * @param financeRecord 家庭理财-账目
     * @return 结果
     */
    public int updateFinanceRecord(FinanceRecord financeRecord);

    /**
     * 批量删除家庭理财-账目
     * 
     * @param recordIds 需要删除的家庭理财-账目主键集合
     * @return 结果
     */
    public int deleteFinanceRecordByRecordIds(Long[] recordIds);

    /**
     * 删除家庭理财-账目信息
     * 
     * @param recordId 家庭理财-账目主键
     * @return 结果
     */
    public int deleteFinanceRecordByRecordId(Long recordId);

    FinanceSummaryVO getDailySummary(Date day, Long userId);
    FinanceSummaryVO getRangeSummary(Date start, Date end, Long userId); // 月度用
}
