<%-- 
    Document   : profile
    Created on : Oct 24, 2024, 3:52:28 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"/>
     <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
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
            font-family: 'Roboto', sans-serif; /* Sử dụng phông chữ Roboto */
            font-size: 48px;
            margin: 0;
            color: #333;
        }
        input{
                width: 651px;
    padding: 7px;
    border-radius: 5px;
        }
        label{
        
                margin-top: 12px;
        }
        .update{
            
    background-color: #f4b8cc;
        }
        .update:hover{
            background-color:#e798b2;
        }
        .left a{
            display: block;
            margin-top: -14px;
    margin-left: 34px;
        }

        </style>

    </head>


    <!--      int id;
         String fullname,email,phone;
         String address;
         String password;
         String role;-->


    <body>
        <c:set var="u" value="${sessionScope.user}"></c:set>
        <%@include file="headerr.jsp" %>
        <div class="container" style=" margin-top:170px;
             padding-bottom: 30px;color:black;">
            <div class="row g-3">
                <div class="col-3 left"  style="padding-top:40px; border: 1px solid gray;">
                    <div class="shape">
                        <div class="title">
                            <h1 style="    font-size: 3.5rem;
    color: white;
    font-weight: bold;" >GLAM</h1> 
                            <h1 style="    font-size: 3.5rem;
    color: white;
    font-weight: bold;">ClOSET</h1>
                        </div>
                    </div>
                    <h4 style="font-size: 1rem; font-weight:bolder;
    margin-left: 34px;
    margin-top: 24px;">${u.fullname}</h4>
                    <a style="color:black; font-weight: bold; margin-top:18px" href="url" >Lịch sử đơn hàng</a> <br>
                    <a style="color:black; font-weight: bold" href="url" >Sản phẩm yêu thích</a><br>
                    <a style="color:black; font-weight: bold" href="url" >Thay đổi mật khẩu</a><br>
                    <a style="color:black; font-weight: bold" href="logout" >Đăng xuất</a><br>
                </div>
                <div class="col-9 right" style="padding-top:40px;padding-left:90px; border: 1px solid gray; /* Đường viền cho tất cả các cạnh */
                     border-left: none; /* Không có đường viền bên trái */
                     ">
                    <h3 style="font-size: 2.5rem;">HỒ SƠ CỦA TÔI</h3>
                    <p style="color:black; font-weight: bold;" >Quản lí thông tin hồ sơ để bảo mật tài khoản</p>
                    <form action="change">
                        <label style="color:black; font-weight: bold;"  for="name">Họ tên:(*)</label> <br>
                        <input readonly type="text" id="name" name="name" value="${u.fullname}"> <br>
                        <label style="color:black; font-weight: bold;"  for="email">Email:(*)</label> <br>
                        <input readonly type="email" id="email" name="name" value="${u.email}"> <br>
                        <label style="color:black; font-weight: bold;"  for="phone">Điện thoại:(*)</label> <br>
                        <input type="tel" id="phone" name="phone" value="${u.phone}"> <br>
                        <label style="color:black; font-weight: bold;"  for="address">Điạ chỉ:(*)</label> <br>
                        <input type="text" id="address" name="address" value="${u.address}"> <br>
                        <input class="update" style="color:black; font-weight: bold;    margin: 39px 0;
    
}"  type="submit" value="Cập nhật"> <br>
                    </form>

                </div>
            </div>

        </div>

    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
