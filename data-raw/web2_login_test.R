library(webCap);


res <-web2_login_basic();

res2 <-web2_decode_json(res);

res2$authenticated;
res2$user;




testit <- function(x)
{
  p1 <- proc.time()
  Sys.sleep(x)
  proc.time() - p1 # The cpu usage should be negligible
}
testit(3.7)


lapply(1:10000,function(x){
  Sys.sleep(1)
  print(x)
});








