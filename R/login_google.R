#' 获取google的token
#'
#' @param key key
#' @param secret  secret
#'
#' @return 返回值
#' @export
#'
#' @examples  api_google_token();
api_google_token <- function(key="16795585089.apps.googleusercontent.com",secret= "hlJNgK73GjUXILBQvyvOyurl") {
  
  # 1. Find OAuth settings for google:
  #    https://developers.google.com/accounts/docs/OAuth2InstalledApp
  google_endpoint <-oauth_endpoints("google")
  
  # 2. Register an application at https://cloud.google.com/console#/project

  google_app <- oauth_app("google",
                     key = key,
                     secret = secret)
  
  # 3. Get OAuth credentials
  google_token <- oauth2.0_token(google_endpoint, google_app,
                                 scope = "https://www.googleapis.com/auth/userinfo.profile")
  
   gtoken <- config(token = google_token)
   
   return(gtoken)
  
}