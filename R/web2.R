
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

