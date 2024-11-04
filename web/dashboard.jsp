<%-- Document : dashboard Created on : Oct 7, 2024, 3:20:32 PM Author : asus
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Admin Dashboard</title>
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

      .container-fluid {
        padding: 0;
      }

      .row {
        margin: 0;
      }

      .sidebar {
        background-color: white;
        min-height: 100vh;
        color: black;
        box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        padding: 0;
      }

      .sidebar .profile-section {
        background-color: #f4b8cc;
        padding: 25px;
        text-align: center;
        margin-bottom: 20px;
      }

      .sidebar .profile-section h4 {
        margin: 10px 0;
        font-size: 1.2rem;
        color: black;
        font-weight: bold;
      }

      .sidebar .nav-link {
        color: black;
        padding: 1rem 1.5rem;
        transition: all 0.3s ease;
        border-left: 4px solid transparent;
        font-weight: 500;
      }

      .sidebar .nav-link:hover {
        background: #f4b8cc;
        border-left: 4px solid #d44d86;
      }

      .sidebar .nav-link.active {
        background: #f4b8cc;
        border-left: 4px solid #d44d86;
      }

      .sidebar .nav-link i {
        margin-right: 10px;
        width: 20px;
        text-align: center;
        color: #d44d86;
      }

      .main-content {
        background-color: white;
        min-height: 100vh;
        padding: 0;
        margin: 0;
        overflow-x: auto;
        border-radius: 0;
      }

      .header-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        background-color: white;
        border-bottom: 2px solid #f4b8cc;
      }

      .page-title {
        color: black;
        font-weight: bold;
        margin: 0;
        padding: 0;
        border: none;
      }

      .add-product-btn {
        margin-left: auto;
      }

      .table-container {
        padding: 20px;
        background-color: white;
      }

      .table-wrapper {
        margin: 0;
        overflow-x: auto;
      }

      .table {
        background: white;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
        border-radius: 10px;
        margin-bottom: 0;
        min-width: 1200px;
      }

      .table thead {
        background-color: #f4b8cc;
      }

      .table thead th {
        color: black;
        font-weight: bold;
        border: none;
      }

      .btn-primary {
        background-color: #f4b8cc;
        border: none;
        color: black;
        font-weight: bold;
        padding: 10px 20px;
        transition: all 0.3s ease;
      }

      .btn-primary:hover {
        background-color: #d44d86;
        color: white;
      }

      .action-buttons {
        display: flex;
        flex-direction: column;
        gap: 5px;
        min-width: 100px;
      }

      .action-btn {
        width: 100%;
        padding: 6px 8px;
        border-radius: 6px;
        font-size: 12px;
        justify-content: center;
      }

      .edit-btn {
        background-color: #f4b8cc;
        color: black;
        border: 2px solid #f4b8cc;
      }

      .edit-btn:hover {
        background-color: white;
        color: #d44d86;
        border-color: #f4b8cc;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .delete-btn {
        background-color: white;
        color: #ff4d6d;
        border: 2px solid #ff4d6d;
      }

      .delete-btn:hover {
        background-color: #ff4d6d;
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .action-btn i {
        font-size: 14px;
      }

      .table td:last-child {
        min-width: 100px;
        padding: 8px;
      }

      .action-btn:active {
        transform: translateY(0);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      .badge-category {
        background-color: #f4b8cc;
        color: black;
        padding: 8px 15px;
        border-radius: 20px;
        font-weight: 500;
        font-size: 12px;
      }

      .table td,
      .table th {
        padding: 12px 15px;
      }

      .table-striped tbody tr:nth-of-type(odd) {
        background-color: #fff9fb;
      }

      .product-link {
        color: #d44d86;
        font-weight: 500;
        text-decoration: none;
      }

      .product-link:hover {
        color: #c13d75;
        text-decoration: underline;
      }

      .table td:nth-child(5) {
        max-width: 200px;
      }

      .description-cell {
        max-width: 200px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        position: relative;
      }

      .description-cell:hover {
        overflow: visible;
        white-space: normal;
        background-color: white;
        position: absolute;
        z-index: 1;
        border: 1px solid #f4b8cc;
        border-radius: 4px;
        padding: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
      }
    </style>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <!-- Sidebar -->
        <div class="col-2 sidebar">
          <div class="profile-section">
            <i class="fas fa-user-circle fa-3x"></i>
            <h4>${sessionScope.user.fullname}</h4>
          </div>
          <nav class="nav flex-column">
            <a class="nav-link active" href="dashboard">
              <i class="fas fa-box"></i> Products
            </a>
            <a class="nav-link" href="users">
              <i class="fas fa-users"></i> Users
            </a>
            <a class="nav-link" href="orders">
              <i class="fas fa-shopping-cart"></i> Orders
            </a>
            <a class="nav-link" href="statistics">
              <i class="fas fa-chart-bar"></i> Statistics
            </a>
            <a class="nav-link" href="logout">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </nav>
        </div>

        <!-- Main Content -->
        <div class="col-10 main-content">
          <div class="header-content">
            <h2 class="page-title">
              <i class="fas fa-box mr-2"></i>Products Management
            </h2>
            <a
              href="addOProduct.jsp"
              class="btn btn-primary btn-lg add-product-btn"
            >
              <i class="fas fa-plus"></i> Add New Product
            </a>
          </div>

          <div class="table-container">
            <div class="table-wrapper">
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Category</th>
                    <th>Title</th>
                    <th>Listed Price</th>
                    <th>Description</th>
                    <th>Discount</th>
                    <th>Final Price</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${requestScope.list}" var="op">
                    <tr>
                      <td>
                        <a href="productDetail?id=${op.id}" target="_blank"
                          >${op.id}</a
                        >
                      </td>
                      <td>
                        <c:if test="${op.category == 1}">
                          <span
                            class="badge badge-pill"
                            style="background-color: #ffc2d6; color: #d44d86"
                            >Túi tote</span
                          >
                        </c:if>
                        <c:if test="${op.category == 2}">
                          <span
                            class="badge badge-pill"
                            style="background-color: #ffc2d6; color: #d44d86"
                            >Dây buộc tóc</span
                          >
                        </c:if>
                        <c:if test="${op.category == 3}">
                          <span
                            class="badge badge-pill"
                            style="background-color: #ffc2d6; color: #d44d86"
                            >Vòng cổ</span
                          >
                        </c:if>
                      </td>
                      <td>${op.title}</td>
                      <td>${op.listedPrice}đ</td>
                      <td class="description-cell" title="${op.description}">
                        ${op.description}
                      </td>
                      <td>${op.discount}%</td>
                      <td>${op.finalPrice}đ</td>
                      <td class="action-buttons">
                        <button
                          onclick="doUpdate('${op.id}')"
                          class="action-btn edit-btn"
                        >
                          <i class="fas fa-edit"></i>
                          Edit
                        </button>
                        <button
                          onclick="doDelete('${op.id}')"
                          class="action-btn delete-btn"
                        >
                          <i class="fas fa-trash"></i>
                          Delete
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      function doDelete(id) {
        if (confirm("Are you sure you want to delete product ID " + id + "?")) {
          window.location = "deleteop?did=" + id;
        }
      }

      function doUpdate(id) {
        window.location = "dashboard?uid=" + id;
      }
    </script>
  </body>
</html>
