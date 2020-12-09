
var dssp = new DanhSachSanPham();

function getMyEle(ele){
    return document.getElementById(ele);
}
var giaSP = getMyEle("price-value");
getMyEle("price-view").innerHTML = new Intl.NumberFormat('vn-VN', { style: 'currency', currency: 'VND' }).format(giaSP.value);
giaSP.style.display = "none";


getMyEle("btnMinus").addEventListener("click", function(){
    if(getMyEle("quantity").value > 1){
        getMyEle("quantity").value--; 
    }

})
getMyEle("btnPlus").addEventListener("click", function(){
    getMyEle("quantity").value++; 
})

function layThongTin(){
    var maSP = getMyEle("pro_sku").innerHTML
    var anhSP = getMyEle("pro-image").src;
    var tenSP = getMyEle("pro-name").innerHTML;
    var soLuong = getMyEle("quantity").value;
    var giaSP = getMyEle("price-value").value;

    var sp = new SanPham(maSP,tenSP,anhSP,soLuong,giaSP);
    return sp;
}

function themSP(){
    var sanPhamMoi = layThongTin();
    if(sanPhamMoi != null){
        dssp.themSP(sanPhamMoi);
        setLocalStorage();
    }
}

// Sản phẩm được thêm vào giỏ hàng sẽ lưu xuống local storaged
function setLocalStorage(){
    localStorage.setItem("DSSP",JSON.stringify(dssp.mangSP));
}

getMyEle("add-to-cart").addEventListener("click", themSP)