<%-- Document : checkout Created on : Oct 30, 2024, 4:47:04 PM Author : asus
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Thanh toán</title>
    <link
      rel="stylesheet"
      href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
    <style>
      .checkout-container {
        margin-top: 130px;
        padding: 30px 0;
      }

      .info-section {
        background: white;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        padding: 25px;
        margin-bottom: 30px;
      }

      .section-title {
        color: #333;
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #f4b8cc;
      }

      .info-group {
        margin-bottom: 20px;
      }

      .info-label {
        font-weight: 500;
        color: #666;
        margin-bottom: 5px;
      }

      .info-input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: #f8f9fa;
        color: #333;
      }

      .order-table {
        width: 100%;
        margin-top: 20px;
      }

      .order-table th {
        background: #f4b8cc;
        color: white;
        padding: 15px;
        text-align: center;
      }

      .order-table td {
        padding: 15px;
        vertical-align: middle;
        text-align: center;
      }

      .product-img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 8px;
      }

      .product-name {
        font-weight: 500;
        color: #333;
      }

      .product-desc {
        color: #666;
        font-size: 0.9rem;
      }

      .total-section {
        margin-top: 30px;
        text-align: right;
        padding: 20px;
        background: #f8f9fa;
        border-radius: 8px;
      }

      .total-amount {
        font-size: 1.2rem;
        font-weight: 600;
        color: #f4b8cc;
      }

      
      .confirm{
          border: none;          /* Xóa border */
  background-color:#f4b8cc; /* Thêm màu nền */
      /* Thêm padding để nội dung trông cân đối */
  outline: none; 
  
  
    
        color: white;
        border: none;
        padding: 12px 30px;
        border-radius: 8px;
        font-weight: 600;
        margin-top: 20px;
        transition: all 0.3s ease;
      }
 .confirm:hover{
      background: #e798b2;
        transform: translateY(-2px);
      }
     
      tr:nth-child(even) {
        background-color: #f8f9fa;
      }

      tr:hover {
        background-color: #f1f1f1;
      }
    </style>
  </head>
  <body>
    <%@include file="headerr.jsp" %>
    <c:set var="u" value="${sessionScope.user}"></c:set>
    <div class="container checkout-container">
      <div class="info-section">
        <h2 class="section-title">Thông tin khách hàng</h2>
        <div class="row">
          <div class="col-md-6">
            <div class="info-group">
              <div class="info-label">Họ và tên:</div>
              <input
                type="text"
                class="info-input"
                value="${u.fullname}"
                readonly
              />
            </div>
            <div class="info-group">
              <div class="info-label">Email:</div>
              <input
                type="text"
                class="info-input"
                value="${u.email}"
                readonly
              />
            </div>
          </div>
          <div class="col-md-6">
            <div class="info-group">
              <div class="info-label">Số điện thoại:</div>
              <input
                type="text"
                class="info-input"
                value="${u.phone}"
                readonly
              />
            </div>
            <div class="info-group">
              <div class="info-label">Địa chỉ:</div>
              <input
                type="text"
                class="info-input"
                value="${u.address}"
                readonly
              />
            </div>
          </div>
        </div>
      </div>

      <div class="info-section">
        <h2 class="section-title">Thông tin đơn hàng</h2>
        <table class="order-table">
          <thead>
            <tr>
              <th>Sản phẩm</th>
              <th>Tên sản phẩm</th>
              <th>Miêu tả</th>
              <th>Đơn giá</th>
              <th>Số lượng</th>
              <th>Tổng tiền</th>
            </tr>
          </thead>
          <tbody>
            <c:set var="total" value="0" />
            <c:forEach var="ci" items="${requestScope.list}">
              <c:set
                var="total"
                value="${total + ci.product.oproduct.listedPrice * ci.quantity}"
              />
              <tr>
                <td>
                  <img
                    class="product-img"
                    src="${ci.product.thumbnail}"
                    alt="${ci.product.oproduct.title}"
                  />
                </td>
                <td class="product-name">${ci.product.oproduct.title}</td>
                <td class="product-desc">${ci.product.name}</td>
                <td>
                  <fmt:formatNumber
                    value="${ci.product.oproduct.listedPrice}"
                    type="number"
                    groupingUsed="true"
                  />đ
                </td>
                <td>${ci.quantity}</td>
                <td>
                  <fmt:formatNumber
                    value="${ci.product.oproduct.listedPrice * ci.quantity}"
                    type="number"
                    groupingUsed="true"
                  />đ
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

        <div class="total-section">
          <div class="d-flex justify-content-between align-items-center">
            <span>Tổng tiền đơn hàng:</span>
            <span class="total-amount">
              <fmt:formatNumber
                value="${total}"
                type="number"
                groupingUsed="true"
              />đ
            </span>
          </div>
            <form action="checkout" method="post">
               
              <input class="confirm" type="submit" value="Xác nhận đặt hàng">
            </form>
          <!--<button class="confirm-btn">Xác nhận đặt hàng</button>-->
        </div>
      </div>
    </div>

    <%@include file="footer.jsp" %>
  </body>
</html>
