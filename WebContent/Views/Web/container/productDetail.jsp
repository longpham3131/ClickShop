<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- BOOSTRAP CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- FONT AWESOME  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
          integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
          crossorigin="anonymous"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Views/Web/css/main.css">
</head>

<body>
<%--<div class="loader-wrapper">--%>
<%--    <span class="loader"><span class="loader-inner"></span></span>--%>
<%--</div>--%>
<c:import url="../commom/header.jsp"> </c:import>


<div class="row product-detail-wrapper">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="row product-detail-main pr_style_01">
            <div class="col-md-8 col-sm-12 col-xs-12">

                <div class="product--description text-center">
                    <img id="pro-image" src="<%=request.getContextPath()%>/Views/Web${imagepath}" alt=""
                         style="width: 80%;">
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12 product-content-desc" id="detail-product">
                <div class="product-title">
                    <h1 id="pro-name">${name}</h1>
                    <span id="pro_sku"  hidden>${productId}</span>
                    <span >Còn lại: ${Quannity}</span>

                </div>
                <div class="product-price" id="price-preview">
                    <span class="pro-price" id="price-view"></span>
                    <input type="number" value="${unitprice}" id="price-value">
                </div>


                <form id="add-item-form" action="/cart/add" method="post" class="variants clearfix">
                    <div class="select clearfix d-none">
                        <div class="selector-wrapper"><label for="product-select-option-0">Màu sắc</label><span
                                class="custom-dropdown custom-dropdown--white"><select
                                class="single-option-selector custom-dropdown__select custom-dropdown__select--white"
                                data-option="option1" id="product-select-option-0">
                                        <option value="BLACK">BLACK</option>
                                    </select></span></div>
                        <div class="selector-wrapper"><label for="product-select-option-1">Kích thước</label><span
                                class="custom-dropdown custom-dropdown--white"><select
                                class="single-option-selector custom-dropdown__select custom-dropdown__select--white"
                                data-option="option2" id="product-select-option-1">
                                        <option value="38 EU">38 EU</option>
                                        <option value="39 EU">39 EU</option>
                                        <option value="40 EU">40 EU</option>
                                        <option value="41 EU">41 EU</option>
                                        <option value="42 EU">42 EU</option>
                                        <option value="43 EU">43 EU</option>
                                        <option value="44 EU">44 EU</option>
                                        <option value="45 EU">45 EU</option>
                                    </select></span></div>
                        <select id="product-select" name="id" style="display:none;">

                            <option value="1061011849">BLACK / 38 EU - 1,700,000₫</option>

                            <option value="1061011850">BLACK / 39 EU - 1,700,000₫</option>

                            <option value="1061011851">BLACK / 40 EU - 1,700,000₫</option>

                            <option value="1061011852">BLACK / 41 EU - 1,700,000₫</option>

                            <option value="1061011853">BLACK / 42 EU - 1,700,000₫</option>

                            <option value="1061011854">BLACK / 43 EU - 1,700,000₫</option>

                            <option value="1061011855">BLACK / 44 EU - 1,700,000₫</option>

                            <option value="1061011856">BLACK / 45 EU - 1,700,000₫</option>

                        </select>
                    </div>

                    <a style="display:block;margin:10px 0" href="javascript:void(0)" class="" data-toggle="modal"
                       data-target="#myModal">
                    </a>

                    <div class="selector-actions">

                        <div class="quantity-area clearfix">
                            <input type="button" value="-" id="btnMinus" class="qty-btn">
                            <input type="text" id="quantity" name="quantity" value="1" min="1"
                                   class="quantity-selector">
                            <input type="button" value="+" id="btnPlus" class="qty-btn">
                        </div>
                        <div class="wrap-addcart clearfix">
                            <button type="button" id="add-to-cart"
                                    class="add-to-cartProduct button dark btn-addtocart addtocart-modal" name="add"
                                    data-toggle="modal" data-target="#myModal">Thêm
                                vào
                                giỏ
                            </button>

                            <button type="button" id="buy-now"
                                    class="add-to-cartProduct button dark btn-addtocart addtocart-modal hidden d-none"
                                    name="add" style="display: inline-block;">Mua ngay
                            </button>
                        </div>

                    </div>

                    <div class="product-action-bottom visible-xs d-none">
                        <div class="input-bottom">
                            <input id="quan-input" type="number" value="1" min="1">
                        </div>
                        <button type="button" id="add-to-cartbottom"
                                class="add-to-cartProduct add-cart-bottom button dark addtocart-modal" name="add">Thêm
                            vào
                            giỏ
                        </button>
                    </div>
                </form>
                <hr class="hrcs">
                <div class="xdqhotline">
                    <span>Tư vấn: 0888 543 919</span>
                </div>
                <hr class="hrcs">
                <div class="product-description">
                    <div class="title-bl" href="#thongTinSP" data-toggle="collapse">
                        <h2>
                            THÔNG TIN SẢN PHẨM
                            <i class="fa fa-plus"></i>
                        </h2>
                    </div>
                    <div class="collapse list-unstyled" id="thongTinSP">
                        <div class="main_details">
                            <ul>
                                <li><span style="font-size:12px">${description}</span></li>
                            </ul>
                        </div>

                    </div>
                </div>

                <div class="product-description">
                    <div class="title-bl" href="#baoHanh" data-toggle="collapse">
                        <h2>
                            CHÍNH SÁCH BẢO HÀNH
                            <i class="fa fa-plus"></i>
                        </h2>
                    </div>
                    <div class="collapse list-unstyled" id="baoHanh">
                        <div class="description-productdetail">
                            <div class="hrvproduct-tabs">
                                <ul>
                                    <li>Bảo hành trọn đời về các vấn đề bong tróc keo đế</li>
                                    <li>Miễn phí 3 lần vệ sinh đánh bóng giày (mang theo thẻ vệ sinh)</li>
                                    <li>Đổi trả trong vòng 1 tuần nếu xảy ra vấn đề do nhà sản xuất
                                        <ul style="padding-left: 20px;">
                                            <li>Đổi trả trong vòng 1 tuần nếu xảy ra vấn đề do nhà sản xuất</li>
                                            <li>Trong trường hợp chưa mang lần nào, nhưng bị vấn đề về đế</li>
                                        </ul>
                                    </li>
                                    <li>Mua tại store hỗ trợ đổi trả trong vòng 24h</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="product-description">
                    <div class="title-bl" href="#doiTra" data-toggle="collapse">
                        <h2>
                            CHÍNH SÁCH ĐỔI TRẢ
                            <i class="fa fa-plus"></i>
                        </h2>
                    </div>
                    <div class="collapse list-unstyled" id="doiTra">
                        <div class="description-productdetail">
                            <div class="hrvproduct-tabs">
                                <ul>
                                    <li>Hàng phải còn nguyên vẹn không có bất kì sự thay đổi nào</li>
                                    <li>Hàng khi đóng gói lại phải kèm túi hộp vẫn còn nguyên vẹn</li>
                                    <li>Phải điền đầy đủ thông tin để tránh thất lạc</li>
                                    <li>Mọi chi phí vận chuyển đổi size sẽ do bên mua chịu toàn bộ chi phí</li>
                                </ul>
                                <div>&nbsp;LƯU Ý: Nếu lỗi nhà cung cấp chúng tôi sẽ chịu hoàn toàn chi phí</div>
                                <div>&nbsp;* Liên hệ trực tiếp với chúng tôi để việc trao đổi trở nên dễ dàng hơn
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="../commom/footer.jsp"> </c:import>
<!-- BOOSTRAP JS -->
<script>
    $(window).on("load", function () {
        $(".loader-wrapper").fadeOut("slow");
    });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

<script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/addToCart.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>

</body>

</html>