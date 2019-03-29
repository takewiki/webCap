library(webCap)

res <-api_github('/repos/hadley/httr')

res;
print(res);

print.p
res$path;
class(res);

res$owner$login;


web2_type(res);

#测试get------

url_para <-'http://www.colourlovers.com/api/color/6B4106?format=xml';

res2 <-GET(url_para);

web2_type(res2);

web2_get(url_para);

url_jason <-"http://www.colourlovers.com/api/color/6B4106?format=json";

str(GET(url_jason));


# -----
  
  
  b2 <- "http://httpbin.org/post";
web2_post(b2, body = "A simple text string");


web2_post(b2, body = list(x = "A simple text string-hulilei",y='bbc',z='ddd'));



POST(b2, body = list(y = upload_file(system.file("CITATION"))));


web2_post(b2, body = list(x = "A simple text string"), encode = "json");

# Various types of empty body:
POST(b2, body = NULL, verbose())
POST(b2, body = FALSE, verbose())
POST(b2, body = "", verbose())
