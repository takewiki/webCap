
#' 网页的获取get方法
#'
#' @param url 网页地址
#'
#' @return 返回值
#' @import httr
#' @export
#'
#' @examples web_get();
web2_get <- function(url='https://search.51job.com/list/020000,000000,0000,00,9,99,%25E6%2595%25B0%25E6%258D%25AE%25E7%25A7%2591%25E5%25AD%25A6,2,1.html?lang=c&stype=1&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=99&companysize=99&lonlat=0%2C0&radius=-1&ord_field=0&confirmdate=9&fromType=4&dibiaoid=0&address=&line=&specialarea=00&from=&welfare='){
  page1 <- GET(url);
  return(page1)
  
}

# start of post area----
#' 处理post相应的功能wrapper
#'
#' @param url 网址
#' @param config 配置
#' @param ... 其他
#' @param body 表体
#' @param encode 编码
#' @param handle 处理
#'
#' @return 返回值
#' @export
#'
#' @examples web2_post();
web2_post <- function(url = NULL, config = list(), ..., body = NULL,
                      encode = c("multipart", "form", "json", "raw"), handle = NULL) {
  POST(url=url,config=config,...,body = body,encode=encode,handle = handle)
  
}



#' 通过头文件传递参数
#'
#' @param url post的目标URL
#' @param namedList 要传入的数据
#'
#' @return 返回值
#' @export
#' @import httr
#'
#' @examples web2_post_header();
web2_post_header <- function(url,namedList){
  
  web2_post(url = url, add_headers(.headers = unlist(namedList)));
}

#' 通过参数向url传递数据
#'
#' @param url post的目标url
#' @param namedList 数据
#'
#' @return 返回值
#' @import httr
#' @export
#'
#' @examples web2_post_query();
web2_post_query <- function(url,namedList){
  web2_post(url=url, query = namedList);
}


#' 通过表体传递数据
#'
#' @param url post的目标url
#' @param namedList  数据
#'
#' @return 返回值
#' @import httr
#' @export
#'
#' @examples web2_post_bodyForm();
web2_post_bodyForm <- function(url,namedList) {
  
  web2_post(url = url, body = namedList, encode = "form");
  
}

#' 通过body向url传递数据
#'
#' @param url post的目标url
#' @param namedList 数据
#'
#' @return 返回值
#' @import httr
#' @export 
#'
#' @examples  web2_post_bodyJson();
web2_post_bodyJson <- function(url,namedList) {
    web2_post(url = url, body = namedList, encode = "json");
  
}

# end of post area-------

#' 显示网页相关状态
#'
#' @param page 网页
#'
#' @return 返回值
#' @import knitr
#' @export
#'
#' @examples web_status()
web2_printStatus <-function(page){
  
  res <-http_status(page);
  res <- as.data.frame(res);
  
  res$code <- page$status_code;
  kable(res);
  # return(res);
  
}


#' 判断网页是否连接成功
#'
#' @param page 网页对象
#'
#' @return 返回值
#' @export
#'
#' @examples web_is.success();
web2_is.success <- function(page){
  page$status_code ==200
}


#' 获取网页的内容到一个向量
#'
#' @param page 网页
#' @param type 类型,默认为text，备用是raw
#' @param encoding 默认是UTF-8
#'
#' @return 返回值
#' @import readr
#' @export
#'
#' @examples web_body()
web2_body <- function(page,type='text',encoding="UTF-8"){
  
  if ( type =='text'){
    res <-content(page, "text", encoding = encoding)
  }else{
    content(page,'raw')->body;
    tmp_file <-tempfile();
    writeBin(body,tmp_file)
    res <- read_csv(tmp_file, locale = locale(encoding = encoding))
    
  
  }
  # res <- as.character(res)
  return(res)
}


#' 获取网页返回的数据类型xml or jason
#'
#' @param page 
#'
#' @return  返回值
#' @import httr
#' @export
#'
#' @examples web2_type();
web2_type <- function(page) {
  res <-http_type(page)
  res2 <-switch (res,
                 "application/json" = 'json',
                 "text/xml" = 'xml'
  )
  res2
  
}

#' 将response的json对象进行翻译list
#'
#' @param page 页面对照
#' @param encoding 编码
#'
#' @return 返回值
#' @import jsonlite
#' @export
#'
#' @examples web2_decode_json
web2_decode_json <- function(page,encoding='UTF-8'){
  res2 <-web2_body(page,type='text',encoding = encoding)
  res3 <-fromJSON(txt =res2 ,simplifyVector = FALSE)
  return(res3)
}


#' 如果访问网页对象发错误返回true
#'
#' @param page 
#'
#' @return 返回值
#' @import httr
#' @export
#'
#' @examples web2_error()
web2_error <-function(page){
  http_error(page)
}





