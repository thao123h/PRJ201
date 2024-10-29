<%-- 
    Document   : add
    Created on : Oct 7, 2024, 4:24:06 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="" %>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body  style="background-color: #f4b8cc">
        <h1>Add a product!</h1>
      <c:set var="error" value="${requestScope.error}"/>
      <h2>${error}</h2>
        <form action="add" method="post">
            Input ID: <input type="text" name="id"><br>
            Input Name: <input type="text" name="name"><br>
            Input CategoryID: <input type="text" name="category_id"><br>
            Input Price: <input type="text" name="price"><br>
            Input description <input type="text" name="desc"><br>
            Input image <input type="text" name="image"><br>
            Input quantity <input type="number" name="quantity"><br>
            <input type="submit" value="ADD">
            <!-- comment --><!-- comment --><!-- comment -->
        </form>
    </body>
</html>
