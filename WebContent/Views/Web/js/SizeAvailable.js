var sizeselected = "";


$(document).ready(function () {
    sizeselected = ""
    $("#pro_quan").text("0")
    KiemTraSoLuong()
});



$(".labelsize").on('click',function(){
    var size = this.innerText;
    sizeselected = size;
    idhdip = "#hdip"+size;
    qty = $(idhdip).val()
    $("#pro_quan").text(qty)
    KiemTraSoLuong()
})