package com.ruoyi.system.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.FinanceDailyBudget;
import com.ruoyi.system.service.IFinanceDailyBudgetService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 每日预算Controller
 * 
 * @author ruoyi
 * @date 2025-12-14
 */
@RestController
@RequestMapping("/system/dailyBudget")
public class FinanceDailyBudgetController extends BaseController
{
    @Autowired
    private IFinanceDailyBudgetService financeDailyBudgetService;

    /**
     * 查询每日预算列表
     */
    @PreAuthorize("@ss.hasPermi('system:dailyBudget:list')")
    @GetMapping("/list")
    public TableDataInfo list(FinanceDailyBudget financeDailyBudget)
    {
        startPage();
        List<FinanceDailyBudget> list = financeDailyBudgetService.selectFinanceDailyBudgetList(financeDailyBudget);
        return getDataTable(list);
    }

    /**
     * 导出每日预算列表
     */
    @PreAuthorize("@ss.hasPermi('system:dailyBudget:export')")
    @Log(title = "每日预算", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FinanceDailyBudget financeDailyBudget)
    {
        List<FinanceDailyBudget> list = financeDailyBudgetService.selectFinanceDailyBudgetList(financeDailyBudget);
        ExcelUtil<FinanceDailyBudget> util = new ExcelUtil<FinanceDailyBudget>(FinanceDailyBudget.class);
        util.exportExcel(response, list, "每日预算数据");
    }

    /**
     * 获取每日预算详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:dailyBudget:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(financeDailyBudgetService.selectFinanceDailyBudgetById(id));
    }

    /**
     * 新增每日预算
     */
    @PreAuthorize("@ss.hasPermi('system:dailyBudget:add')")
    @Log(title = "每日预算", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FinanceDailyBudget financeDailyBudget)
    {
        return toAjax(financeDailyBudgetService.insertFinanceDailyBudget(financeDailyBudget));
    }

    /**
     * 修改每日预算
     */
    @PreAuthorize("@ss.hasPermi('system:dailyBudget:edit')")
    @Log(title = "每日预算", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FinanceDailyBudget financeDailyBudget)
    {
        return toAjax(financeDailyBudgetService.updateFinanceDailyBudget(financeDailyBudget));
    }

    /**
     * 删除每日预算
     */
    @PreAuthorize("@ss.hasPermi('system:dailyBudget:remove')")
    @Log(title = "每日预算", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(financeDailyBudgetService.deleteFinanceDailyBudgetByIds(ids));
    }

    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @GetMapping("/current") // /system/dailyBudget/current?date=yyyy-MM-dd
    public AjaxResult current(@RequestParam String date) {
        Long userId = SecurityUtils.getUserId();
        Date d = DateUtils.parseDate(date);
        BigDecimal amt = financeDailyBudgetService.selectAmountByUserAndDate(userId, d);
        return success(amt == null ? BigDecimal.ZERO : amt);
    }

    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @PostMapping("/self") // body: { budgetDate:'yyyy-MM-dd', amount:100, remark:'...' }
    public AjaxResult setSelf(@RequestBody FinanceDailyBudget body) {
        if (body.getBudgetDate() == null || body.getAmount() == null) return error("日期与金额不能为空");
        Long userId = SecurityUtils.getUserId();
        financeDailyBudgetService.upsert(userId, body.getBudgetDate(), body.getAmount(), body.getRemark());
        return success();
    }
}
