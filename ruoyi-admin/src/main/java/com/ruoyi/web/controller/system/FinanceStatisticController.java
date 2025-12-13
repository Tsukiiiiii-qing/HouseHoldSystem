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
import com.ruoyi.system.domain.FinanceStatistic;
import com.ruoyi.system.service.IFinanceStatisticService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 记账统计Controller
 * 
 * @author ruoyi
 * @date 2025-12-09
 */
@RestController
@RequestMapping("/system/statistic")
public class FinanceStatisticController extends BaseController
{
    @Autowired
    private IFinanceStatisticService financeStatisticService;

    /**
     * 查询记账统计列表
     */
    @PreAuthorize("@ss.hasPermi('system:statistic:list')")
    @GetMapping("/list")
    public AjaxResult list(FinanceStatistic financeStatistic)
    {
        List<FinanceStatistic> list = financeStatisticService.selectFinanceStatisticList(financeStatistic);
        return success(list);
    }

    /**
     * 导出记账统计列表
     */
    @PreAuthorize("@ss.hasPermi('system:statistic:export')")
    @Log(title = "记账统计", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FinanceStatistic financeStatistic)
    {
        List<FinanceStatistic> list = financeStatisticService.selectFinanceStatisticList(financeStatistic);
        ExcelUtil<FinanceStatistic> util = new ExcelUtil<FinanceStatistic>(FinanceStatistic.class);
        util.exportExcel(response, list, "记账统计数据");
    }

    /**
     * 获取记账统计详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:statistic:query')")
    @GetMapping(value = "/{statisticId}")
    public AjaxResult getInfo(@PathVariable("statisticId") Long statisticId)
    {
        return success(financeStatisticService.selectFinanceStatisticByStatisticId(statisticId));
    }

    /**
     * 新增记账统计
     */
    @PreAuthorize("@ss.hasPermi('system:statistic:add')")
    @Log(title = "记账统计", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FinanceStatistic financeStatistic)
    {
        return toAjax(financeStatisticService.insertFinanceStatistic(financeStatistic));
    }

    /**
     * 修改记账统计
     */
    @PreAuthorize("@ss.hasPermi('system:statistic:edit')")
    @Log(title = "记账统计", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FinanceStatistic financeStatistic)
    {
        return toAjax(financeStatisticService.updateFinanceStatistic(financeStatistic));
    }

    /**
     * 删除记账统计
     */
    @PreAuthorize("@ss.hasPermi('system:statistic:remove')")
    @Log(title = "记账统计", businessType = BusinessType.DELETE)
    @DeleteMapping("/{statisticIds}")
    public AjaxResult remove(@PathVariable Long[] statisticIds)
    {
        return toAjax(financeStatisticService.deleteFinanceStatisticByStatisticIds(statisticIds));
    }
}
