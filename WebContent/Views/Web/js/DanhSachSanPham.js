/**
 * chứa danh sách tập hợp nhiều sản phẩm
 *
 */
function DanhSachSanPham(){
    //thuộc tính
    this.mangSP = [];

    //phương thức 
    this.themSP = function(sp){
        this.mangSP.push(sp);
    }

}