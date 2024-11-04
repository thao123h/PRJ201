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
                    <th>Category</th>
                    <th>Title</th>
                    <th>ListedPrice</th>
                    <th>Description</th>
                 
                    <th>Discount</th>
                    <th>FinaPrice</th>
                    <th>Action</th>
                </tr>
            </thead>
            <!--              int id;
                int category;
                String title;
                int listedPrice;
                String description;
                String thumbnail;
                double discount;
                double finalPrice;-->
            <tbody>
                <c:forEach items="${requestScope.list}" var="op">
                    <tr>
                        <td><a href="productDetail?id=${op.id}" target="_blank">${op.id}</a></td>
                        <td>
                            <c:if test="${op.category == 1}"> Túi tote</c:if>
                            <c:if test="${op.category == 2}"> Dây buộc tóc </c:if>
                            <c:if test="${op.category == 3}"> Vòng cổ</c:if>

                            </td>
                            <td>${op.title}</td>
                        <td>${op.listedPrice}</td>
                        <td>${op.description}</td>
                     

                        <td>${op.discount }</td>
                        <td>${op.finalPrice }</td>
                        <td> <input onclick="doDelete('${op.id}')" type="button" value="DELETE">
                            <input onclick="doUpdate('${op.id}')" type="button" value="UPDATE">  </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>

        <a style="color:black" href="addOProduct.jsp">ADD</a>

        <script >
            function doDelete(id) {
                if (confirm('Are u sure to delete id ' + id + ' ?')) {
                    window.location = 'deleteop?did=' + id;
                }
            }
            function doUpdate(id) {
                window.location = 'dashboard?uid=' + id;
            }

        </script>
    </body>
</html>
