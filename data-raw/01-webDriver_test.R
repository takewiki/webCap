library(webdriver);
dirver <- run_phantomjs(debugLevel = 'INFO',timeout = 5000);

?run_phantomjs


port <- dirver$port;

s <- Session$new(host = 'www.reshapedata.com',port = port);
s;





library(webCap);
s2 <- web3_session();

s$go('https://login.tmall.com/');

s$takeScreenshot(file = 'zxx_tmall2.png');


s$go('https://www.baidu.com/');
s$takeScreenshot('hll_baidu.png');

s$goBack();

s$takeScreenshot('ques_baidu.png');

s$goForward();
s$takeScreenshot('ques2.png');


