package com.ruoyi.system.controller;

import java.math.BigDecimal;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.FinanceBudget;
import com.ruoyi.system.service.IFinanceBudgetService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 月度预算Controller
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
@RestController
@RequestMapping("/system/budget")
public class FinanceBudgetController extends BaseController
{
    @Autowired
    private IFinanceBudgetService financeBudgetService;

    /**
     * 查询月度预算列表
     */
    @PreAuthorize("@ss.hasPermi('system:budget:list')")
    @GetMapping("/list")
    public TableDataInfo list(FinanceBudget financeBudget)
    {
        startPage();
        List<FinanceBudget> list = financeBudgetService.selectFinanceBudgetList(financeBudget);
        return getDataTable(list);
    }

    /**
     * 导出月度预算列表
     */
    @PreAuthorize("@ss.hasPermi('system:budget:export')")
    @Log(title = "月度预算", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FinanceBudget financeBudget)
    {
        List<FinanceBudget> list = financeBudgetService.selectFinanceBudgetList(financeBudget);
        ExcelUtil<FinanceBudget> util = new ExcelUtil<FinanceBudget>(FinanceBudget.class);
        util.exportExcel(response, list, "月度预算数据");
    }

    /**
     * 获取月度预算详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:budget:query')")
    @GetMapping(value = "/{budgetId}")
    public AjaxResult getInfo(@PathVariable("budgetId") Long budgetId)
    {
        return success(financeBudgetService.selectFinanceBudgetByBudgetId(budgetId));
    }

    /**
     * 新增月度预算
     */
    @PreAuthorize("@ss.hasPermi('system:budget:add')")
    @Log(title = "月度预算", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FinanceBudget financeBudget)
    {
        return toAjax(financeBudgetService.insertFinanceBudget(financeBudget));
    }

    /**
     * 修改月度预算
     */
    @PreAuthorize("@ss.hasPermi('system:budget:edit')")
    @Log(title = "月度预算", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FinanceBudget financeBudget)
    {
        return toAjax(financeBudgetService.updateFinanceBudget(financeBudget));
    }

    /**
     * 删除月度预算
     */
    @PreAuthorize("@ss.hasPermi('system:budget:remove')")
    @Log(title = "月度预算", businessType = BusinessType.DELETE)
	@DeleteMapping("/{budgetIds}")
    public AjaxResult remove(@PathVariable Long[] budgetIds)
    {
        return toAjax(financeBudgetService.deleteFinanceBudgetByBudgetIds(budgetIds));
    }

    @PreAuthorize("@ss.hasPermi('system:record:list')") // 用查询权限即可
    @GetMapping("/current") // 最终路径：/system/budget/current
    public AjaxResult current(@RequestParam String ym) { // ym: yyyy-MM
        Long userId = SecurityUtils.getUserId();
        BigDecimal amount = financeBudgetService.selectAmountByUserAndMonth(userId, ym);
        return success(amount == null ? BigDecimal.ZERO : amount);
    }
}
