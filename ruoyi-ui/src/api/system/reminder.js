import request from '@/utils/request'

// 查询事物提醒列表
export function listReminder(query) {
  return request({
    url: '/system/reminder/list',
    method: 'get',
    params: query
  })
}

// 查询当前用户最早一条到期未完成提醒
export function getDueReminder() {
  return request({
    url: '/system/reminder/dueReminder',
    method: 'get'
  })
}

// 查询事物提醒详细
export function getReminder(reminderId) {
  return request({
    url: '/system/reminder/' + reminderId,
    method: 'get'
  })
}

// 新增事物提醒
export function addReminder(data) {
  return request({
    url: '/system/reminder',
    method: 'post',
    data: data
  })
}

// 修改事物提醒
export function updateReminder(data) {
  return request({
    url: '/system/reminder',
    method: 'put',
    data: data
  })
}

// 删除事物提醒
export function delReminder(reminderId) {
  return request({
    url: '/system/reminder/' + reminderId,
    method: 'delete'
  })
}

// 导出事物提醒
export function exportReminder(query) {
  return request({
    url: '/system/reminder/export',
    method: 'post',
    params: query,
    responseType: 'blob'
  })
}
