<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Order Management</title>
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

      .table-container {
        padding: 20px;
        background-color: white;
      }

      .table {
        background: white;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
        border-radius: 10px;
      }

      .table thead {
        background-color: #f4b8cc;
      }

      .table thead th {
        color: black;
        font-weight: bold;
        border: none;
      }

      .status-badge {
        padding: 5px 10px;
        border-radius: 15px;
        font-weight: 500;
        font-size: 12px;
      }

      .status-pending {
        background-color: #ffeeba;
        color: #856404;
      }

      .status-processing {
        background-color: #b8e6ff;
        color: #004085;
      }

      .status-completed {
        background-color: #c3e6cb;
        color: #155724;
      }

      .status-cancelled {
        background-color: #f5c6cb;
        color: #721c24;
      }

      .action-btn {
        background-color: #f4b8cc;
        color: black;
        border: 2px solid #f4b8cc;
        padding: 6px 15px;
        border-radius: 5px;
        transition: all 0.3s ease;
        text-decoration: none;
        font-size: 14px;
      }

      .action-btn:hover {
        background-color: white;
        color: #d44d86;
        text-decoration: none;
      }

      .table td {
        vertical-align: middle;
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
            <a class="nav-link" href="dashboard">
              <i class="fas fa-box"></i> Products
            </a>
            <a class="nav-link" href="users">
              <i class="fas fa-users"></i> Users
            </a>
            <a class="nav-link active" href="orders">
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
              <i class="fas fa-shopping-cart mr-2"></i>Orders Management
            </h2>
          </div>

          <div class="table-container">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>Order ID</th>
                  <th>Customer</th>
                  <th>Order Date</th>
                  <th>Total Amount</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${requestScope.orders}" var="o">
                  <tr>
                    <td>${o.id}</td>
                    <td>${o.user.fullname}</td>
                    <td>${o.orderDate}</td>
                    <td>${o.totalMoney}</td>
                    <td>
                        <c:if test="${o.status == 0}">
                            pending
                        </c:if>
                            <c:if test="${o.status == 1}">
                            approved
                        </c:if>
                            <c:if test="${o.status == 2}">
                            cancel
                        </c:if>
                    
                    </td>
                    <td>
                      <a href="orderDetail?id=${o.id}" class="action-btn">
                        <i class="fas fa-eye"></i> View Details
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
