import request from '@/utils/request'

// 查询家庭理财-账目列表
export function listRecord(query) {
  return request({
    url: '/system/record/list',
    method: 'get',
    params: query
  })
}

// 查询家庭理财-账目详细
export function getRecord(recordId) {
  return request({
    url: '/system/record/' + recordId,
    method: 'get'
  })
}

// 新增家庭理财-账目
export function addRecord(data) {
  return request({
    url: '/system/record',
    method: 'post',
    data: data
  })
}

// 修改家庭理财-账目
export function updateRecord(data) {
  return request({
    url: '/system/record',
    method: 'put',
    data: data
  })
}

// 删除家庭理财-账目
export function delRecord(recordId) {
  return request({
    url: '/system/record/' + recordId,
    method: 'delete'
  })
}

// 每日结算
export function dailySummary(date) {
  return request({
    url: '/system/record/summary/daily',
    method: 'get',
    params: { date }
  })
}

// 每月结算
export function monthlySummary(ym) {
  return request({
    url: '/system/record/summary/monthly',
    method: 'get',
    params: { ym }
  })
}

// 全量列表（仅有权限者可用）
export function listRecordAll(query) {
  return request({
    url: '/system/record/all/list',
    method: 'get',
    params: query
  })
}

// 全量导出（仅有权限者可用）
export function exportRecordAll(query) {
  return request({
    url: '/system/record/all/export',
    method: 'post',
    data: query,
    responseType: 'blob'
  })
}
