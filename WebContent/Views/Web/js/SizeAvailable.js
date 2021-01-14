$(document).ready(function () {
    $("#pro_quan").text("0")
});



$(".labelsize").on('click',function(){
    var size = this.innerText;
    idhdip = "#hdip"+size;
    qty = $(idhdip).val()
    $("#pro_quan").text(qty)
})