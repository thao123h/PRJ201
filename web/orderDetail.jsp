<%-- 
    Document   : orderDetail.jsp
    Created on : Nov 6, 2024, 4:45:22 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Detail of an order with id = ${sessionScope.odt}</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Sản phẩm</th>
                    <th>Title</th>
                    <th>Name</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
               
                </tr>
            </thead>
            <tbody>
               
                <c:forEach items="${requestScope.list}" var="od" >
            
  

                      <tr>
                   
                          <td><img style="widows: 50px;height: 50px" src="${od.product.thumbnail}" alt="alt"/></td>
                    <td>${od.product.oproduct.title}</td>
                    <td>${od.product.name}</td>
                    <td>${od.product.oproduct.listedPrice}</td>
                    <td>${od.num}</td>
                    <td>${od.totalMoney}</td>
                </tr>
                </c:forEach>
                           
              
            </tbody>
        </table>

        
    </body>
</html>
