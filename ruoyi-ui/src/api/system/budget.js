import request from '@/utils/request'

// 查询月度预算列表
export function listBudget(query) {
  return request({
    url: '/system/budget/list',
    method: 'get',
    params: query
  })
}

// 查询月度预算详细
export function getBudget(budgetId) {
  return request({
    url: '/system/budget/' + budgetId,
    method: 'get'
  })
}

// 新增月度预算
export function addBudget(data) {
  return request({
    url: '/system/budget',
    method: 'post',
    data: data
  })
}

// 修改月度预算
export function updateBudget(data) {
  return request({
    url: '/system/budget',
    method: 'put',
    data: data
  })
}

// 删除月度预算
export function delBudget(budgetId) {
  return request({
    url: '/system/budget/' + budgetId,
    method: 'delete'
  })
}


export function getCurrentBudget(ym) {
  return request({
    // url: '/system/record/budget/current',
    url: '/system/budget/current',
    method: 'get',
    params: { ym }
  })
}
