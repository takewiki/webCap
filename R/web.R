#' 获取web网页信息
#'
#' @param url 输入网页地址
#'
#' @return 返回值
#' @import rvest
#' @import xml2
#' @export
#'
#' @examples web_page()
web_page <- function(url="https://search.51job.com/list/020000,000000,0000,00,9,99,%25E6%2595%25B0%25E6%258D%25AE%25E7%25A7%2591%25E5%25AD%25A6,2,1.html?lang=c&stype=1&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=99&companysize=99&lonlat=0%2C0&radius=-1&ord_field=0&confirmdate=9&fromType=4&dibiaoid=0&address=&line=&specialarea=00&from=&welfare=") {
  
  res<- read_html(url);
  # class(res) <-'web_page'
  return(res)
}

#' 获取节点数据
#'
#' @param web_page  网页
#' @param node_selector 节点选择器
#' @param attr_name 属性名
#' @param node_loc 节点还是属性
#'
#' @return 返回值
#' @export
#'
#' @examples  web_data()
web_data <- function(web_page,node_selector=".el",attr_name="href",node_loc=TRUE){
  if (node_loc ==TRUE){
    res <- web_page %>% html_nodes(node_selector)  %>% html_text();
    
  }else{
    res <- web_page %>% html_nodes(node_selector)  %>% html_attr(attr_name);
    
  }
  return(res);
}