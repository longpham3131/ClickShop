
var validation = new Validation();

function getELE(ele){
    return document. getElementById(ele);
}

getELE("inpEmail").onblur = emailValidate;
getELE("inpFname").onblur = fNameValidate;
getELE("inpLname").onblur = lNameValidate;
getELE("inpPass").onblur = passValidate;
getELE("DOfB").onblur = dOfBirthValidate;
getELE("inpPhone").onblur = phoneValidate;
getELE("inpAddress").onblur = addressValidate;

export function emailValidate(){
    var email = getELE("inpEmail").value;
    if(validation.checkEmpty(email, getELE("tbEmail"), "Email không được trống !!!")
        && validation.checkEmail(email, getELE("tbEmail"), "Email không hợp lệ!!!")){
        return true;
    }
    return  false;
}
export function fNameValidate(){
    var ho = getELE("inpFname").value;
    if(validation.checkEmpty(ho, getELE("tbHo"), "Họ không được trống !!!")
        && validation.checkLetters(ho, getELE("tbHo"), "Họ phải là chữ")){
        return true;
    }
    return  false;
}
function lNameValidate(){
    var ten = getELE("inpLname").value;
    if(validation.checkEmpty(ten, getELE("tbTen"), "Tên không được trống !!!")
        && validation.checkLetters(ten, getELE("tbTen"), "Tên phải là chữ")){
        return true;
    }
    return  false;
}
function passValidate(){
    var matKhau = getELE("inpPass").value;
    if (validation.checkEmpty(matKhau, getELE("tbMatKhau"), "Mật khẩu không được trống !!!")
        && validation.checkLength(matKhau, getELE("tbMatKhau"), "Mật khẩu phải từ 6 - 10 kí tự !!!", 6, 10)
        && validation.checkFormatPass(matKhau, getELE("tbMatKhau"), "Mật khẩu chứa ít nhất 1 ký tự số, 1 ký tự in hoa, 1 ký tự đặc biệt"))
       {
        return true
    }
    return  false;
}
function dOfBirthValidate(){
    var ngaySinh = getELE("DOfB").value;
    console.log(ngaySinh);
    if(validation.checkEmpty(ngaySinh, getELE("tbNgaySinh"), "Ngày sinh không được trống !!!")
        && validation.checkDate(ngaySinh, getELE("tbNgaySinh"), "Ngày sinh hợp lệ !!!")){
        return true
    }
    return  false;

}
function addressValidate(){
    var diaChi = getELE("inpAddress").value;
    if(validation.checkEmpty(diaChi, getELE("tbDiaChi"), "Địa chỉ không được trống !!!")){
        return true;
    }
    return  false;
}
function phoneValidate(){
    var soDienThoai = getELE("inpPhone").value;
    if(validation.checkEmpty(soDienThoai, getELE("tbSDT"), "Số điện thoại không được trống !!!")
        && validation.checkLength(soDienThoai, getELE("tbSDT"), "Độ dài số điện thoại không hợp lệ !!!", 10, 11)
        && validation.checkPhoneNumber(soDienThoai, getELE("tbSDT"), "Số điện thoại không hợp lệ")){
        return true;
    }
    return  false;
}



document.getElementById("btnSubmitRegister").addEventListener("click",function (event) {


    var isValid = true;

    isValid &= emailValidate();
    isValid &= fNameValidate();
    isValid &= lNameValidate();
    isValid &= passValidate()

    isValid &= dOfBirthValidate();

    isValid &= phoneValidate();

    isValid &= addressValidate();


    if (isValid) {
        getELE("formRegister").submit();
    }
})