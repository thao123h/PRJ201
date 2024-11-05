<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Product Details</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
      body {
        background-color: #f4b8cc;
        font-family: "Roboto", sans-serif;
        padding: 20px;
      }

      .container {
        background-color: white;
        border-radius: 15px;
        padding: 30px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      }

      .page-title {
        color: black;
        font-weight: bold;
        margin-bottom: 30px;
        padding-bottom: 15px;
        border-bottom: 2px solid #f4b8cc;
      }

      .table {
        background: white;
        border-radius: 10px;
        overflow: hidden;
      }

      .table thead {
        background-color: #f4b8cc;
      }

      .table th {
        color: black;
        font-weight: bold;
        border: none;
      }

      .table td {
        vertical-align: middle;
      }

      .btn-back {
        color: #d44d86;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 5px;
        margin-bottom: 20px;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .btn-back:hover {
        color: #c13d75;
        text-decoration: none;
        transform: translateX(-5px);
      }

      .action-buttons {
        display: flex;
        gap: 10px;
      }

      .btn-action {
        padding: 5px 15px;
        border-radius: 5px;
        font-size: 14px;
        text-decoration: none;
        transition: all 0.3s ease;
      }

      .btn-update {
        background-color: #f4b8cc;
        color: black;
        border: 2px solid #f4b8cc;
      }

      .btn-update:hover {
        background-color: white;
        color: #d44d86;
        text-decoration: none;
      }

      .btn-delete {
        background-color: white;
        color: #ff4d6d;
        border: 2px solid #ff4d6d;
      }

      .btn-delete:hover {
        background-color: #ff4d6d;
        color: white;
        text-decoration: none;
      }

      .btn-add {
        background-color: #f4b8cc;
        color: black;
        padding: 10px 20px;
        border-radius: 8px;
        font-weight: bold;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 5px;
        transition: all 0.3s ease;
      }

      .btn-add:hover {
        background-color: #d44d86;
        color: white;
        text-decoration: none;
        transform: translateY(-2px);
      }

      .product-thumbnail {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <a href="dashboard" class="btn-back">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
      </a>

      <h1 class="page-title"><i class="fas fa-box mr-2"></i>Product Details</h1>

      <div class="table-responsive">
        <table class="table table-hover">
          <thead>
            <tr>
              <th>ID</th>
              <th>Product Name</th>
              <th>Stock</th>
              <th>Thumbnail</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="p" items="${list}">
              <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.stock}</td>
                <td>
                  <img
                    src="${p.thumbnail}"
                    alt="${p.name}"
                    class="product-thumbnail"
                    onerror="this.src='images/default.jpg'"
                  />
                </td>
                <td class="action-buttons">
                  <a
                    href="updateProduct?id=${p.id}"
                    class="btn-action btn-update"
                  >
                    <i class="fas fa-edit"></i> Update
                  </a>
                  <a
                    href="productDetail?did=${p.id}"
                    onclick="return confirm('Are you sure you want to delete this product?');"
                    class="btn-action btn-delete"
                  >
                    <i class="fas fa-trash"></i> Delete
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="mt-4">
        <a href="addProduct?id=${param.id}" class="btn-add">
          <i class="fas fa-plus"></i> Add New Product
        </a>
      </div>
    </div>
  </body>
</html>
