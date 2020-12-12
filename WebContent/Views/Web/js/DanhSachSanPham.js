/**
 * chứa danh sách tập hợp nhiều sản phẩm
 *
 */
class DanhSachSanPham {
    mangSP = [];

    themSP(sp) {
        this.mangSP.push(sp);
    }
    timViTri(ma) {
        let viTri = -1;
        this.mangSP.map(function (item, index) {

            if (item.maSP === ma) {
                viTri = index;
            }
        });
        return viTri;
    }
    xoaSP(ma) {
        var viTri = this.timViTri(ma);
        //Nếu tìm thấy SV
        if (viTri > -1) {
            // splice(viTri, số phần tử cần cắt)
            this.mangSP.splice(viTri, 1);
        }
        else {
            console.log("không tìm thấy Sản phẩm");
        }
    }
    capNhat(sp) {
        var viTri = this.timViTri(sp.maSP);
        if (viTri > -1) {
            dssp.mangSP[viTri] = sp;
        }
    }

}
