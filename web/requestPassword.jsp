<%-- 
    Document   : requestPassword
    Created on : Oct 25, 2024, 8:16:09 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            input{
                    width: 400px;
    margin-bottom: 26px;
    padding: 7px;
    border-radius: 5px;
            }
              .update{
            
    background-color: #f4b8cc;
        }
        .update:hover{
            background-color:#e798b2;
        </style>
    </head>
    <body>
        <%@include file="headerr.jsp" %>
        <div class="container" style="margin-top:111px;display: flex;justify-content: center">
            <div class="content">
                <h3 style="    font-size: 1.75rem;
    margin-top: 76px;
    margin-bottom: 25px; margin-left: 76px;">LẤY LẠI MẬT KHẨU</h3>
   
                <form action="requestPassword" method="post">
                    <h6 style="    margin-bottom: 27px;
    margin-left: 118px;">* Nhập địa chỉ email:</h6>
     <h5>${requestScope.msg}</h5>
                    <input style=" margin-bottom: 26px;padding:9px;" type="email" name="email"><br>
                    <input class="update" style="  margin-bottom: 26px;padding:9px;"  type="submit"value="Xác nhận"><br>
                </form>

            </div>

        </div>
     <p class="text-danger">${requestScope.mess}</p>
        <%@include file="footer.jsp" %>
    </body>
</html>
