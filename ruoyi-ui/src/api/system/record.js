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
