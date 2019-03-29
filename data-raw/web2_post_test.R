post_url <-"http://httpbin.org/post";

#测试相关的内容如下-----

#modify the url------

res1 <-web2_post(post_url);
res <-web2_decode_json(res1);
res;

res$url;

#query the parameter-----
# query arguments
web2_post("http://httpbin.org/post", query = list(foo = "bar"));

web2_post_query(post_url,namedList = list(hulilei='go to up day',
                                          data='day day up always'));



# add header -------
# headers
web2_post("http://httpbin.org/post", add_headers(foo = "bar"));

web2_post_header(post_url,list(foo='bar2'));



# body
## as form-----
web2_post("http://httpbin.org/post", body = list(foo = "bar",data2="天天开心"), encode = "form");

web2_post_bodyForm(post_url,list(foo='data'));




## as json
web2_post("http://httpbin.org/post", body = list(foo = "bar"), encode = "json");

web2_post_bodyJson(post_url,list(foo='data'));

