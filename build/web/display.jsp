<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Sản phẩm</title>
    <link
      rel="stylesheet"
      href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
      .leftside {
        background-color: #f4b8cc;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        height: fit-content;
        font-weight: 
            bolder;
      }

      .leftside h2 {
     
        font-size: 1.5rem;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #ddd;
      }

      .leftside a {
        display: block;
        padding: 3px 0px;
        color: black;
        
        text-decoration: none;
        transition: all 0.3s ease;
        border-radius: 5px;
        margin-bottom: 5px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;

        margin-left: -10px;
      }

      .leftside a i {
        margin-right: 12px;
        width: 15px;
        text-align: center;
      }

      .leftside a:hover {
        background-color: #e9ecef;
        color: #007bff;
        transform: translateX(5px);
      }

      .rightside h2 {
        color: #333;
        margin-bottom: 30px;
        padding-bottom: 10px;
        border-bottom: 2px solid #ddd;
      }

      .rightside h2 i {
        margin-right: 10px;
      }

      .product-card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
        margin-bottom: 20px;
        overflow: hidden;
        position: relative;
      }

      .product-card:hover {
        transform: translateY(-5px);
      }

      .product-image {
        position: relative;
        overflow: hidden;
      }

      .product-image img {
        width: 100%;
        height: 300px;
        object-fit: cover;
        transition: transform 0.3s ease;
      }

      .product-card:hover .product-image img {
        transform: scale(1.05);
      }

      .product-info {
        padding: 15px;
      }

      .product-title {
        font-size: 1rem;
        color: #333;
        margin-bottom: 10px;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        line-height: 1.3em;
        height: 2.6em;
      }

      .product-price {
        color: #e44d26;
        font-weight: bold;
        font-size: 1.2rem;
        margin: 0;
      }

      .container {
        padding-top: 30px;
        padding-bottom: 30px;
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

      .heart-icon:hover i {
        color: #ff4d4d;
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

      .product-card:hover .product-actions {
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
    </style>
  </head>
  <body>
    <%@include file="headerr.jsp" %>
    <div class="container" style="margin-top: 111px">
      <div class="row">
        <div class="col-lg-3 col-md-4">
          <div class="leftside">
            <h2><i class="fas fa-list-ul mr-2"></i>Tùy chọn</h2>
            <c:forEach var="f" items="${requestScope.leftnav}">
              <a href="${f.value}&cid=${requestScope.cid}">
                <i class="fas fa-angle-right"></i>
                <!-- Sử dụng cùng một icon cho tất cả các mục -->
                ${f.name}
              </a>
            </c:forEach>
          </div>
        </div>

        <div class="col-lg-9 col-md-8">
          <div class="rightside">
            <h2>${requestScope.cname}</h2>
            <div class="row">
              <c:forEach var="gp" items="${requestScope.list}">
                <div class="col-lg-4 col-md-6">
                  <div class="product-card">
                    <div class="heart-icon" onclick="toggleHeart(this)">
                      <i class="far fa-heart"></i>
                    </div>
                    <div class="product-image">
                      <img src="${gp.thumbnail}" alt="${gp.oproduct.title}" />
                      <div class="product-actions">
                        <a
                          href="buy?id=${gp.id}"
                          class="action-button buy-now"
                          >Mua ngay</a
                        >
                        <a
                          href="detail?id=${gp.id}"
                          class="action-button view-detail"
                          >Xem chi tiết</a
                        >
                      </div>
                    </div>
                    <div class="product-info">
                      <h6 class="product-title">${gp.oproduct.title}</h6>
                      <h5 class="product-price">
                        <fmt:formatNumber
                          value="${gp.oproduct.listedPrice}"
                          type="number"
                          groupingUsed="true"
                        />
                        VND
                      </h5>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="footer.jsp" %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
      function toggleHeart(element) {
        element.classList.toggle("active");
        const icon = element.querySelector("i");
        if (icon.classList.contains("far")) {
          icon.classList.remove("far");
          icon.classList.add("fas");
        } else {
          icon.classList.remove("fas");
          icon.classList.add("far");
        }
      }
    </script>
  </body>
</html>
