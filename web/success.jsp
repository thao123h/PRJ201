<%-- Document : success Created on : Nov 7, 2024, 5:53:34 AM Author : asus --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Order Success - GLAM CLOSET</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
      .success-container {
        max-width: 800px;
        margin: 50px auto;
        text-align: center;
        padding: 40px;
        background-color: white;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      }

      .success-icon {
        color: #28a745;
        font-size: 60px;
        margin-bottom: 20px;
      }

      .success-title {
        color: #d44d86;
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 20px;
      }

      .success-message {
        color: #666;
        font-size: 18px;
        line-height: 1.6;
        margin-bottom: 30px;
      }

      .thank-you {
        color: #d44d86;
        font-style: italic;
        margin-bottom: 30px;
      }

      .back-to-shop {
        display: inline-block;
        background-color: #f4b8cc;
        color: black;
        padding: 12px 30px;
        border-radius: 25px;
        text-decoration: none;
        font-weight: bold;
        transition: all 0.3s ease;
        margin-top: 20px;
      }

      .back-to-shop:hover {
        background-color: #d44d86;
        color: white;
        transform: translateY(-2px);
        text-decoration: none;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .back-to-shop i {
        margin-right: 8px;
      }
    </style>
  </head>
  <body>
    <%@include file="headerr.jsp" %>

    <div class="success-container" style="margin-top:165px">
      <i class="fas fa-check-circle success-icon"></i>
      <h1 class="success-title">GLAM CLOSET</h1>
      <div class="success-message">
        <p>Đơn hàng đã được thực hiện thành công!</p>
        <p>Cảm ơn bạn đã yêu mến và đồng hành cùng GLAM CLOSET</p>
      </div>
      <p class="thank-you">Much love from GLAM CLOSET ❤️</p>
      <a href="nav?cid=0" class="back-to-shop">
        <i class="fas fa-shopping-bag"></i>
        Quay lại trang sản phẩm
      </a>
    </div>

    <%@include file="footer.jsp" %>
  </body>
</html>
