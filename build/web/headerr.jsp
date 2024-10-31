<%-- 
    Document   : headerr
    Created on : Oct 6, 2024, 4:34:54 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
            rel="stylesheet"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
        <link
            rel="stylesheet"
            href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"
            />

        <style>
            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                color: black !important;
                background-color: #f4b8cc;
                font-family: "Roboto", sans-serif;
                overflow: hidden;
                z-index: 777;
                position: fixed;
            }
            .right_header {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: flex-end;
            }

            i {
                padding: 20px 30px;
                font-size: larger;
                color:black;
            }

            .nav-link {
                color: black !important;
                /* font-family: "TTCommons", sans-serif !important; */
                font-size: smaller;
                font-weight: bolder;
            }
            .nav-link:hover {
                text-decoration: underline !important;
            }
            /* .navbar-brand {
              color: black;
              font-family: "Bebas Neue", sans-serif;
            } */

            /* Style cho modal đăng nhập */
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

            /* Thêm style cho search box */
            .search-container {
                position: relative;
                display: inline-flex;
                align-items: center;
            }

            .search-box {
                position: absolute;
                right: 100%;
                top: 50%;
                transform: translateY(-50%);
                width: 0;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .search-box.show {
                width: 200px;
                margin-right: 10px;
            }

            .search-box input {
                width: 100%;
                padding: 8px 15px;
                border: none;
                border-radius: 20px;
                background-color: white;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                font-size: 14px;
            }

            .search-box input:focus {
                outline: none;
                box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            }

            .search-icon {
                cursor: pointer;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid" style=" padding-left: 0;
             padding-right: 0;"">
            <nav class="navbar navbar-expand-sm navbar-dark fixed-top sticky-top" >
                <a
                    class="navbar-brand"
                    href="#"
                    style="
                    color: black;
                    font-family: 'Bebas Neue', sans-serif;
                    font-size: 1.7em;
                    font-weight: bolder;
                    padding-top: 1.3125rem;
                    margin-left: 8px;
                    "


                    >GLAM CLOSET</a
                >
                <div class="right_header">
                    <div class="icons">
                        <div class="search-container">
                            <form action="nav" method="GET" class="search-box">
                                <input type="text" name="keyword" placeholder="Tìm kiếm...">
                            </form>
                            <a class="search-icon"><i class="fas fa-search"></i></a>
                        </div>



                        <c:if test="${sessionScope.user!=null}">
                            <a href="profile.jsp" style="color:black;font-weight: bold; font-size: large;">${sessionScope.user.fullname}</a>
                        </c:if>
                        <c:if test="${sessionScope.user==null}">
                            <a href="login"><i class="far fa-solid fa-user"></i></a>
                            </c:if>
                        <a href="#"><i class="fas fa-heart"></i></a>
                        <a href="cart"><i class="fas fa-solid fa-cart-shopping"></i></a>
                    </div>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="home">TRANG CHỦ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="nav?cid=0">CÁC SẢN PHẨM</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="nav?cid=1">TOTE BAG</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="nav?cid=2">DÂY BUỘC TÓC</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="nav?cid=3">VÒNG CỔ</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </body>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            const searchIcon = document.querySelector('.search-icon');
            const searchBox = document.querySelector('.search-box');
            const searchInput = searchBox.querySelector('input');

            // Toggle search box khi click vào icon
            searchIcon.addEventListener('click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                searchBox.classList.toggle('show');
                if (searchBox.classList.contains('show')) {
                    searchInput.focus();
                }
            });

            // Submit form khi nhấn Enter
            searchInput.addEventListener('keypress', function (e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    this.form.submit();
                }
            });

            // Đóng search box khi click ra ngoài
            document.addEventListener('click', function (e) {
                if (!searchIcon.contains(e.target) && !searchBox.contains(e.target)) {
                    searchBox.classList.remove('show');
                }
            });
        });
    </script>
   
</html>
