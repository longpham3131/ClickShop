
var dssp  = new DanhSachSanPham();

function getMyEle(ele){
    return document.getElementById(ele);
}
KiemTraSoLuong()
function KiemTraSoLuong() {
    if(getMyEle("pro_quan").innerHTML <= 0){
        getMyEle("add-to-cart").innerHTML = "Sản phẩm hết hàng";
        getMyEle("add-to-cart").disabled = "true";
    }
}


var giaSP = getMyEle("price-value");
getMyEle("price-view").innerHTML = new Intl.NumberFormat('vn-VN', { style: 'currency', currency: 'VND' }).format(giaSP.value);
giaSP.style.display = "none";


getMyEle("btnMinus").addEventListener("click", function(){
    if(getMyEle("quantity").value > 1){
        getMyEle("quantity").value--;
        getMyEle("textThongBao").innerHTML = "";
    }

})
getMyEle("btnPlus").addEventListener("click", function(){
    // getMyEle("quantity").value++;

    var soLuongConLai = getMyEle("pro_quan").innerHTML;
    var soLuongDangChon = getMyEle("quantity").value;

    let  thongBao = getMyEle("textThongBao");
    if(soLuongDangChon < soLuongConLai){
        thongBao.innerHTML ="";
        getMyEle("quantity").value++;
    }
    else{
        thongBao.innerHTML ="Xin lỗi vì số lượng sản phẩm hiện tại không đủ cung cấp cho bạn";
    }
})

function layThongTin(){
    var maSP = getMyEle("pro_sku").innerHTML
    var anhSP = getMyEle("pro-image").src;
    var tenSP = getMyEle("pro-name").innerHTML;
    var soLuong = getMyEle("quantity").value;
    var giaSP = getMyEle("price-value").value;
    var soLuongKho = getMyEle("pro_quan").innerHTML;
    var sp = new SanPham(maSP,tenSP,anhSP,parseInt(soLuong) , parseInt(giaSP), parseInt(soLuongKho) );
    return sp;
}

function themSPMoi(){
    var sanPhamMoi = layThongTin();

    if(sanPhamMoi != null){
        isExist = dssp.mangSP.some(function(item){
            return sanPhamMoi.maSP === item.maSP
        })
        if(isExist){
            //Nếu sản phẩm bị trùng
            //Cập nhật giỏ hàng
            var viTri = dssp.timViTri(sanPhamMoi.maSP)
            var soLuongHT = parseInt(dssp.mangSP[viTri].soLuong)
            sanPhamMoi.soLuong = soLuongHT + parseInt(sanPhamMoi.soLuong);

            //Kiểm tra số lượng hợp lệ
            if(sanPhamMoi.soLuong <= sanPhamMoi.soLuongKho){
                dssp.capNhat(sanPhamMoi);
            }

        }
        else{
            dssp.themSP(sanPhamMoi);
        }
    }
}

// Sản phẩm được thêm vào giỏ hàng sẽ lưu xuống local storaged
function setLocalStorage(){
    localStorage.setItem("DSSP",JSON.stringify(dssp.mangSP));
}
function getLocalStorage() {
    if (localStorage.getItem("DSSP") != null) {
        dssp.mangSP = JSON.parse(localStorage.getItem("DSSP"));
        hienThiDSSP(dssp.mangSP);
    }
}
getMyEle("add-to-cart").addEventListener("click", function(event){

    themSPMoi()
    setLocalStorage();
    getLocalStorage();


})

