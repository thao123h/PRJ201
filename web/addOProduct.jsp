<%-- 
    Document   : addProduct
    Created on : Nov 4, 2024, 5:47:13 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>ADD </h1>

        <form action="addop">

            Category: <select name ="c">
                <option value="1">Túi tote</option>
                <option value="2">Dây buộc tóc</option>
                <option value="3">Vòng cổ</option>
            </select>
            Title: <input type="text" name="t">
            ListedPrice: <input  type="text" name="p">
            Description: <input style="width: 500px;height: 30px" type="text" name="d">
            discount <input type="text" name="di">
            <input type="submit" value="ADD">

        </form>
    </body>
</html>
