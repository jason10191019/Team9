

var getUrlString = location.href;
var url = new URL(getUrlString);
var email = url.searchParams.get('email');

if(email !== null && email !== ""){
  document.querySelector(".signup").innerHTML = "<a class='nav-link'>Hello, " + email + "</a>";
  document.querySelector(".login a").innerText = "Logout";
  document.querySelector(".login a").setAttribute("href", "file:///Users/jessica/Desktop/final%20project/index.html");
}

var input = document.getElementById("input").value;


// if(input == ""){
//   location.href = "index.html";
// }
// else if(input != 2330 && input != 2317){
//   location.href = "notfound.html";
//
// }
