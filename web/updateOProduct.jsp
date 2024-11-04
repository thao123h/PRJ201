<%-- 
    Document   : updateProduct
    Created on : Nov 4, 2024, 5:34:54 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
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
                margin-bottom: 8px;
            }
            
            .form-control {
                border: 2px solid #f4b8cc;
                border-radius: 8px;
                padding: 12px 15px;
                height: auto;
                transition: all 0.3s ease;
            }
            
            .form-control:focus {
                border-color: #d44d86;
                box-shadow: 0 0 0 0.2rem rgba(212, 77, 134, 0.25);
            }
            
            .form-control[readonly] {
                background-color: #f8f9fa;
                border-color: #ddd;
            }
            
            select.form-control {
                cursor: pointer;
            }
            
            .btn-submit {
                background-color: #f4b8cc;
                border: none;
                padding: 12px 30px;
                border-radius: 8px;
                font-weight: bold;
                color: black;
                transition: all 0.3s ease;
                margin-top: 20px;
            }
            
            .btn-submit:hover {
                background-color: #d44d86;
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            
            .btn-back {
                color: #d44d86;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 5px;
                margin-bottom: 20px;
                font-weight: 500;
            }
            
            .btn-back:hover {
                color: #c13d75;
                text-decoration: none;
            }
            
            textarea.form-control {
                min-height: 100px;
                resize: vertical;
            }
            
            .input-group-text {
                background-color: #f4b8cc;
                border: 2px solid #f4b8cc;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <a href="dashboard" class="btn-back">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
            
            <div class="card">
                <div class="card-header">
                    <h2><i class="fas fa-edit mr-2"></i>Update Product</h2>
                </div>
                <div class="card-body">
                    <c:set value="${requestScope.pupdate}" var="p"/>
                    <form action="dashboard" method="post">
                        <div class="form-group">
                            <label for="id">Product ID</label>
                            <input type="text" class="form-control" id="id" name="id" value="${p.id}" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="category">Category</label>
                            <select class="form-control" id="category" name="c">
                                <option value="1" ${p.category == 1 ? 'selected' : ''}>Túi tote</option>
                                <option value="2" ${p.category == 2 ? 'selected' : ''}>Dây buộc tóc</option>
                                <option value="3" ${p.category == 3 ? 'selected' : ''}>Vòng cổ</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" class="form-control" id="title" name="t" value="${p.title}" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="price">Listed Price</label>
                            <div class="input-group">
                                <input type="number" class="form-control" id="price" name="p" value="${p.listedPrice}" required>
                                <div class="input-group-append">
                                    <span class="input-group-text">đ</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" name="d" required>${p.description}</textarea>
                        </div>
                        
                        <div class="form-group">
                            <label for="discount">Discount</label>
                            <div class="input-group">
                                <input type="number" class="form-control" id="discount" name="di" value="${p.discount}" required>
                                <div class="input-group-append">
                                    <span class="input-group-text">%</span>
                                </div>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-submit btn-block">
                            <i class="fas fa-save mr-2"></i>Update Product
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
