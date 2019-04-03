#' 获取facebook的token
#'
#' @param key key
#' @param secret  secret
#'
#' @return return value
#' @import httr
#' @export
#'
#' @examples api_facebook_token();
api_facebook_token <- function(key="353609681364760",secret="1777c63343eba28359537764fab99b9a") {
  

  
  # 1. Find OAuth settings for facebook:
  #    http://developers.facebook.com/docs/authentication/server-side/
  facebook_endpoint <-oauth_endpoints("facebook")
  
  # 2. Register an application at https://developers.facebook.com/apps/
  #    Replace key and secret below.
  facebook_app <- oauth_app("facebook",key=key ,secret = secret )
  
  # 3. Get OAuth credentials
  facebook_token <- oauth2.0_token(
    facebook_endpoint,facebook_app
  )
  
  facebook_gtoken <-config(token = facebook_token)
  
  return(facebook_gtoken);
  
  
}