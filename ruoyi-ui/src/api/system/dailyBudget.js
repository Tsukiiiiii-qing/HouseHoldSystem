import request from '@/utils/request'

// 查询每日预算列表
export function listDailyBudget(query) {
  return request({
    url: '/system/dailyBudget/list',
    method: 'get',
    params: query
  })
}

// 查询每日预算详细
export function getDailyBudget(id) {
  return request({
    url: '/system/dailyBudget/' + id,
    method: 'get'
  })
}

// 新增每日预算
export function addDailyBudget(data) {
  return request({
    url: '/system/dailyBudget',
    method: 'post',
    data: data
  })
}

// 修改每日预算
export function updateDailyBudget(data) {
  return request({
    url: '/system/dailyBudget',
    method: 'put',
    data: data
  })
}

// 删除每日预算
export function delDailyBudget(id) {
  return request({
    url: '/system/dailyBudget/' + id,
    method: 'delete'
  })
}

export function getCurrentDailyBudget(date) {
  return request({
    url: '/system/dailyBudget/current',
    method: 'get',
    params: { date } // yyyy-MM-dd
  })
}

// 设置当天预算（当前登录用户）
export function setSelfDailyBudget(data) {
  // data: { budgetDate:'yyyy-MM-dd', amount: number, remark?: string }
  return request({
    url: '/system/dailyBudget/self',
    method: 'post',
    data
  })
}
