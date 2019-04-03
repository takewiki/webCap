#' 获取yahoo的token
#'
#' @param key  key
#' @param secret    secret
#'
#' @return return value
#' @import httr
#' @export
#'
#' @examples api_yahoo_token();
api_yahoo_token <- function(key="dj0yJmk9ZEp0d2J2MFRuakNQJmQ9WVdrOU0zaHRUMlJpTTJNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD00Nw--",
                            secret="82f339a41f71a3b4d9b840be427dde132e36d115") {
  

  # 1. Find OAuth settings for yahoo:
  #    https://developer.yahoo.com/oauth/guide/oauth-auth-flow.html
  yahoo_endpoint <- oauth_endpoints("yahoo")
  
  # 2. Register an application at https://developer.apps.yahoo.com/projects
  #    Replace key and secret below.
  yahoo_app <- oauth_app("yahoo",
                     key = key,
                     secret = secret)
  
  # 3. Get OAuth credentials
  yahoo_token <- oauth1.0_token(yahoo_endpoint, yahoo_endpoint)
  
  yahoo_gtoken <- config(token = yahoo_token);
  
  return(yahoo_gtoken)
  
}