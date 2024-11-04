<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <h1>Product Details</h1>

        <table>
            <tr>
                <th>ID</th>
                <th>Product Name</th>
                <th>Stock</th>
                <th>Thumbnail</th>
                <th>Action</th>
            </tr>

            <c:forEach var="p" items="${list}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.stock}</td>
                    <td><img src="${p.thumbnail}" alt="${p.name}" width="50" height="50"/></td>
                    <td>
                        <a href="updateProduct?id=${p.id}">Update</a> |
                        <a href="productDetail?did=${p.id}" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <!-- Link to add a new product -->
        <br>
        <a href="addProduct.jsp">Add New Product</a>

    </body>
</html>
