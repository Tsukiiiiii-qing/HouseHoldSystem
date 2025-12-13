package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FinanceStatistic;

/**
 * 记账统计Service业务层接口
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
public interface IFinanceStatisticService 
{
    /**
     * 查询记账统计
     * 
     * @param statisticId 记账统计主键
     * @return 记账统计
     */
    public FinanceStatistic selectFinanceStatisticByStatisticId(Long statisticId);

    /**
     * 查询记账统计列表
     * 
     * @param financeStatistic 记账统计
     * @return 记账统计集合
     */
    public List<FinanceStatistic> selectFinanceStatisticList(FinanceStatistic financeStatistic);

    /**
     * 新增记账统计
     * 
     * @param financeStatistic 记账统计
     * @return 结果
     */
    public int insertFinanceStatistic(FinanceStatistic financeStatistic);

    /**
     * 修改记账统计
     * 
     * @param financeStatistic 记账统计
     * @return 结果
     */
    public int updateFinanceStatistic(FinanceStatistic financeStatistic);

    /**
     * 删除记账统计
     * 
     * @param statisticId 记账统计主键
     * @return 结果
     */
    public int deleteFinanceStatisticByStatisticId(Long statisticId);

    /**
     * 批量删除记账统计
     * 
     * @param statisticIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFinanceStatisticByStatisticIds(Long[] statisticIds);
}
