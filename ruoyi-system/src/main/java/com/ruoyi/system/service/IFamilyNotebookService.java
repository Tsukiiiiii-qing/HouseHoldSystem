package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.FamilyNotebook;

/**
 * 家庭记事本Service业务层接口
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
public interface IFamilyNotebookService 
{
    /**
     * 查询家庭记事本
     * 
     * @param notebookId 家庭记事本主键
     * @return 家庭记事本
     */
    public FamilyNotebook selectFamilyNotebookByNotebookId(Long notebookId);

    /**
     * 查询家庭记事本列表
     * 
     * @param familyNotebook 家庭记事本
     * @return 家庭记事本集合
     */
    public List<FamilyNotebook> selectFamilyNotebookList(FamilyNotebook familyNotebook);

    /**
     * 新增家庭记事本
     * 
     * @param familyNotebook 家庭记事本
     * @return 结果
     */
    public int insertFamilyNotebook(FamilyNotebook familyNotebook);

    /**
     * 修改家庭记事本
     * 
     * @param familyNotebook 家庭记事本
     * @return 结果
     */
    public int updateFamilyNotebook(FamilyNotebook familyNotebook);

    /**
     * 删除家庭记事本
     * 
     * @param notebookId 家庭记事本主键
     * @return 结果
     */
    public int deleteFamilyNotebookByNotebookId(Long notebookId);

    /**
     * 批量删除家庭记事本
     * 
     * @param notebookIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFamilyNotebookByNotebookIds(Long[] notebookIds);
}
