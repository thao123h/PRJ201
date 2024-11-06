<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Update Product</title>
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
      }

      .container {
        max-width: 800px;
        margin: 50px auto;
      }

      .card {
        border: none;
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      }

      .card-header {
        background-color: #f4b8cc;
        border-bottom: none;
        border-radius: 15px 15px 0 0 !important;
        padding: 20px;
      }

      .card-header h2 {
        color: black;
        font-weight: bold;
        margin: 0;
        font-size: 24px;
      }

      .card-body {
        padding: 30px;
        background-color: white;
      }

      .form-group label {
        font-weight: 500;
        color: #333;
      }

      .form-control {
        border: 2px solid #f4b8cc;
        border-radius: 8px;
        padding: 12px 15px;
      }

      .form-control:focus {
        border-color: #d44d86;
        box-shadow: 0 0 0 0.2rem rgba(212, 77, 134, 0.25);
      }

      .btn-submit {
        background-color: #f4b8cc;
        border: none;
        padding: 12px 30px;
        border-radius: 8px;
        font-weight: bold;
        color: black;
        transition: all 0.3s ease;
      }

      .btn-submit:hover {
        background-color: #d44d86;
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .btn-back {
        color: #d44d86;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 5px;
        margin-bottom: 20px;
      }

      .btn-back:hover {
        color: #c13d75;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <a href="javascript:history.back()" class="btn-back">
        <i class="fas fa-arrow-left"></i> Back
      </a>

      <div class="card">
        <div class="card-header">
          <h2><i class="fas fa-edit mr-2"></i>Add Product</h2>
        </div>
        <div class="card-body">
          <c:if test="${not empty requestScope.error}">
            <div class="alert alert-danger" role="alert">
              ${requestScope.error}
            </div>
          </c:if>

          <form action="addProduct" method="post" enctype="multipart/form-data">
              <input type="hidden" id="o" name="o" value="${sessionScope.oid}" />

            <div class="form-group">
              <label for="name">Name:</label>
              <input
                type="text"
                class="form-control"
                id="name"
                name="name"
                required
              />
            </div>

            <div class="form-group">
              <label for="stock">Stock:</label>
              <input
                type="number"
                class="form-control"
                id="stock"
                name="stock"
                required
              />
            </div>

            <div class="form-group">
              <label for="thumbnail">Thumbnail:</label>
              <input
                type="file"
                class="form-control-file"
                id="thumbnail"
                name="thumbnail"
              />
            </div>

            <button type="submit" class="btn btn-submit btn-block">
              <i class="fas fa-plus mr-2"></i>Add Product
            </button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
