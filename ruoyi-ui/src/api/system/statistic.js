import request from '@/utils/request'

// 查询记账统计列表
export function listStatistic(query) {
  return request({
    url: '/system/statistic/list',
    method: 'get',
    params: query
  })
}

// 获取统计数据（按类型）
export function getStatisticByType(statisticType) {
  return request({
    url: '/system/statistic/list',
    method: 'get',
    params: { statisticType: statisticType }
  })
}

// 查询记账统计详细
export function getStatistic(statisticId) {
  return request({
    url: '/system/statistic/' + statisticId,
    method: 'get'
  })
}

// 新增记账统计
export function addStatistic(data) {
  return request({
    url: '/system/statistic',
    method: 'post',
    data: data
  })
}

// 修改记账统计
export function updateStatistic(data) {
  return request({
    url: '/system/statistic',
    method: 'put',
    data: data
  })
}

// 删除记账统计
export function delStatistic(statisticId) {
  return request({
    url: '/system/statistic/' + statisticId,
    method: 'delete'
  })
}

// 导出记账统计
export function exportStatistic(query) {
  return request({
    url: '/system/statistic/export',
    method: 'post',
    params: query,
    responseType: 'blob'
  })
}
