package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.FinanceRecord;

/**
 * 家庭理财-账目Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-08
 */
public interface FinanceRecordMapper 
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
     * 删除家庭理财-账目
     * 
     * @param recordId 家庭理财-账目主键
     * @return 结果
     */
    public int deleteFinanceRecordByRecordId(Long recordId);

    /**
     * 批量删除家庭理财-账目
     * 
     * @param recordIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFinanceRecordByRecordIds(Long[] recordIds);
}
