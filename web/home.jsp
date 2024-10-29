<%-- Document : home Created on : Oct 6, 2024, 4:38:08 PM Author : asus --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
                                                                 uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
                                                                 uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Glam Closet - Trang chủ</title>
            <link
                rel="stylesheet"
                href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"
                />
            <link
                rel="stylesheet"
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
                />
            <style>
                body {
                    background-color: white;
                    font-family: "Roboto", sans-serif;
                }

                .infor-shop {
                    padding: 50px 0;
                    background: white;
                }

                .carousel-item {
                    position: relative;
                    overflow: hidden;
                    border-radius: 15px;
                    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                }

                .carousel-item img {
                    height: 595px;
                    width: 100%;
                    object-fit: cover;
                    transition: transform 0.8s ease;
                }

                .carousel-item.active {
                    display: block;
                    animation: fadeIn 0.8s ease-in;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0.4;
                    }
                    to {
                        opacity: 1;
                    }
                }

                .carousel-caption h3 {
                    color: #f4b8cKkc;
                    font-weight: 700;
                    font-size: 2rem;
                    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
                    animation: slideIn 0.5s ease-out;
                }

                @keyframes slideIn {
                    from {
                        transform: translateY(20px);
                        opacity: 0;
                    }
                    to {
                        transform: translateY(0);
                        opacity: 1;
                    }
                }

                .right-infor {
                    padding: 40px;
                    font-size: 1.1rem;
                    line-height: 1.8;
                    color: #333;
                    background: white;
                    border-radius: 15px;
                    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    font-weight: 600;
                }

                .section-title {
                    text-align: center;
                    margin: 60px 0 40px;
                    position: relative;
                    padding-bottom: 20px;
                }

                .section-title h2 {
                    font-weight: 700;
                    color: #333;
                    letter-spacing: 2px;
                }

                .section-title::after {
                    content: "";
                    position: absolute;
                    bottom: 0;
                    left: 50%;
                    transform: translateX(-50%);
                    width: 80px;
                    height: 3px;
                    background: #f4b8cc;
                }

                .product-card {
                    margin-bottom: 30px;
                    border-radius: 15px;
                    overflow: hidden;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                    transition: all 0.3s ease;
                    background: white;
                }

                .product-card:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
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
                    transform: scale(1.1);
                }

                .product-info {
                    padding: 20px;
                }

                .product-title {
                    font-size: 1.1rem;
                    font-weight: 500;
                    color: #333;
                    margin-bottom: 10px;
                    height: 80px;
                    overflow: hidden;
                    display: -webkit-box;
                    -webkit-line-clamp: 3;
                    -webkit-box-orient: vertical;
                }

                .product-price {
                    color: #f4b8cc;
                    font-weight: 700;
                    font-size: 1.2rem;
                    margin: 0;
                }

                .carousel-control-prev,
                .carousel-control-next {
                    width: 50px;
                    height: 50px;
                    background: rgba(244, 184, 204, 0.7);
                    border-radius: 50%;
                    top: 50%;
                    transform: translateY(-50%);
                    opacity: 0;
                    transition: all 0.3s ease;
                }

                .carousel-control-prev {
                    left: 20px;
                }

                .carousel-control-next {
                    right: 20px;
                }

                #demo:hover .carousel-control-prev,
                #demo:hover .carousel-control-next {
                    opacity: 1;
                }

                .carousel-indicators {
                    bottom: 20px;
                }

                .carousel-indicators li {
                    width: 10px;
                    height: 10px;
                    border-radius: 50%;
                    margin: 0 5px;
                    background-color: rgba(244, 184, 204, 0.7);
                    border: none;
                }

                .carousel-indicators .active {
                    background-color: #f4b8cc;
                }

                /* Thêm style cho modal */
                .login-modal {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.5);
                    z-index: 1000;
                }

                .login-modal.show {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .login-content {
                    background-color: #f4b8cc;
                    padding: 30px;
                    border-radius: 15px;
                    width: 400px;
                    position: relative;
                    animation: modalFadeIn 0.3s ease;
                }

                @keyframes modalFadeIn {
                    from {
                        opacity: 0;
                        transform: translateY(-20px);
                    }
                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                .login-content h4 {
                    text-align: center;
                    margin-bottom: 20px;
                    color: #333;
                    font-weight: 600;
                }

                .login-form input[type="email"],
                .login-form input[type="password"] {
                    width: 100%;
                    padding: 10px;
                    margin-bottom: 15px;
                    border: none;
                    border-radius: 5px;
                    background-color: white;
                }

                .login-form label {
                    display: block;
                    margin-bottom: 5px;
                    color: #333;
                    font-weight: 500;
                }

                .login-form input[type="submit"] {
                    background-color: white;
                    color: #333;
                    padding: 10px 20px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    width: 100%;
                    font-weight: 600;
                    transition: all 0.3s ease;
                }

                .login-form input[type="submit"]:hover {
                    background-color: #333;
                    color: white;
                }

                .close-btn {
                    position: absolute;
                    top: 10px;
                    right: 15px;
                    font-size: 20px;
                    cursor: pointer;
                    color: #333;
                }

                .forgot-password {
                    text-align: center;
                    margin-top: 15px;
                }

                .forgot-password a {
                    color: #333;
                    text-decoration: none;
                    font-size: 0.9em;
                }

                .register-link {
                    text-align: center;
                    margin-top: 15px;
                    color: #333;
                }

                .register-link a {
                    color: #333;
                    font-weight: 600;
                    text-decoration: none;
                }
            </style>
        </head>
        <body>
            <%@include file="headerr.jsp" %>
             <div class="row" style="
                 margin-top:150px">
                <div class="col-lg-7">
                    <div class="left-image">
                        <div id="demo" class="carousel slide carousel-fade" data-ride="carousel">
                            <ul class="carousel-indicators">
                                <li data-target="#demo" data-slide-to="0" class="active"></li>
                                <li data-target="#demo" data-slide-to="1"></li>
                                <li data-target="#demo" data-slide-to="2"></li>
                            </ul>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="./assets/images/tuitote/home.webp" alt="Túi Tote">
                                    <div class="carousel-caption">
                                        <h3>Túi Tote</h3>
                                    </div>   
                                </div>
                                <div class="carousel-item">
                                    <img src="./assets/images/daybuoctoc/s23.webp" alt="Dây buộc tóc">
                                    <div class="carousel-caption">
                                        <h3>Dây buộc tóc</h3>
                                    </div>   
                                </div>
                                <div class="carousel-item">
                                    <img src="./assets/images/vongco/home.webp" alt="Vòng cổ">
                                    <div class="carousel-caption">
                                        <h3>Vòng cổ</h3>
                                    </div>   
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="right-infor">
                        Đây là Cửa hàng Chính thức Toàn cầu của Glam Closet. <p>

                        </p>Chúng tớ
                        bán túi thời trang, dây buộc tóc và ốp iphone dễ thương phù hợp với mọi cô gái.<p>

                        </p> Nếu bạn có bất kỳ câu hỏi nào xin vui lòng liên hệ với bộ
                        phần chăm sóc khách hàng của chúng tôi, chúng tôi sẽ giải quyết kịp
                        thời. <p>

                        </p>Chúng tôi hỗ trợ bán buôn, bán lẻ, lấy sỉ vui lòng liên hệ sẽ
                        có giá ưu đãi.<p>

                        </p> This is the world-class official store of Bentoy &
                        Milkjoy. We sell stylish and cute bags, stationery, hair ornaments,
                        household goods. Wholse!!!!!
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="section-title">
            <h2>SẢN PHẨM NỔI BẬT</h2>
        </div>
        <div class="row">
            <c:forEach var="gp" items="${requestScope.goodProducts}">
                <div class="col-lg-4 col-md-6">
                    <div class="product-card">
                        <div class="product-image">
                            <img src="${gp.thumbnail}" alt="${gp.oproduct.title}" />
                        </div>
                        <div class="product-info">
                            <h6 class="product-title">${gp.oproduct.title}</h6>
                            <h4 class="product-price">
                                <fmt:formatNumber
                                    value="${gp.oproduct.listedPrice}"
                                    type="number"
                                    groupingUsed="true"
                                    />
                                VND
                            </h4>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="container">
        <div class="section-title">
            <h2>MỚI CÓ TẠI CỬA HÀNG</h2>
        </div>
        <div class="row">
            <c:forEach var="np" items="${requestScope.newProducts}">
                <div class="col-lg-4 col-md-6">
                    <div class="product-card">
                        <div class="product-image">
                            <img src="${np.thumbnail}" alt="${np.oproduct.title}" />
                        </div>
                        <div class="product-info">
                            <h6 class="product-title">${np.oproduct.title}</h6>
                            <h4 class="product-price">
                                <fmt:formatNumber
                                    value="${np.oproduct.listedPrice}"
                                    type="number"
                                    groupingUsed="true"
                                    />
                                VND
                            </h4>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


      
    <%@include file="footer.jsp" %>
 
 
    
    <!-- Thêm modal vào cuối body trước các script -->
    <c:forEach items="${pageContext.request.cookies}" var="c">
        <c:if test="${c.getName() != null && c.getName().equals('email')}">
            <c:set var="email" value="${c.getValue()}"></c:set>
        </c:if>
        <c:if test="${c.getName()!= null && c.getName().equals('pass')}">
            <c:set var="pass" value="${c.getValue()}"></c:set>
        </c:if>
    </c:forEach>
        
    <div id="loginModal" class="login-modal">
        <div class="login-content">
            <span class="close-btn">&times;</span>
            <h4>ĐĂNG NHẬP</h4>
            <form class="login-form" action="login">
                <label for="email">Email:</label>
                <input type="email" value="${email}"  id="email" name="email" required placeholder="Nhập email của bạn">

                <label for="password">Mật khẩu:</label>
                <input type="password"  value="${pass}" id="password" name="password" required placeholder="Nhập mật khẩu">

                <input type="submit" value="ĐĂNG NHẬP">
            </form>
            <div class="forgot-password">
                <a href="requestPassword.jsp">Quên mật khẩu?</a>
            </div>
            <div class="register-link">
                Chưa có tài khoản? <a href="regis.jsp">Đăng ký ngay</a>
            </div>
        </div>
    </div>
    

    <!-- Thêm script để xử lý modal -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Lấy modal
            var modal = document.getElementById('loginModal');

            // Lấy nút đóng modal
            var span = document.getElementsByClassName('close-btn')[0];

            // Lấy tất cả các elements có class login-trigger
            var loginTriggers = document.getElementsByClassName('login-trigger');

            // Thêm sự kiện click cho tất cả các nút login-trigger
            for (var i = 0; i < loginTriggers.length; i++) {
                loginTriggers[i].addEventListener('click', function (e) {
                    e.preventDefault();
                    modal.classList.add('show');
                });
            }

            // Khi click vào nút đóng, đóng modal
            span.onclick = function () {
                modal.classList.remove('show');
            };

            // Khi click ra ngoài modal, đóng modal
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.classList.remove('show');
                }
            };

            // Xử lý form submit
            var loginForm = document.querySelector('.login-form');
            if (loginForm) {
                loginForm.addEventListener('submit', function (e) {
                    e.preventDefault();
                    var email = document.getElementById('email').value;
                    var password = document.getElementById('password').value;

                    if (!email || !password) {
                        alert('Vui lòng điền đầy đủ thông tin!');
                        return;
                    }

                    this.submit();
                });
            }
        });

        // Hiển thị thông báo từ session nếu có

    </script>

  
</body>
</html>
<%-- 
    Document   : home
    Created on : Oct 6, 2024, 4:38:08 PM
    Author     : asus
--%>
