package com.ruoyi.system.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.FinanceRecord;
import com.ruoyi.system.service.IFinanceRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.vo.FinanceSummaryVO;


/**
 * 家庭理财-账目Controller
 * 
 * @author ruoyi
 * @date 2025-12-08
 */
@RestController
@RequestMapping("/system/record")
public class FinanceRecordController extends BaseController
{
    @Autowired
    private IFinanceRecordService financeRecordService;

    /**
     * 查询家庭理财-账目列表
     */
    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(FinanceRecord financeRecord)
    {
        startPage();
        List<FinanceRecord> list = financeRecordService.selectFinanceRecordList(financeRecord);
        return getDataTable(list);
    }

    /**
     * 导出家庭理财-账目列表
     */
    @PreAuthorize("@ss.hasPermi('system:record:export')")
    @Log(title = "家庭理财-账目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FinanceRecord financeRecord)
    {
        List<FinanceRecord> list = financeRecordService.selectFinanceRecordList(financeRecord);
        ExcelUtil<FinanceRecord> util = new ExcelUtil<FinanceRecord>(FinanceRecord.class);
        util.exportExcel(response, list, "家庭理财-账目数据");
    }

    /**
     * 获取家庭理财-账目详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:record:query')")
    @GetMapping(value = "/{recordId}")
    public AjaxResult getInfo(@PathVariable("recordId") Long recordId)
    {
        return success(financeRecordService.selectFinanceRecordByRecordId(recordId));
    }

    /**
     * 新增家庭理财-账目
     */
    @PreAuthorize("@ss.hasPermi('system:record:add')")
    @Log(title = "家庭理财-账目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FinanceRecord financeRecord)
    {
        return toAjax(financeRecordService.insertFinanceRecord(financeRecord));
    }

    /**
     * 修改家庭理财-账目
     */
    @PreAuthorize("@ss.hasPermi('system:record:edit')")
    @Log(title = "家庭理财-账目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FinanceRecord financeRecord)
    {
        return toAjax(financeRecordService.updateFinanceRecord(financeRecord));
    }

    /**
     * 删除家庭理财-账目
     */
    @PreAuthorize("@ss.hasPermi('system:record:remove')")
    @Log(title = "家庭理财-账目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(financeRecordService.deleteFinanceRecordByRecordIds(recordIds));
    }



    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @GetMapping("/summary/daily")
    public AjaxResult dailySummary(@RequestParam(required = false) String date) {
        Date day = (date == null) ? DateUtils.getNowDate() : DateUtils.parseDate(date);
        Long userId = SecurityUtils.getUserId();
        FinanceSummaryVO vo = financeRecordService.getDailySummary(day, userId);
        return AjaxResult.success(vo);
    }

    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @GetMapping("/summary/monthly")
    public AjaxResult monthlySummary(@RequestParam(required = false) String ym) {
        // ym: yyyy-MM
        Date monthDate = (ym == null) ? DateUtils.getNowDate() : DateUtils.parseDate(ym + "-01");
        Calendar cal = Calendar.getInstance();
        cal.setTime(monthDate);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date start = cal.getTime();
        cal.add(Calendar.MONTH, 1);
        cal.add(Calendar.DAY_OF_MONTH, -1);
        Date end = cal.getTime();

        Long userId = SecurityUtils.getUserId();
        FinanceSummaryVO vo = financeRecordService.getRangeSummary(start, end, userId);
        return AjaxResult.success(vo);
    }
}
