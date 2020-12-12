var dssp = new DanhSachSanPham();


var tbl = document.getElementById("tableOrder");

var txtQuantity = document.querySelectorAll(".quantity-Order");

getLocalStorage();
function getMyEle(ele) {
    return document.getElementById(ele);
}

demSoSanPham()

function demSoSanPham() {
    document.getElementById("soLuongSanPham").innerHTML = tbl.rows.length - 1;
}



//Đổi qua định dạng tiền hiện lên web

function tinhTongTien1SP() {
    var tien1SP = [];
    dssp.mangSP.map(function(item){
        tien1SP.push(item.soLuong * item.giaSP);
    })
    for (var i = 1; i < tbl.rows.length; i++) {
        tbl.rows[i].cells[3].innerHTML = new Intl.NumberFormat('vn-VN', { style: 'currency', currency: 'VND' }).format(tien1SP[i-1]);;
    }
    return tien1SP;
}

//Tính tổng tiền

function tinhTongTienGioHang() {
    var tien1SP = tinhTongTien1SP();
    var tienGioHang = 0;
    for(var i = 0; i < tien1SP.length; i++){
        tienGioHang += tien1SP[i];
    }
    document.getElementById("totalPrice").innerHTML = new Intl.NumberFormat('vn-VN', { style: 'currency', currency: 'VND' }).format(tienGioHang);
}
//Mỗi lần nhấn + - thì cập nhật số lượng{}
function tangSoLuong(maSP) {
    var viTri = dssp.timViTri(maSP)
    var soLuongHT = parseInt(dssp.mangSP[viTri].soLuong)
    dssp.mangSP[viTri].soLuong = soLuongHT + 1;
    console.log(viTri);
    dssp.capNhat(dssp.mangSP[viTri]);
    setLocalStorage();
    getLocalStorage();
}
function giamSoLuong(maSP) {
    var viTri = dssp.timViTri(maSP);
    var soLuongHT = parseInt(dssp.mangSP[viTri].soLuong)
    dssp.mangSP[viTri].soLuong = soLuongHT - 1;
    if(dssp.mangSP[viTri].soLuong < 1){
        deleteRow(maSP);
        demSoSanPham();
    }
    else{
        dssp.capNhat(dssp.mangSP[viTri]);
        setLocalStorage();
        getLocalStorage();
    }

}



function deleteRow(maSP) {
    dssp.xoaSP(maSP);
    setLocalStorage();
    getLocalStorage();
}
function hienThiDSSP(mangSP) {
    var tbody = getMyEle("tbodySP");
    var content = "";
    mangSP.map(function (item, index) {

        content += `
        <tr class="rem1">
  
        <td class="invert-image">
            <a href="productDetail.html">
                <img src="${item.anhSP}" alt=" " class="img-responsive">
                <div>${item.tenSP}</div>
            </a>
        </td>
        <td class="invert">
            <div class="quantity">
                <div class="quantity-select">
         
                    <button class ="btn btn-light" onclick="giamSoLuong('${item.maSP}')"><i class="fa fa-minus"></i></button>
                    <div class="entry value">
                        <span class="quantity-Order">${item.soLuong}</span>
                    </div>
                    <button class ="btn btn-light" onclick="tangSoLuong('${item.maSP}')"><i class="fa fa-plus"></i></button>
            
                </div>
            </div>
        </td>
        <td class="invert d-none">${item.giaSP}</td>
        <td></td>
        <td class="invert">
            <button class="btn__DeleteRow btn btn-danger" type="button" onclick="deleteRow('${item.maSP}')"><i class="fa fa-times"></i> </button>
        </td>
    </tr>
        `;

    })
    tbody.innerHTML = content;
    demSoSanPham()
    tinhTongTienGioHang()
}
//lấy dữ liệu từ localStorage

function getLocalStorage() {
    if (localStorage.getItem("DSSP") != null) {
        dssp.mangSP = JSON.parse(localStorage.getItem("DSSP"));
        hienThiDSSP(dssp.mangSP);
    }
}
function setLocalStorage() {
    localStorage.setItem("DSSP", JSON.stringify(dssp.mangSP));
}
