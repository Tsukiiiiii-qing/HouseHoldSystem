import request from '@/utils/request'

// 查询家庭记事本列表
export function listNotebook(query) {
  return request({
    url: '/system/notebook/list',
    method: 'get',
    params: query
  })
}

// 查询家庭记事本详细
export function getNotebook(notebookId) {
  return request({
    url: '/system/notebook/' + notebookId,
    method: 'get'
  })
}

// 新增家庭记事本
export function addNotebook(data) {
  return request({
    url: '/system/notebook',
    method: 'post',
    data: data
  })
}

// 修改家庭记事本
export function updateNotebook(data) {
  return request({
    url: '/system/notebook',
    method: 'put',
    data: data
  })
}

// 删除家庭记事本
export function delNotebook(notebookId) {
  return request({
    url: '/system/notebook/' + notebookId,
    method: 'delete'
  })
}

// 导出家庭记事本
export function exportNotebook(query) {
  return request({
    url: '/system/notebook/export',
    method: 'post',
    params: query,
    responseType: 'blob'
  })
}
