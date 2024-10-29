<%-- 
    Document   : dashboard
    Created on : Oct 7, 2024, 3:20:32 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/bootstrap-4.6.2-dist/css/bootstrap-grid.min.css"/>
    </head>
    <body style =" background-color: #f4b8cc " >
        <h1>ALL PRODUCTS</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>U/D</th>
                </tr>
            </thead>
<!--            int id;
   OriginalProduct oProduct;
   String name;
   int stock;
   String thumbnail;-->

<!--       int id;
    int category;
    String title;
    int listedPrice;
    String description;
    String thumbnail;
    double discount;
    double finalPrice;-->
            <tbody>
                <c:forEach var="p" items="${requestScope.list}">
                    <tr>
                        <td>${p.id}</td>
                        <td><img style="width:50px;" src="${p.thumbnail}" alt="alt"/></td>
                        <td>${p.oproduct.title}</td>
                        <td>${p.oproduct.listedPrice}</td>
                        <td> <a style="color:black" onclick="doDelete('${p.id}')" href="#">Delete</a> &nbsp;&nbsp;&nbsp;
                            <a style="color:black" href="update?id=${p.id}">Update</a></td>
                    </tr>

                </c:forEach>


            </tbody>
        </table>
        <a style="color:black" href="add">ADD</a>

        <script >
            function doDelete(id) {
                if (confirm('Are u sure to delete id ' + id + ' ?')) {
                    window.location = 'delete?id=' + id;
                }
            }

        </script>
    </body>
</html>
