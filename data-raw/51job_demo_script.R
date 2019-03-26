

library(webCap);

page1 <- web_page(encoding = 'GBK');

node1 <- web_data(page1,node_selector =".el.title .t1" )
node1;


node2 <- web_data(page1,node_selector =".el .t1 a",attr_name = "title",node_loc = F )
node2;
