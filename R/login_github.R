#' 不需要登录进入github
#'
#' @param path 路径名称
#'
#' @return 返回值
#' @include web2.R
#' @import httr
#' @import jsonlite
#' @export
#'
#' @examples resp <- api_github("/repos/hadley/httr")
api_github <- function(path) {
  url <- modify_url("https://api.github.com", path = path)
  res <-GET(url)
  if (web2_type(res) != 'json'){
    stop('返回数据类型必须是json！',call. = FALSE)
  
  }
  #获取其中的内容
   parsed <- web2_decode_json(res)
   
   if (http_error(res)) {
     stop(
       sprintf(
         "GitHub API request failed [%s]\n%s\n<%s>",
         status_code(res),
         parsed$message,
         parsed$documentation_url
       ),
       call. = FALSE
     )
   }
   
   structure(
     list(
       content = parsed,
       path = path,
       response = res
     ),
     class = "api_github"
   )
}


#' 定义github的定义对象
#'
#' @param x  api_github
#' @param ... 
#'
#' @return 返回值
#' @export
#'
#' @examples print();
print.api_github <- function(x, ...) {
  cat("<GitHub ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}




