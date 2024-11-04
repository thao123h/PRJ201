<%-- 
    Document   : updateProduct
    Created on : Nov 4, 2024, 5:34:54 PM
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
    <!--      int id;
        int category;
        String title;
        int listedPrice;
        String description;
        String thumbnail;
        double discount;
        double finalPrice;-->
    <body>
        <h1>Update product </h1>
        <c:set value="${requestScope.pupdate}" var="p"></c:set>
        <c:if test="${op.category == 1}"> 
            <c:set var="c" value=" Túi tote"></c:set>
        </c:if>
        <c:if test="${op.category == 2}"> 
            <c:set var="c" value="Dây buộc tóc"></c:set> </c:if>
        <c:if test="${op.category == 3}"> 
            <c:set var="c" value="Vòng cổ"></c:set> </c:if>

                <form action="dashboard" method="post">
                    ID: <input type="text" name="id" value="${p.id}" readonly="">
            Category: <select value="${c}" name ="c">
                <option value="1">Túi tote</option>
                <option value="2">Dây buộc tóc</option>
                <option value="3">Vòng cổ</option>
            </select>
            Title: <input type="text" name="t" value="${p.title}">
            ListedPrice: <input  type="text" name="p" value="${p.listedPrice}">
            Description: <input style="width: 500px;height: 30px" type="text" name="d" value="${p.description}">
            discount <input type="text" name="di" value="${p.discount}">
            <input type="submit" value="SUBMIT">

        </form>
          
    </body>
</html>
