#' purchaseReturn生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' purchaseReturnUI()
purchaseReturnUI <- function(tabTitle ='采购退料同步',
                              colTitles =c('操作区域','操作区域','显示区域'),
                              widthRates =c(6,6,12),
                              func_left = purchaseReturnUI_left,
                              func_right =purchaseReturnUI_right,
                              func_bottom = purchaseReturnUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' purchaseReturnUI_left()
purchaseReturnUI_left <- function() {


  res <- tagList(
    tsui::layout_2C(x = tsui::mdl_text2(id = 'txt_purchaseReturn_fyear_wms',label = '年份',value = ''),
                    y = tsui::mdl_text2(id = 'txt_purchaseReturn_fmonth_wms',label = '月份',value = '') ),
    shiny::actionButton(inputId = 'btn_purchaseReturn_sync_dms',label = '按年月同步至中台'),

    tsui::mdl_text2(id = 'txt_purchaseReturn_fbillno_sync_erp',label = '单据编号',value = ''),

    shiny::actionButton(inputId = 'btn_purchaseReturn_sync_erp',label = '按单据编号同步至ERP')




  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' purchaseReturnUI_bottom()
purchaseReturnUI_right <- function() {
  res <- tagList(




    tsui::mdl_text2(id = 'txt_purchaseReturn_fbillno_view',label = '单据编号',value = ''),
    tsui::layout_2C(x=shiny::actionButton(inputId = 'btn_purchaseReturn_fbillno_view_dms',label = '按单据编号查询'),
                    y = tsui::mdl_download_button(id = 'dl_purchaseReturn_fbillno_dms',label = '下载查询数据')),

    tsui::mdl_date(id = 'date_tm_purchaseReturn',label = '退料日期'),
    shiny::actionButton(inputId = 'btn_purchaseReturn_date_view_dms',label = '按日期查询'),
    tsui::layout_2C(x=tsui::mdl_date(id = 'date_tm_purchaseReturn_FStartDate',label = '开始日期'),
                    y = tsui::mdl_date(id = 'date_tm_purchaseReturn_FEndDate',label = '结束日期')),
    tsui::layout_2C(x=shiny::actionButton(inputId = 'btn_purchaseReturn_dateRange_view_dms',label = '按日期范围查询'),
                    y = tsui::mdl_download_button(id = 'dl_purchaseReturn_dateRange_dms',label = '下载查询数据'))


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' purchaseReturnUI_bottom()
purchaseReturnUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_purchaseReturn'))

  )
  return(res)

}
