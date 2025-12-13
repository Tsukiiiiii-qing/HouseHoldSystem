package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.FamilyNotebook;
import com.ruoyi.system.service.IFamilyNotebookService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 家庭记事本Controller
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
@RestController
@RequestMapping("/system/notebook")
public class FamilyNotebookController extends BaseController
{
    @Autowired
    private IFamilyNotebookService familyNotebookService;

    /**
     * 查询家庭记事本列表
     */
    @PreAuthorize("@ss.hasPermi('system:notebook:list')")
    @GetMapping("/list")
    public AjaxResult list(FamilyNotebook familyNotebook)
    {
        List<FamilyNotebook> list = familyNotebookService.selectFamilyNotebookList(familyNotebook);
        return success(list);
    }

    /**
     * 导出家庭记事本列表
     */
    @PreAuthorize("@ss.hasPermi('system:notebook:export')")
    @Log(title = "家庭记事本", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FamilyNotebook familyNotebook)
    {
        List<FamilyNotebook> list = familyNotebookService.selectFamilyNotebookList(familyNotebook);
        ExcelUtil<FamilyNotebook> util = new ExcelUtil<FamilyNotebook>(FamilyNotebook.class);
        util.exportExcel(response, list, "家庭记事本数据");
    }

    /**
     * 获取家庭记事本详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:notebook:query')")
    @GetMapping(value = "/{notebookId}")
    public AjaxResult getInfo(@PathVariable("notebookId") Long notebookId)
    {
        return success(familyNotebookService.selectFamilyNotebookByNotebookId(notebookId));
    }

    /**
     * 新增家庭记事本
     */
    @PreAuthorize("@ss.hasPermi('system:notebook:add')")
    @Log(title = "家庭记事本", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FamilyNotebook familyNotebook)
    {
        return toAjax(familyNotebookService.insertFamilyNotebook(familyNotebook));
    }

    /**
     * 修改家庭记事本
     */
    @PreAuthorize("@ss.hasPermi('system:notebook:edit')")
    @Log(title = "家庭记事本", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FamilyNotebook familyNotebook)
    {
        return toAjax(familyNotebookService.updateFamilyNotebook(familyNotebook));
    }

    /**
     * 删除家庭记事本
     */
    @PreAuthorize("@ss.hasPermi('system:notebook:remove')")
    @Log(title = "家庭记事本", businessType = BusinessType.DELETE)
    @DeleteMapping("/{notebookIds}")
    public AjaxResult remove(@PathVariable Long[] notebookIds)
    {
        return toAjax(familyNotebookService.deleteFamilyNotebookByNotebookIds(notebookIds));
    }
}
