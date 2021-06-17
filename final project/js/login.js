const signIn = document.querySelector("#signInButton");
//const signInFin = document.querySelector("#signInFinish");
const signUp = document.querySelector("#signUpButton");
const signInForm = document.querySelector(".container .sign-in-form");
const signUpForm = document.querySelector(".container .sign-up-form");
const overlay_container = document.querySelector(
  ".container .overlay-container"
);
const overlay = document.querySelector(
  ".container .overlay-container .overlay"
);

signIn.addEventListener("click", () => {
  overlay_container.style.transform = "translateX(100%)";
  overlay.style.transform = "translateX(-50%)";
  signInForm.classList.add("active");
  signUpForm.classList.remove("active");
});

// document.querySelector("#signInFinish").onclick = function(){
//   document.querySelector("#upName").value = "";
//   document.querySelector("#upMail").value = "";
//   document.querySelector("#upPwd").value = "";
//   alert("成功加入會員");
// }

//signInFin.addEventListener("click", () => {
  // overlay_container.style.transform = "translateX(100%)";
  // overlay.style.transform = "translateX(-50%)";
  // signInForm.classList.add("active");
  // signUpForm.classList.remove("active");
//   for(var i = 0; i < 2; i++){
//     document.querySelectorALL(".info1")[i] = '';
//   }
// });
signUp.addEventListener("click", () => {
  overlay_container.style.transform = "translateX(0)";
  overlay.style.transform = "translateX(0)";
  signUpForm.classList.add("active");
  signInForm.classList.remove("active");
});
