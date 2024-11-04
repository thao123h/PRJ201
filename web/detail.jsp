<%-- 
    Document   : detail
    Created on : Oct 28, 2024, 10:35:41 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
        <link rel="stylesheet" href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <style>
            .product-detail {
                margin-top: 130px;
                padding: 30px 0;
            }

            .product-image {
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }

            .product-image img {
                width: 100%;
                height: auto;
                transition: transform 0.3s ease;
            }

            .product-info {
                padding: 20px;
            }

            .product-title {
                font-size: 1.8rem;
                font-weight: 600;
                margin-bottom: 20px;
                color: #333;
            }

            .product-price {
                font-size: 1.5rem;
                color: #f4b8cc;
                font-weight: 700;
                margin-bottom: 20px;
            }

            .product-description {
                color: #666;
                line-height: 1.8;
                margin-bottom: 30px;
            }

            .quantity-selector {
                display: flex;
                align-items: center;
                margin-bottom: 30px;
            }

            .quantity-btn {
                width: 40px;
                height: 40px;
                border: none;
                background: #f4b8cc;
                color: white;
                font-size: 1.2rem;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .quantity-btn:hover {
                background: #e798b2;
            }

            .quantity-input {
                width: 60px;
                height: 40px;
                text-align: center;
                border: 1px solid #ddd;
                margin: 0 10px;
            }

            .add-to-cart {
                background: #f4b8cc;
                color: white;
                border: none;
                padding: 21px 40px;
                border-radius: 5px;
                font-weight: 600;
                transition: all 0.3s ease;
                margin-right: 15px;
            }

            .add-to-cart:hover {
                background: #e798b2;
            }

            .buy-now {
                background: #333;
                color: white;
                border: none;
                    padding: 21px 40px;
                border-radius: 5px;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .buy-now:hover {
                background: #222;
            }

            .related-products {
                padding: 50px 0;
                position: relative;
            }

            .section-title {
                text-align: center;
                margin-bottom: 30px;
                font-size: 1.8rem;
                font-weight: 600;
                color: #333;
                position: relative;
                padding-bottom: 15px;
            }

            .section-title::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                width: 80px;
                height: 3px;
                background: #f4b8cc;
            }

            .related-products .row {
                display: flex;
                flex-wrap: nowrap;
                overflow-x: auto;
                scroll-behavior: smooth;
                -webkit-overflow-scrolling: touch;
                margin: 0 -10px;
                padding: 20px 0;
            }

            .related-products .col-md-3 {
                flex: 0 0 300px;
                max-width: 300px;
                padding: 0 10px;
                margin-right: 10px;
            }

            .related-product-card {
                height: 100%;
                background: white;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
                position: relative;
                overflow: hidden;
            }

            .related-product-image {
                position: relative;
                height: 250px;
                overflow: hidden;
            }

            .related-product-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

            .related-product-card:hover .related-product-image img {
                transform: scale(1.05);
            }

            .related-product-info {
                padding: 15px;
            }

            .related-product-title {
                font-size: 1rem;
                margin-bottom: 10px;
                color: #333;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                height: 2.4em;
            }

            .related-product-price {
                color: #f4b8cc;
                font-weight: 600;
                font-size: 1.1rem;
            }

            .heart-icon {
                position: absolute;
                top: 15px;
                right: 15px;
                background: rgba(255, 255, 255, 0.9);
                width: 35px;
                height: 35px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.3s ease;
                z-index: 1;
            }

            .heart-icon i {
                color: #999;
                font-size: 18px;
                transition: all 0.3s ease;
            }

            .heart-icon:hover {
                background: #fff;
                transform: scale(1.1);
            }

            .heart-icon.active i {
                color: #f4b8cc;
            }

            .product-actions {
                position: absolute;
                bottom: -50px;
                left: 0;
                right: 0;
                display: flex;
                justify-content: space-between;
                padding: 10px 15px;
                background: rgba(0, 0, 0, 0.7);
                transition: all 0.3s ease;
                opacity: 0;
            }

            .related-product-card:hover .product-actions {
                bottom: 0;
                opacity: 1;
            }

            .action-button {
                padding: 8px 15px;
                border-radius: 5px;
                text-decoration: none;
                font-weight: 500;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                text-align: center;
                width: 48%;
            }

            .view-detail {
                background-color: #ffffff;
                color: #333;
                border: none;
            }

            .view-detail:hover {
                background-color: #f8f9fa;
                text-decoration: none;
                color: #333;
            }

            .buy-now {
                background-color: #f4b8cc;
                color: white;
                border: none;
            }

            .buy-now:hover {
                background-color: #e798b2;
                text-decoration: none;
                color: white;
            }

            /* Ẩn scrollbar nhưng vẫn cho phép cuộn */
            .related-products .row::-webkit-scrollbar {
                height: 8px;
            }

            .related-products .row::-webkit-scrollbar-track {
                background: #f1f1f1;
                border-radius: 4px;
            }

            .related-products .row::-webkit-scrollbar-thumb {
                background: #f4b8cc;
                border-radius: 4px;
            }

            .related-products .row::-webkit-scrollbar-thumb:hover {
                background: #e798b2;
            }

            /* Ẩn scrollbar trên Firefox */
            

            /* Đảm bảo các sản phẩm không bị méo khi cuộn */
            .related-products .row > * {
                flex-shrink: 0;
            }
        </style>
    </head>
    <body>
        <%@include file="headerr.jsp" %>
        <c:set var="product" value="${requestScope.product}"></c:set>
        <div class="container product-detail">
            <div class="row">
                <!-- Ảnh sản phẩm -->
                <div class="col-md-6">
                    <div class="product-image">
                        <img src="${product.thumbnail}" alt="${product.oproduct.title}">
                    </div>
                </div>
                
                <!-- Thông tin sản phẩm -->
                <div class="col-md-6">
                    <div class="product-info">
                        <h1 class="product-title">${product.oproduct.title}</h1>
                        <div class="product-price">
                            <fmt:formatNumber value="${product.oproduct.listedPrice}" type="number" groupingUsed="true"/> VND
                        </div>
                        <div class="product-description">
                            ${product.oproduct.description}
                        </div>
                        
                        <!-- Chọn số lượng -->
                        <div class="quantity-selector">
                            <button class="quantity-btn" onclick="decreaseQuantity()">-</button>
                            <input type="number" class="quantity-input" value="1" min="1" id="quantity">
                            <button class="quantity-btn" onclick="increaseQuantity()">+</button>
                        </div>
                        
                        <!-- Nút mua hàng -->
                        <div class="action-buttons">
                            <form action="addToCart"  style="display: inline;">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="quantity" id="cartQuantity">
                                <button type="submit" class="add-to-cart" onclick="setQuantity('cart')">
                                    <i style="padding: 1px 4px;" class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
                                </button>
                            </form>
                            
                            <form action="buying" style="display: inline;">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="quantity" id="buyQuantity">
                                <button type="submit" class="buy-now" onclick="setQuantity('buy')">
                                    Mua ngay
                                </button>
                            </form>
                        </div>
                                <c:if test="${sessionScope.addCardSuccess != null}">
                                    <h4 style="padding: 10px 0">${sessionScope.addCardSuccess }</h4>
                                    <c:remove scope="session" var="addCardSuccess"></c:remove>
                                </c:if>
                               
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Sản phẩm liên quan -->
        <div class="container related-products">
            <h2 class="section-title">Sản phẩm liên quan</h2>
            <div class="row">
                <c:forEach items="${relatedProducts}" var="rp">
                    <div class="col-md-3">
                        <div class="related-product-card">
                            <div class="heart-icon" onclick="toggleHeart(this)">
                                <i class="far fa-heart"></i>
                            </div>
                            <div class="related-product-image">
                                <img src="${rp.thumbnail}" alt="${rp.oproduct.title}">
                                <div class="product-actions">
                                    <a href="buying?id=${rp.id}&quantity=1" class="action-button buy-now">Mua ngay</a>
                                    <a href="detail?id=${rp.id}" class="action-button view-detail">Xem chi tiết</a>
                                </div>
                            </div>
                            <div class="related-product-info">
                                <h3 class="related-product-title">${rp.oproduct.title}</h3>
                                <div class="related-product-price">
                                    <fmt:formatNumber value="${rp.oproduct.listedPrice}" type="number" groupingUsed="true"/> VND
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <%@include file="footer.jsp" %>

        <script>
            function decreaseQuantity() {
                var input = document.getElementById('quantity');
                var value = parseInt(input.value);
                if(value > 1) {
                    input.value = value - 1;
                }
            }

            function increaseQuantity() {
                var input = document.getElementById('quantity');
                input.value = parseInt(input.value) + 1;
            }

            function setQuantity(type) {
                var quantity = document.getElementById('quantity').value;
                if(type === 'cart') {
                    document.getElementById('cartQuantity').value = quantity;
                } else if(type === 'buy') {
                    document.getElementById('buyQuantity').value = quantity;
                }
            }

            function toggleHeart(element) {
                element.classList.toggle('active');
                const icon = element.querySelector('i');
                if (icon.classList.contains('far')) {
                    icon.classList.remove('far');
                    icon.classList.add('fas');
                } else {
                    icon.classList.remove('fas');
                    icon.classList.add('far');
                }
            }
        </script>
    </body>
</html>
