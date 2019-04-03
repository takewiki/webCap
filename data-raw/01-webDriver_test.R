library(webdriver);
dirver <- run_phantomjs(debugLevel = 'INFO',timeout = 5000);
port <- dirver$port;

s <- Session$new(host = 'www.reshapedata.com',port = port);




library(webCap);
s2 <- web3_session();

s2$go('https://login.tmall.com/');
s2$takeScreenshot(file = 'tmall2.png');

