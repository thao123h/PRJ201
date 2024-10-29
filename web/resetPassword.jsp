<%-- Document : requestPassword --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Reset Password</title>
  <style>
    input {
      width: 400px;
      margin-bottom: 26px;
      padding: 7px;
      border-radius: 5px;
    }
    .update {
      background-color: #f4b8cc;
    }
    .update:hover {
      background-color: #e798b2;
    }
  </style>
</head>
<body>
  <%@include file="header.jsp" %>
  <div class="container" style="margin-top: 111px; display: flex; justify-content: center;">
    <div class="content">
      <h3 style="font-size: 1.75rem; margin-top: 76px; margin-bottom: 25px; text-align: center;">RESET PASSWORD</h3>
      
      <!-- Error message -->
      <c:if test="${not empty requestScope.error}">
        <div class="alert alert-danger" role="alert" style="color: red; margin-bottom: 15px; text-align: center; padding: 10px;">
          ${requestScope.error}
        </div>
      </c:if>
      
      <!-- Success message -->
      <c:if test="${not empty requestScope.success}">
        <div class="alert alert-success" role="alert" style="color: green; margin-bottom: 15px; text-align: center; padding: 10px;">
          ${requestScope.success}
        </div>
      </c:if>
      
      <form action="resetPassword" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="token" value="${param.token}" />
        <input placeholder="Email" type="email" name="email" value="${requestScope.email}" required /><br />
        <input placeholder="New Password" type="password" name="password" id="password" required /><br />
        <input placeholder="Confirm New Password" type="password" name="confirm_password" id="confirm_password" required /><br />
        <input class="update" type="submit" value="Change Password" /><br />
      </form>
    </div>
  </div>
  <%@include file="footer.jsp" %>
</body>
<script>
  function validateForm() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirm_password").value;
    if (password !== confirmPassword) {
      alert("Passwords do not match!");
      return false;
    }
    return true;
  }
</script>
</html>
