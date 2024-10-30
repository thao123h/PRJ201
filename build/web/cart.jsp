<%-- 
    Document   : card
    Created on : Oct 29, 2024, 6:04:44 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
        <style>
           .cart-container {
                margin-top: 130px;
                padding: 30px 0;
            }

            .cart-table {
                background: white;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                overflow: hidden;
            }

            .cart-header {
                background: #f4b8cc;
                color: white;
                padding: 15px;
                font-weight: 600;
            }

            .cart-item {
                padding: 15px;
                border-bottom: 1px solid #eee;
                align-items: center;
            }

            .product-image {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 5px;
            }

            .quantity-control {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .quantity-btn {
                width: 30px;
                height: 30px;
                border: none;
                background: #f4b8cc;
                color: white;
                border-radius: 5px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .quantity-btn:hover {
                background: #e798b2;
            }

            .quantity-input {
                width: 50px;
                text-align: center;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 5px;
            }

            .delete-btn {
                color: #dc3545;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .delete-btn:hover {
                color: #c82333;
            }

            .cart-summary {
                background: white;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                padding: 20px;
                position: sticky;
                top: 130px;
            }

            .summary-title {
                font-size: 1.2rem;
                font-weight: 600;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #f4b8cc;
            }

            .checkout-btn {
                width: 100%;
                padding: 12px;
                background: #f4b8cc;
                color: white;
                border: none;
                border-radius: 5px;
                font-weight: 600;
                margin-top: 20px;
                transition: all 0.3s ease;
            }

            .checkout-btn:hover {
                background: #e798b2;
                text-decoration: none;
            }
            .checkout-btn a{
            
  text-decoration: none; /* Xóa gạch chân */
  color: inherit; /* Giữ nguyên màu ban đầu */
 
}

 .checkout-btn a:hover {
 color:black;
  text-decoration: none; /* Xóa gạch chân khi hover */
}

            }
            
            
        </style>
    </head>
    <body>
        <%@include file="headerr.jsp" %>
        
        <div class="container cart-container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="cart-table">
                        <div class="cart-header row mx-0">
                            <div class="col-5">Sản phẩm</div>
                            <div class="col-2 text-center">Đơn giá</div>
                            <div class="col-2 text-center">Số lượng</div>
                            <div class="col-2 text-center">Tổng tiền</div>
                            <div class="col-1"></div>
                        </div>

                        <c:forEach var="ci" items="${requestScope.list}">
                            <div class="cart-item row mx-0 align-items-center" data-price="${ci.product.oproduct.listedPrice}">
                                <div class="col-5 d-flex align-items-center">
                                    <img class="product-image mr-3" src="${ci.product.thumbnail}" alt="${ci.product.oproduct.title}"/>
                                    <div>
                                        <h6 class="mb-1">${ci.product.oproduct.title}</h6>
                                        <small class="text-muted">${ci.product.name}</small>
                                    </div>
                                </div>
                                <div class="col-2 text-center">
                                    <fmt:formatNumber value="${ci.product.oproduct.listedPrice}" type="number" groupingUsed="true"/>đ
                                </div>
                                <div class="col-2">
                                    <div class="quantity-control">
                                        <button class="quantity-btn" onclick="updateQuantity(this, -1,${ci.id})">-</button>
                                        <input type="number" class="quantity-input" value="${ci.quantity}" min="1" onchange="updateTotal(this)">
                                        <button class="quantity-btn" onclick="updateQuantity(this, 1,${ci.id})">+</button>
                                    </div>
                                </div>
                                <div class="col-2 text-center item-total">
                                    <fmt:formatNumber value="${ci.product.oproduct.listedPrice * ci.quantity}" type="number" groupingUsed="true"/>đ
                                </div>
                                <div class="col-1 text-center">
                                    <a href="cartitem?deleteid=${ci.id}" class="delete-btn">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="cart-summary">
                        <h3 class="summary-title">Tổng giỏ hàng</h3>
                        <div class="d-flex justify-content-between mb-3">
                            <span>Tạm tính:</span>
                            <span class="cart-subtotal"></span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <span>Phí vận chuyển:</span>
                            <span>Miễn phí</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-3">
                            <strong>Tổng cộng:</strong>
                            <strong class="cart-total"></strong>
                        </div>
                        
                        <button class="checkout-btn"> <a href="checkout">Thanh toán</a></button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>

        <script>
            function updateQuantity(btn, change,cid) {
                const input = btn.parentElement.querySelector('.quantity-input');
                let value = parseInt(input.value) + change;
                if(value < 1) value = 1;
                input.value = value;
                window.location.href = "cartitem?quantity="+ value +"&idc=" + cid;
                updateTotal(input);
            }

            function updateTotal(input) {
                const item = input.closest('.cart-item');
                const price = parseFloat(item.dataset.price);
                const quantity = parseInt(input.value);
                const total = price * quantity;
                
                // Cập nhật tổng tiền của item
                const itemTotal = item.querySelector('.item-total');
                itemTotal.textContent = formatCurrency(total);
                
                // Cập nhật tổng giỏ hàng
                updateCartTotal();
            }

            function updateCartTotal() {
                let total = 0;
                document.querySelectorAll('.cart-item').forEach(item => {
                    const price = parseFloat(item.dataset.price);
                    const quantity = parseInt(item.querySelector('.quantity-input').value);
                    total += price * quantity;
                    
                    
                    
                });
                
                document.querySelector('.cart-subtotal').textContent = formatCurrency(total);
                document.querySelector('.cart-total').textContent = formatCurrency(total);
            }

            function formatCurrency(amount) {
                return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
            }

            // Tính tổng ban đầu
            updateCartTotal();
        </script>
    </body>
</html>
