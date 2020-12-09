var dssp = new DanhSachSanPham();
getLocalStorage();

var tbl = document.getElementById("tableOrder");
var btnAdd = document.querySelectorAll(".value-plus");
var btnSubTr = document.querySelectorAll(".value-minus");
var txtQuantity = document.querySelectorAll(".quantity-Order");



var arrayGiaBanDau = [];

function getMyEle(ele){
    return document.getElementById(ele);
}

demSoSanPham()
layGiaBanDau();
hienThi();
function demSoSanPham(){
    document.getElementById("soLuongSanPham").innerHTML = tbl.rows.length - 1;
}
function layDanhSachSoLuong() {
    var danhSachSoLuong = [];
    var arrayQuantity = document.getElementsByClassName("quantity-Order")
    if (danhSachSoLuong.length > 0) {
       danhSachSoLuong.splice(0, danhSachSoLuong.length - 1);
        
    }
    for (var i = 0; i < arrayQuantity.length; i++) {
        var quantity = arrayQuantity[i].innerHTML;
        danhSachSoLuong.push(parseInt(quantity));
    }
    return danhSachSoLuong;
}
function layGiaBanDau() {
    var danhSachSoLuong = layDanhSachSoLuong()
    if (arrayGiaBanDau.length > 0) {
        arrayGiaBanDau.splice(0, arrayGiaBanDau.length);
        console.log("Xóa rồi nè: ");
        console.log(arrayGiaBanDau);
    }
    for (var i = 1; i < tbl.rows.length; i++) {
        var tien = parseInt(tbl.rows[i].cells[4].innerHTML);
        arrayGiaBanDau.push(tien);
    }
    console.log("Lấy giá ban đầu: " + arrayGiaBanDau);
}



function layDanhSachTien() {
    var danhSachTien = [];
    var danhSachSoLuong = layDanhSachSoLuong()
    for (var i = 1; i < tbl.rows.length; i++) {
        var tien = arrayGiaBanDau[i - 1] * danhSachSoLuong[i - 1];
        console.log("tien: " + arrayGiaBanDau[i - 1] + " --so luong: " + danhSachSoLuong[i - 1] + " = " + tien + " index=  " + i)
        danhSachTien.push(tien);
    }
    console.log("Danh sách tiền: " + danhSachTien);
    return danhSachTien;
}

//Đổi qua định dạng tiền hiện lên web

function doiQuaTienTe() {
    // var arrayTienTe = [];
    for (var i = 1; i < tbl.rows.length; i++) {
        // arrayTienTe[i-1] = arrayGiaBanDau[i-1] * layDanhSachSoLuong()[i-1]
        // tbl.rows[i].cells[4].innerHTML = layDanhSachTien()[i - 1];
        tbl.rows[i].cells[5].innerHTML = new Intl.NumberFormat('vn-VN', { style: 'currency', currency: 'VND' }).format(layDanhSachTien()[i - 1]);;
        // 
    }
}

//Tính tổng tiền

function tinhTien() {
    var danhSachTien = layDanhSachTien();
    var tong = 0;
    for (var i = 0; i < danhSachTien.length; i++) {
        tong += danhSachTien[i];
    }
    document.getElementById("totalPrice").innerHTML = new Intl.NumberFormat('vn-VN', { style: 'currency', currency: 'VND' }).format(tong);
}
function hienThi() {
    layDanhSachTien();
    doiQuaTienTe();
    tinhTien();
}

//Mỗi lần nhấn + - thì cập nhật số lượng{}
btnAdd.forEach(function (btn, i) {
    btn.addEventListener("click", (event) => {
        txtQuantity[i].innerHTML = parseInt(txtQuantity[i].innerHTML) + 1;
        hienThi();
    });
});

btnSubTr.forEach(function (btn, i) {
    btn.addEventListener("click", (event) => {
        if (txtQuantity[i].innerHTML > 1) {
            txtQuantity[i].innerHTML = parseInt(txtQuantity[i].innerHTML) - 1;
            hienThi();
        }
    });
});

function deleteRow(btn) {
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
    console.log("Click Xóa ");
    demSoSanPham()
    layGiaBanDau();
    console.log("Giá ban đầu sau click: ");
    console.log(arrayGiaBanDau);
    layDanhSachTien();
    tinhTien();
    

} 
function hienThiDSSP(mangSP){
    var tbody = getMyEle("tbodySP");
    var content ="";


    mangSP.map(function(item,index){
        content +=`
        <tr class="rem1">
        <td class="invert">1</td>
        <td class="invert-image">
            <a href="productDetail.html">
                <img src="${item.anhSP}" alt=" " class="img-responsive">
            </a>
        </td>
        <td class="invert">
            <div class="quantity">
                <div class="quantity-select">
                    <div class="entry value-minus"></div>
                    <div class="entry value">
                        <span class="quantity-Order">${item.soLuong}</span>
                    </div>
                    <div class="entry value-plus active"></div>
                </div>
            </div>
        </td>
        <td class="invert">${item.tenSP}</td>

        <td class="invert d-none">${item.giaSP}</td>
        <td></td>
        <td class="invert">
            <button class="btn__DeleteRow" type="button" onclick="deleteRow(this)"><i class="fa fa-times"></i> </button>
        </td>
    </tr>
        `;
    })
    tbody.innerHTML = content;
}
//lấy dữ liệu từ localStorage

function getLocalStorage(){
    if(localStorage.getItem("DSSP") != null){
        dssp.mangSP = JSON.parse(localStorage.getItem("DSSP"));
        hienThiDSSP(dssp.mangSP);
    }
}
