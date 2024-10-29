<%-- 
    Document   : regis
    Created on : Oct 23, 2024, 3:29:38 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .container{
                display: flex;
                justify-content: center;

            }
            .content{

            }
            input{
                width: 588px;
                display: block;
                padding: 8px;

            }
           .tao {
    background-color: #f4b8cc;
}

.tao:hover {
    background-color: #f1719b;
}


        </style>
    </head>
    <body>
        <%@include file="headerr.jsp" %>
        <div class="container" style=" padding-left: 0; margin-top:111px;
             padding-right: 0;padding-bottom: 30px">
            <div class="content">



                <h3 style="font-size: 1.75rem;
                    text-align: center;
                    margin-top: 40px;
                    margin-bottom: 20px;"> ĐĂNG KÝ </h3>
                <h5>${requestScope.msg}</h5>

                <form action="regis" method="post">

                    <input required type="text" id="fullname" name="name" value="${requestScope.name}" placeholder="Họ tên của bạn(*)"><br>                
                    <input required onblur="checkNameEmail()" type="email"  value="${requestScope.email}" id="email" name="email" placeholder="Email(*)"><br>
                    <input required type="tel"  name="phone" placeholder="Số điện thoại(*)"><br>
                    <input required type="text"  name="address" placeholder="Địa chỉ(*)"><br>
                    <input required type="password" id="pass" name="pass" placeholder="Mật khẩu (*)"><br>
                    <input  class="tao" style="font-weight: bold;

    " type="submit" value="TẠO TÀI KHOẢN"><br>
                    <!-- comment -->
                </form> 
                <script>
                    function checkNameEmail() {
                        var fullname = document.getElementById("fullname").value;
                        var email = document.getElementById("email").value;
                        if (fullname !== "" && email !== "") {
                            window.location.href = 'regis?name=' + fullname + '&&email=' + email;
                        }
                    }

                </script>

            </div>

        </div>
        <%@include  file="footer.jsp" %>
    </body>
</html>
