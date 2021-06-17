

var getUrlString = location.href;
var url = new URL(getUrlString);
var num = url.searchParams.get('userinput');

// if(num == 2330){
//   document.querySelector(".navbar-brand").innerText = "2330 台積電";
//   document.querySelector("title").innerText = "2330 台積電";
// }
// else if(num == 2317){
//   document.querySelector(".navbar-brand").innerText = "2317 鴻海精密";
//   document.querySelector("title").innerText = "2317 鴻海精密";
//
//   // token
//   document.querySelector(".token-lm").innerHTML = "<p>外資買超前10名(60d)</p><p>大股東持有比>70%</p>";
//   document.querySelector(".token-ll").innerHTML = "<p>投信賣超前50名(60d)</p><p>自營商賣超前10名(60d)</p>";
//   document.querySelector(".token-sm").innerHTML = "<p>投信買超前10名(5d)</p><p>自營商買超前30名(5d)</p>";
//   document.querySelector(".token-sl").innerHTML = "<p>外資賣超前30名(5d)</p><p>外資連續賣超3日</p>";
//
//   //tech
//   document.querySelector(".tech-sm").innerHTML = "<p>股價突破週線</p>";
//
//   //finance
//   document.querySelector(".fin-lm").innerHTML = "<p>營收在產業排前5.00%</p>";
//
// }
// else if(num == 2603){
//   document.querySelector(".navbar-brand").innerText = "2603 長榮";
//   document.querySelector("title").innerText = "2603 長榮";
//
//   // token
//   document.querySelector(".token-lm").innerHTML = "<p>投信買超前10名(60d)</p><p>自營商買超前10名(60d)</p>";
//   document.querySelector(".token-ll").innerHTML = "<p>外資賣超前50名(60d)</p>";
//   document.querySelector(".token-sm").innerHTML = "<p>大股東持股增加中(1w)</p><p>融資近一週劇增</p><p>投信買超前10名(5d)</p><p>自營商買超前10名(5d)</p><p>自營商連續買超5日</p>";
//   document.querySelector(".token-sl").innerHTML = "<p>外資賣超前30名(5d)</p><p>融資近一日劇減</p>";
//
//   //tech
//   document.querySelector(".tech-sm").innerHTML = "<p>均線多頭排列-日</p><p>週線多頭</p><p>雙週線多頭</p><p>月線多頭</p>";
//
//   //finance
//   document.querySelector(".fin-lm").innerHTML = "<p>營收在產業排前5.00%</p><p>低本益比</p><p>月營收高成長</p>";
//   document.querySelector(".fin-ll").innerHTML = "<p>股價淨值比過高</p>";
//
// }
// else if(num == 2303){
//   document.querySelector(".navbar-brand").innerText = "2303 聯電";
//   document.querySelector("title").innerText = "2303 聯電";
//
//   // token
//   document.querySelector(".token-lm").innerHTML = "<p>投資近三個月劇增</p><p>自營商買超前10名(60d)</p><p>投信買超前10名(60d)</p>";
//   document.querySelector(".token-ll").innerHTML = "<p>外資賣超前10名(60d)</p>";
//   document.querySelector(".token-sm").innerHTML = "<p>融資近一週劇增</p><p>投信買超前10名(5d)</p><p>自營商買超前10名(5d)</p><p>投信連續買超3日</p>";
//   document.querySelector(".token-sl").innerHTML = "<p>外資賣超前10名(5d)</p>";
//
//   //tech
//
//   //finance
//   document.querySelector(".fin-lm").innerHTML = "<p>營收在產業排前5.00%</p>";
//   document.querySelector(".fin-ll").innerHTML = "<p>股價淨值比過高</p>";
//
// }
// else {
//   // document.querySelector(".navbar-brand").innerText = num;
//   // document.querySelector("title").innerText = num;
//   location.href = "notfound.html";
//
// }
