<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Order History</title>
    <link
      rel="stylesheet"
      href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
      .shape {
        width: 100%;
        height: 265px;
        border-radius: 50%;
        padding: 20px;
        background-color: #f4b8cc;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .title {
        text-align: center;
      }

      h1 {
        font-family: "Roboto", sans-serif;
        font-size: 48px;
        margin: 0;
        color: #333;
      }

      .left a {
        display: block;
        margin-top: -14px;
        margin-left: 34px;
      }

      /* Style cho bảng */
      .table {
        background: white;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
        border-radius: 10px;
        font-size: 14px;
      }

      .table thead {
        background-color: #f4b8cc;
      }

      .table thead th {
        color: black;
        font-weight: bold;
        border: none;
        font-size: 14px;
        padding: 10px 15px;
      }

      .table td {
        vertical-align: middle;
        padding: 10px 15px;
      }

      /* Style cho status badges */
      .status-badge {
        /*padding: 4px 8px;*/
        border-radius: 15px;
        font-weight: 500;
        font-size: 12px;
        display: inline-flex;
        align-items: center;
        gap: 3px;
      }

      .status-pending {
        background-color: #fff3cd;
        color: #856404;
        border: 1px solid #ffeeba;
      }

      .status-completed {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
      }

      .status-cancelled {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
      }

      /* Style cho nút View Details */
      .view-btn {
        background-color: #f4b8cc;
        color: black;
        padding: 4px 8px;
        border-radius: 4px;
        text-decoration: none;
        font-size: 12px;
        display: inline-flex;
        align-items: center;
        gap: 3px;
        transition: all 0.3s ease;
        border: 1px solid #f4b8cc;
      }

      .view-btn:hover {
        background-color: white;
        color: #d44d86;
        text-decoration: none;
      }

      .view-btn i {
        font-size: 11px;
      }

      .status-badge i {
        font-size: 11px;
      }
    </style>
  </head>
  <body>
    <c:set var="u" value="${sessionScope.user}"></c:set>
    <%@include file="headerr.jsp" %>
    <div
      class="container"
      style="margin-top: 170px; padding-bottom: 30px; color: black"
    >
      <div class="row g-3">
        <!-- Left Column -->
        <div
          class="col-3 left"
          style="padding-top: 40px; border: 1px solid gray"
        >
          <div class="shape">
            <div class="title">
              <h1 style="font-size: 3.5rem; color: white; font-weight: bold">
                GLAM
              </h1>
              <h1 style="font-size: 3.5rem; color: white; font-weight: bold">
                ClOSET
              </h1>
            </div>
          </div>
          <h4
            style="
              font-size: 1rem;
              font-weight: bolder;
              margin-left: 34px;
              margin-top: 24px;
            "
          >
            ${u.fullname}
          </h4>
          <a
            style="color: black; font-weight: bold; margin-top: 18px"
            href="orderUser"
            >Đơn hàng</a
          >
          <br />
          <a style="color: black; font-weight: bold" href="url"
            >Sản phẩm yêu thích</a
          ><br />
          <a style="color: black; font-weight: bold" href="url"
            >Thay đổi mật khẩu</a
          ><br />
          <a style="color: black; font-weight: bold" href="logout">Đăng xuất</a
          ><br />
        </div>

        <!-- Right Column -->
        <div
          class="col-9 right"
          style="
            padding-top: 40px;
            padding-left: 90px;
            border: 1px solid gray;
            border-left: none;
          "
        >
          <h3 style="font-size: 2rem">LỊCH SỬ ĐƠN HÀNG</h3>


          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Ngày</th>
                  <th>Tổng đơn</th>
                  <th>Trạng thái</th>
                  <th>Chi tiết</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${requestScope.orders}" var="o">
                  <tr>
                    <td>${o.orderDate}</td>
                    <td>${o.totalMoney}đ</td>
                    <td>
                      <c:choose>
                        <c:when test="${o.status == 0}">
                            <span style="font-size: 14px" class="status-badge ">
                             Pending
                          </span>
                        </c:when>
                        <c:when  test="${o.status == 1}">
                          <span style="font-size: 14px" class="status-badge status-completed">
                             Approved
                          </span>
                        </c:when>
                        <c:when test="${o.status == 2}">
                          <span style="font-size: 14px" class="status-badge status-cancelled">
                            Cancelled
                          </span>
                        </c:when>
                      </c:choose>
                    </td>
                    <td>
                      <a href="orderDetailUser?id=${o.id}" >
                       View Details
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <%@include file="footer.jsp" %>
  </body>
</html>
