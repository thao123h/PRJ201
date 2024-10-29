<%-- Document : login Created on : Oct 29, 2024, 11:32:20 AM Author : asus --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Đăng nhập</title>
    <link
      rel="stylesheet"
      href="./assets/bootstrap-4.6.2-dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
    <style>
      body {
        background-color: #f8f9fa;
        font-family: "Roboto", sans-serif;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .login-container {
        width: 100%;
        max-width: 400px;
        padding: 40px;
        background-color: white;
        border-radius: 15px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
      }

      .login-header {
        text-align: center;
        margin-bottom: 30px;
      }

      .login-header h2 {
        color: #333;
        font-weight: 700;
        margin-bottom: 10px;
      }

      .login-header p {
        color: #666;
        font-size: 0.9rem;
      }

      .form-group {
        margin-bottom: 20px;
        position: relative;
      }

      .form-group i {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #f4b8cc;
      }

      .form-control {
        height: 50px;
        padding-left: 45px;
        border: 1px solid #ddd;
        border-radius: 10px;
        transition: all 0.3s ease;
      }

      .form-control:focus {
        border-color: #f4b8cc;
        box-shadow: 0 0 0 0.2rem rgba(244, 184, 204, 0.25);
      }

      .btn-login {
        width: 100%;
        height: 50px;
        background-color: #f4b8cc;
        border: none;
        border-radius: 10px;
        color: white;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        margin-top: 20px;
      }

      .btn-login:hover {
        background-color: #e798b2;
        transform: translateY(-2px);
      }

      .divider {
        text-align: center;
        margin: 20px 0;
        position: relative;
      }

      .divider::before {
        content: "";
        position: absolute;
        left: 0;
        top: 50%;
        width: 45%;
        height: 1px;
        background-color: #ddd;
      }

      .divider::after {
        content: "";
        position: absolute;
        right: 0;
        top: 50%;
        width: 45%;
        height: 1px;
        background-color: #ddd;
      }

      .divider span {
        background-color: white;
        padding: 0 10px;
        color: #666;
        font-size: 0.9rem;
      }

      .bottom-links {
        text-align: center;
        margin-top: 20px;
      }

      .bottom-links a {
        color: #f4b8cc;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .bottom-links a:hover {
        color: #e798b2;
      }

      .error-message {
        color: #dc3545;
        text-align: center;
        margin-bottom: 15px;
        font-size: 0.9rem;
      }
    </style>
  </head>
  <body>
    <div class="login-container">
      <div class="login-header">
        <h2>ĐĂNG NHẬP</h2>
        <p>Chào mừng bạn đến với GLAM CLOSET </p>
      </div>
  <c:forEach items="${pageContext.request.cookies}" var="c">
        <c:if test="${c.getName() != null && c.getName().equals('email')}">
            <c:set var="email" value="${c.getValue()}"></c:set>
        </c:if>
        <c:if test="${c.getName()!= null && c.getName().equals('pass')}">
            <c:set var="pass" value="${c.getValue()}"></c:set>
        </c:if>
    </c:forEach>
        <h6>${sessionScope.msg}</h6>
      <form action="login" method="post">
        <div class="form-group">
          <i class="fas fa-envelope"></i>
          <input
            type="email"
            class="form-control"
            name="email"
            placeholder="Email của bạn"
            required
            value ="${email}"
          />
        </div>

        <div class="form-group">
          <i class="fas fa-lock"></i>
          <input
            type="password"
            class="form-control"
            name="password"
            placeholder="Mật khẩu"
            required
              value ="${pass}"
          />
        </div>

        <button type="submit" class="btn btn-login">ĐĂNG NHẬP</button>
      </form>

      <div class="divider">
        <span>hoặc</span>
      </div>

      <div class="bottom-links">
        <p>
          <a href="requestPassword.jsp">Quên mật khẩu?</a>
        </p>
        <p>Chưa có tài khoản? <a href="regis.jsp">Đăng ký ngay</a></p>
      </div>
    </div>
  </body>
</html>
