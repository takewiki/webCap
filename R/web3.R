#' 创建一个session会话信息
#'
#' @param host 运行headless web driver host
#' @param timeout 超时时间
#' @param mode   调试模式
#'
#' @return 返回值
#' @import webdriver
#' @export
#'
#' @examples web3_session();
web3_session <- function(host='www.reshapedata.com',timeout=5000,mode='INFO'){
 # library(webdriver);
  dirver <- run_phantomjs(debugLevel = mode,timeout = timeout);
  port <- dirver$port;
  
  s <- Session$new(host = host,port = port);
  return(s)
}


#' 退出session会话
#'
#' @param session 会议 
#'
#' @return 返回值
#' @import webdriver
#' @export
#'
#' @examples web3_session_exit();
web3_session_exit <- function(session){
  session$delete();
  
}

#' 获取一个或多少element对照
#'
#' @param session 会话对照
#' @param css css选择器
#' @param linkText 连接文本
#' @param partial  部分连接文本
#' @param xpath  xpath
#' @param multiple 默认单选择FALSE
#'
#' @return 返回值
#' @import webdriver
#' @export
#'
#' @examples
web3_getElement <- function(session,css=NULL,linkText=NULL,partial=NULL,xpath=NULL,multiple=FALSE){
  if (multiple == FALSE){
    
    session$findElement(css = css, linkText = linkText,
                  partialLinkText = partial, xpath = xpath)

    
  }else{
    
    session$findElements(css = css, linkText = linkText,
                        partialLinkText = partial, xpath = xpath)
    
  }
  return(session)
}

#' session操作goto转向某个URL
#'
#' @param session  会话
#' @param url 地址
#'
#' @return 返回值
#' @import webdriver
#' @export
#'
#' @examples web3_session_goto();
web3_session_goto <- function(session,url=NULL){
  session$go(url)
  #是否需要返回，可能不需要?
  return(session)
}


#' 返回当前的URL文本信息
#'
#' @param session 会话信息
#'
#' @return 返回值
#' @export
#'
#' @examples web3_session_getCurrentUrl();
web3_session_getCurrentUrl <- function(session){
  session$getUrl()
}