package com.ruoyi.system.domain.vo;

import java.math.BigDecimal;
import java.util.List;

public class FinanceSummaryVO {
    private BigDecimal incomeTotal;   // 收入合计
    private BigDecimal expenseTotal;  // 支出合计
    private BigDecimal balance;       // 结余
    private List<CategoryStat> byCategory; // 按类别+类型汇总

    public static class CategoryStat {
        private String category; // 如 food
        private Integer type;    // 1=收入, 0=支出
        private BigDecimal total;
        public String getCategory() { return category; }
        public void setCategory(String category) { this.category = category; }
        public Integer getType() { return type; }
        public void setType(Integer type) { this.type = type; }
        public BigDecimal getTotal() { return total; }
        public void setTotal(BigDecimal total) { this.total = total; }
    }

    public BigDecimal getIncomeTotal() { return incomeTotal; }
    public void setIncomeTotal(BigDecimal incomeTotal) { this.incomeTotal = incomeTotal; }
    public BigDecimal getExpenseTotal() { return expenseTotal; }
    public void setExpenseTotal(BigDecimal expenseTotal) { this.expenseTotal = expenseTotal; }
    public BigDecimal getBalance() { return balance; }
    public void setBalance(BigDecimal balance) { this.balance = balance; }
    public List<CategoryStat> getByCategory() { return byCategory; }
    public void setByCategory(List<CategoryStat> byCategory) { this.byCategory = byCategory; }
}