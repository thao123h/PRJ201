<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
    </head>
    <body>
        <h1>Update Product</h1>

        <!-- Product Update Form -->
      <form action="updateProduct" method="post" enctype="multipart/form-data">

            <!-- Setting product data in the form -->
            <c:set value="${requestScope.product}" var="p"></c:set>
            
            <!-- Product ID (read-only) -->
            <div>
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" value="${p.id}" readonly>
            </div>
             <div>
                <label for="o"></label>
                <input type="text" id="o" name="o" value="${p.oproduct.id}" readonly="" hidden="">
            </div>
            <!-- Name -->
            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${p.name}">
            </div>

            <!-- Stock -->
            <div>
                <label for="stock">Stock:</label>
                <input type="number" id="stock" name="stock" value="${p.stock}">
            </div>

            <!-- Thumbnail -->
            <div>
                <label for="thumbnail">Thumbnail:</label>
                <input type="file" id="thumbnail" name="thumbnail"  value="${p.thumbnail}">
            </div>

            <!-- Submit button for updating the product -->
            <div>
                <input type="submit" value="Update Product">
            </div>
        </form>
    </body>
</html>
