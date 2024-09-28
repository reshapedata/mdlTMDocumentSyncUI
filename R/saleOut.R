#' saleOut生成器界面
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
#' saleOutUI()
saleOutUI <- function(tabTitle ='销售出库',
                   colTitles =c('数据同步','中台查询','显示区域'),
                   widthRates =c(6,6,12),
                   func_left = saleOutUI_left,
                   func_right =saleOutUI_right,
                   func_bottom = saleOutUI_bottom
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
#' saleOutUI_left()
saleOutUI_left <- function() {


  res <- tagList(
    tsui::layout_2C(x = tsui::mdl_text2(id = 'txt_saleOut_fyear_wms',label = '年份',value = ''),
                    y = tsui::mdl_text2(id = 'txt_saleOut_fmonth_wms',label = '月份',value = '') ),
    shiny::actionButton(inputId = 'btn_saleOut_sync_dms',label = '按年月同步至中台'),

    tsui::mdl_text2(id = 'txt_saleOut_fbillno_sync_erp',label = '单据编号',value = ''),

    shiny::actionButton(inputId = 'btn_saleOut_sync_erp',label = '按单据编号同步至ERP')




  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' saleOutUI_bottom()
saleOutUI_right <- function() {
  res <- tagList(

    tsui::mdl_text2(id = 'txt_saleOut_fbillno_view',label = '单据编号',value = ''),
    shiny::actionButton(inputId = 'btn_saleOut_fbillno_view_dms',label = '按单据编号查询'),
    tsui::mdl_date(id = 'date_tm_saleOut'),
    shiny::actionButton(inputId = 'btn_saleOut_date_view_dms',label = '按日期查询'),
    #tsui::mdl_download_button(id = 'dl_saleOut_dms',label = '下载查询数据')

  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' saleOutUI_bottom()
saleOutUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_saleOut'))

  )
  return(res)

}
