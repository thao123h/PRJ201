<%-- 
    Document   : update
    Created on : Oct 7, 2024, 5:21:16 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body  style="background-color: #f4b8cc">
        <h1>Update a product!</h1>
        <c:set var="p" value="${requestScope.old}"/>

        <form action="update" method="post">
            Input ID: <input type="text" name="id" value="${p.id}"><br>
            Input Name: <input type="text" name="name" value="${p.name}"><br>
            Input CategoryID: <input type="text" name="category_id" value="${p.category}"><br>
            Input Price: <input type="text" name="price" value="${p.price}"><br>
            Input description <input type="text" name="desc" value="${p.description}"><br>
            Input image <input type="text" name="image" value="${p.image}"><br>
            Input quantity <input type="number" name="quantity" value="${p.quantity}"><br>
            <input type="submit" value="ADD">
            <!-- comment --><!-- comment --><!-- comment -->
        </form>
    </body>
</html>
