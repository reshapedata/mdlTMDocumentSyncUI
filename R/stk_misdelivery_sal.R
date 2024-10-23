#' stk_misdelivery_sal生成器界面
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
#' stk_misdelivery_salUI()
stk_misdelivery_salUI <- function(tabTitle ='其他出库-工程不良同步',
                                     colTitles =c('操作区域','操作区域','显示区域'),
                                     widthRates =c(6,6,12),
                                     func_left = stk_misdelivery_salUI_left,
                                     func_right =stk_misdelivery_salUI_right,
                                     func_bottom = stk_misdelivery_salUI_bottom
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
#' stk_misdelivery_salUI_left()
stk_misdelivery_salUI_left <- function() {


  res <- tagList(
    tsui::layout_2C(x = tsui::mdl_text2(id = 'txt_stk_misdelivery_sal_fyear_wms',label = '年份',value = ''),
                    y = tsui::mdl_text2(id = 'txt_stk_misdelivery_sal_fmonth_wms',label = '月份',value = '') ),
    shiny::actionButton(inputId = 'btn_stk_misdelivery_sal_sync_dms',label = '按年月同步至中台'),

    tsui::mdl_text2(id = 'txt_stk_misdelivery_sal_fbillno_sync_erp',label = '单据编号',value = ''),

    shiny::actionButton(inputId = 'btn_stk_misdelivery_sal_sync_erp',label = '按单据编号同步至ERP')




  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' stk_misdelivery_salUI_bottom()
stk_misdelivery_salUI_right <- function() {
  res <- tagList(




    tsui::mdl_text2(id = 'txt_stk_misdelivery_sal_fbillno_view',label = '主键ID',value = ''),
    tsui::layout_2C(x=shiny::actionButton(inputId = 'btn_stk_misdelivery_sal_fbillno_view_dms',label = '主键ID查询'),
                    y = tsui::mdl_download_button(id = 'dl_stk_misdelivery_sal_fbillno_dms',label = '下载查询数据')),

    tsui::mdl_date(id = 'date_tm_stk_misdelivery_sal',label = '操作时间'),
    shiny::actionButton(inputId = 'btn_stk_misdelivery_sal_date_view_dms',label = '按日期查询'),
    tsui::layout_2C(x=tsui::mdl_date(id = 'date_tm_stk_misdelivery_sal_FStartDate',label = '开始日期'),
                    y = tsui::mdl_date(id = 'date_tm_stk_misdelivery_sal_FEndDate',label = '结束日期')),
    tsui::layout_2C(x=shiny::actionButton(inputId = 'btn_stk_misdelivery_sal_dateRange_view_dms',label = '按日期范围查询'),
                    y = tsui::mdl_download_button(id = 'dl_stk_misdelivery_sal_dateRange_dms',label = '下载查询数据'))


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' stk_misdelivery_salUI_bottom()
stk_misdelivery_salUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_stk_misdelivery_sal'))

  )
  return(res)

}
