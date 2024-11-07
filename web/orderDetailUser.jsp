<%-- Document : orderDetail.jsp Created on : Nov 6, 2024, 4:45:22 PM Author :
asus --%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Order Detail</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
      body {
        background-color: #f4b8cc;
        font-family: "Roboto", sans-serif;
        padding: 20px;
      }

      .container {
        background-color: white;
        border-radius: 15px;
        padding: 30px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
      }

      .page-title {
        color: black;
        font-weight: bold;
        margin-bottom: 30px;
        padding-bottom: 15px;
        border-bottom: 2px solid #f4b8cc;
      }

      .btn-back {
        color: #d44d86;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 5px;
        margin-bottom: 20px;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .btn-back:hover {
        color: #c13d75;
        text-decoration: none;
        transform: translateX(-5px);
      }

      .table {
        background: white;
        border-radius: 10px;
        overflow: hidden;
      }

      .table thead {
        background-color: #f4b8cc;
      }

      .table th {
        color: black;
        font-weight: bold;
        border: none;
        padding: 15px;
      }

      .table td {
        vertical-align: middle;
        padding: 15px;
      }

      .product-img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 8px;
      }

      .action-btn {
        padding: 8px 20px;
        border-radius: 5px;
        font-size: 14px;
        font-weight: 500;
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
        margin: 5px;
      }

      .btn-approve {
        background-color: #d4edda;
        color: #155724;
      }

      .btn-approve:hover {
        background-color: #155724;
        color: white;
      }

      .btn-cancel {
        background-color: #f8d7da;
        color: #721c24;
      }

      .btn-cancel:hover {
        background-color: #721c24;
        color: white;
      }

      .total-section {
        margin-top: 20px;
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 10px;
        text-align: right;
      }

      .total-amount {
        font-size: 1.2em;
        font-weight: bold;
        color: #d44d86;
      }

      .action-section {
        margin-top: 20px;
        display: flex;
        justify-content: flex-end;
        gap: 10px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <a href="orderUser" class="btn-back">
        <i class="fas fa-arrow-left"></i> Back to Orders
      </a>

      <h2 class="page-title">
        <i class="fas fa-file-invoice mr-2"></i>
        Order Details 
      </h2>

      <div class="table-responsive">
        <table class="table">
          <thead>
            <tr>
              <th>Image</th>
              <th>Product Title</th>
              <th>Product Name</th>
              <th>Unit Price</th>
              <th>Quantity</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <c:set var="totalOrder" value="0" />
            <c:forEach items="${requestScope.list}" var="od">
              <c:set var="totalOrder" value="${totalOrder + od.totalMoney}" />
              <tr>
                <td>
                  <img
                    class="product-img"
                    src="${od.product.thumbnail}"
                    alt="${od.product.name}"
                  />
                </td>
                <td>${od.product.oproduct.title}</td>
                <td>${od.product.name}</td>
                <td>
                  <fmt:formatNumber
                    value="${od.product.oproduct.listedPrice}"
                    pattern="#,##0"
                  />đ
                </td>
                <td>${od.num}</td>
                <td>
                  <fmt:formatNumber value="${od.totalMoney}" pattern="#,##0" />đ
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="total-section">
        <span>Total Order Amount: </span>
        <span class="total-amount">
          <fmt:formatNumber value="${totalOrder}" pattern="#,##0" />đ
        </span>
      </div>

      <c:if test="${requestScope.status == 0}">
        <div class="action-section">
          <form
            action="orderDetailUser?action=2"
            method="post"
            style="display: inline"
          >
            <button type="submit" class="action-btn btn-cancel">
              <i class="fas fa-times"></i> Cancel Order
            </button>
          </form>
      
        </div>
      </c:if>
    </div>
  </body>
</html>
