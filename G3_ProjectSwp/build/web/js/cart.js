/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(() => {
  updateValue();

  $(".btn-minus").click((e) => {
    var row_index = $(e.target).closest("tr").index();
    var value = parseInt(
      $("tr:nth-child(" + (row_index + 1) + ") input[type=number]").val()
    );

    if (value > 0) {
      $("tr:nth-child(" + (row_index + 1) + ") input[type=number]").val(
        value - 1
      );
    }

    updateValue();
  });

  $(".btn-plus").click((e) => {
    var row_index = $(e.target).closest("tr").index();
    var value = $(
      "tr:nth-child(" + (row_index + 1) + ") input[type=number]"
    ).val();

    $("tr:nth-child(" + (row_index + 1) + ") input[type=number]").val(
      parseInt(value) + 1
    );

    updateValue();
  });

  $(".btn-remove").click((e) => {
    $(e.target).closest("tr").remove();

    updateValue();
  });

  $(".form-control").change(() => {
    updateValue();
  });
});

function miniusQuant() {}
function plusQuant() {}
function deleteRow() {}

function updateValue() {
  var rowCount = $("table tbody tr").length;
  var totalPrice = 0;
  var totalDiscount = 0;
  var totalTax = 0;

  $("table tbody tr").each(function (index, tr) {
    if (index < rowCount - 3) {
      var quant = parseFloat($(this).find("input[type=number]").val());

      var price = parseFloat(
        $(this).children("td").eq(3).find("p").text().slice(1)
      );

      var discount = parseFloat(
        $(this).children("td").eq(4).find("p").text().slice(1)
      );
      if (isNaN(discount)) {
        discount = 0;
      }

      var tax = parseFloat(quant * price * 0.1);
      $(this)
        .children("td")
        .eq(5)
        .find("p")
        .text("$" + tax.toFixed(2));

      var total = parseFloat(quant * price - discount + tax);
      if (total < 0) {
        total = 0;
      }
      $(this)
        .children("td")
        .eq(6)
        .find("p")
        .text("$" + total.toFixed(2));

      totalPrice += total;
      totalDiscount += discount;
      totalTax += tax;
    }
  });

  $("#totalPrice").text("$" + totalPrice.toFixed(2));
  $("#totalDiscount").text("$" + totalDiscount.toFixed(2));
  $("#totalTax").text("$" + totalTax.toFixed(2));
}
