<%-- 
    Document   : checkout
    Created on : Oct 30, 2024, 4:47:04 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="u" value="${sessionScope.user}"></c:set>
            <h2>Thông tin khách hàng </h2>
            <h3>Xin chào ${u.fullname}</h3>
        <input type="text" name="name" value="${u.fullname}" readonly="">
        <input type="text" name="email" value="${u.email}" readonly="">
        <input type="text" name="phone" value="${u.phone}" readonly="">
        <input type="text" name="address" value="${u.address}" readonly="">

        <h2>Thông tin đơn hàng</h2>      

        <table border="1">
            <thead>
                <tr>
                    <th>Sản phầm</th>
                    <th> Tên Sản phầm</th>
                    <th>Miêu tả</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Tồng tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ci" items="${requestScope.list}">
                    <tr>
                        <td><img style="width:50px;height:50px" src="${ci.product.thumbnail}" alt="alt"/></td>
                        <td>${ci.product.oproduct.title}</td>
                         <td>${ci.product.name}</td>
                        <td>${ci.product.oproduct.listedPrice}</td>
                        <td>${ci.quantity}</td>
                        <td>${ci.product.oproduct.listedPrice*ci.quantity}</td>
                       
                    </tr>
                </c:forEach>


            </tbody>
        </table>


        <!-- comment -->
        <!--         private int id;
             private String email;
             private String fullname;
             String phone;
             String address;
             String password;
             String role;-->

    </body>
</html>
