library(webCap);

bb <-web_get();

web_printStatus(bb);

web_is.success(bb)

library(httr)

content(bb,'raw')->body;
tmp_file <-tempfile();
writeBin(body,tmp_file)


library(readr)
mytxt <- read_csv(tmp_file, locale = locale(encoding = "GBK"))
View(mytxt)


web_body(bb,type = 'raw',encoding = 'GBK')->TEXT;


M

TEXT;
length(TEXT);

View(TEXT);


