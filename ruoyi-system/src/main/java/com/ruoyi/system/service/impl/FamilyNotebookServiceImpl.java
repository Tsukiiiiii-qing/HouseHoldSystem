package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FamilyNotebookMapper;
import com.ruoyi.system.domain.FamilyNotebook;
import com.ruoyi.system.service.IFamilyNotebookService;

/**
 * 家庭记事本Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
@Service
public class FamilyNotebookServiceImpl implements IFamilyNotebookService 
{
    @Autowired
    private FamilyNotebookMapper familyNotebookMapper;

    /**
     * 查询家庭记事本
     * 
     * @param notebookId 家庭记事本主键
     * @return 家庭记事本
     */
    @Override
    public FamilyNotebook selectFamilyNotebookByNotebookId(Long notebookId)
    {
        return familyNotebookMapper.selectFamilyNotebookByNotebookId(notebookId);
    }

    /**
     * 查询家庭记事本列表
     * 
     * @param familyNotebook 家庭记事本
     * @return 家庭记事本
     */
    @Override
    public List<FamilyNotebook> selectFamilyNotebookList(FamilyNotebook familyNotebook)
    {
        return familyNotebookMapper.selectFamilyNotebookList(familyNotebook);
    }

    /**
     * 新增家庭记事本
     * 
     * @param familyNotebook 家庭记事本
     * @return 结果
     */
    @Override
    public int insertFamilyNotebook(FamilyNotebook familyNotebook)
    {
        return familyNotebookMapper.insertFamilyNotebook(familyNotebook);
    }

    /**
     * 修改家庭记事本
     * 
     * @param familyNotebook 家庭记事本
     * @return 结果
     */
    @Override
    public int updateFamilyNotebook(FamilyNotebook familyNotebook)
    {
        return familyNotebookMapper.updateFamilyNotebook(familyNotebook);
    }

    /**
     * 删除家庭记事本
     * 
     * @param notebookId 家庭记事本主键
     * @return 结果
     */
    @Override
    public int deleteFamilyNotebookByNotebookId(Long notebookId)
    {
        return familyNotebookMapper.deleteFamilyNotebookByNotebookId(notebookId);
    }

    /**
     * 批量删除家庭记事本
     * 
     * @param notebookIds 需要删除的数据主键集合
     * @return 结果
     */
    @Override
    public int deleteFamilyNotebookByNotebookIds(Long[] notebookIds)
    {
        return familyNotebookMapper.deleteFamilyNotebookByNotebookIds(notebookIds);
    }
}
