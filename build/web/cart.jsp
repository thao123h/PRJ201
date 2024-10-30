<%-- 
    Document   : card
    Created on : Oct 29, 2024, 6:04:44 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1> Giỏ hàng của bạn</h1>
        <p>Có ${requestScope.sl} trong giỏ hàng của bạn</p>
            <table border="1">
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th> Tên sản phẩm</th>
                        <th> Mô tả</th>
                        <th> Đơn giá</th>
                        <th> Số lượng</th>
                        <th>Tổng </th>
                         <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ci" items="${requestScope.list}">
                         <tr>
                             <td><img style="height: 50px;width: 50px" src="${ci.product.thumbnail}" alt="alt"/></td>
                        <td>${ci.product.oproduct.title}</td>
                        <td>${ci.product.name}</td>
                        <td>${ci.product.oproduct.listedPrice}</td>
                         
                        <td>${ci.quantity}</td>
                       <td>${ci.product.oproduct.listedPrice *ci.quantity}́</td>
                        <td><a href="deleteCartItem?idc=${ci.id}">Xóa</a></td>
                    </tr> 
                    </c:forEach>
                  
                    
                </tbody>
            </table>

        
    </body>
</html>
