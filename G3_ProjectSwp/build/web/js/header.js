/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {

    $(".account").hide();

    if (sessionStorage.getItem('userlogin') !== null) {
        $(".login").hide();
        $(".account").show();
    }
});

function getData() {
    let userGetData = sessionStorage.getItem('userlogin');
    let convertValue = JSON.parse(userGetData);

    document.getElementById('nameprofile').innerHTML = convertValue.name;
    document.getElementById("imgprofile").src = convertValue.avt;
}

getData();

function logout() {
    sessionStorage.clear();
    window.location.href = "./homepage";
}
