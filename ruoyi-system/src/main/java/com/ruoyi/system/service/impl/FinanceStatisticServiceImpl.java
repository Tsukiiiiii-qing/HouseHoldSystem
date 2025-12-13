package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FinanceStatisticMapper;
import com.ruoyi.system.domain.FinanceStatistic;
import com.ruoyi.system.service.IFinanceStatisticService;

/**
 * 记账统计Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
@Service
public class FinanceStatisticServiceImpl implements IFinanceStatisticService 
{
    @Autowired
    private FinanceStatisticMapper financeStatisticMapper;

    /**
     * 查询记账统计
     * 
     * @param statisticId 记账统计主键
     * @return 记账统计
     */
    @Override
    public FinanceStatistic selectFinanceStatisticByStatisticId(Long statisticId)
    {
        return financeStatisticMapper.selectFinanceStatisticByStatisticId(statisticId);
    }

    /**
     * 查询记账统计列表
     * 
     * @param financeStatistic 记账统计
     * @return 记账统计
     */
    @Override
    public List<FinanceStatistic> selectFinanceStatisticList(FinanceStatistic financeStatistic)
    {
        return financeStatisticMapper.selectFinanceStatisticList(financeStatistic);
    }

    /**
     * 新增记账统计
     * 
     * @param financeStatistic 记账统计
     * @return 结果
     */
    @Override
    public int insertFinanceStatistic(FinanceStatistic financeStatistic)
    {
        return financeStatisticMapper.insertFinanceStatistic(financeStatistic);
    }

    /**
     * 修改记账统计
     * 
     * @param financeStatistic 记账统计
     * @return 结果
     */
    @Override
    public int updateFinanceStatistic(FinanceStatistic financeStatistic)
    {
        return financeStatisticMapper.updateFinanceStatistic(financeStatistic);
    }

    /**
     * 删除记账统计
     * 
     * @param statisticId 记账统计主键
     * @return 结果
     */
    @Override
    public int deleteFinanceStatisticByStatisticId(Long statisticId)
    {
        return financeStatisticMapper.deleteFinanceStatisticByStatisticId(statisticId);
    }

    /**
     * 批量删除记账统计
     * 
     * @param statisticIds 需要删除的数据主键集合
     * @return 结果
     */
    @Override
    public int deleteFinanceStatisticByStatisticIds(Long[] statisticIds)
    {
        return financeStatisticMapper.deleteFinanceStatisticByStatisticIds(statisticIds);
    }
}
