<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Nhân Viên</title>
    <!-- Using Bootstrap 4.6 -->
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
    
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Arial', sans-serif;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 30px auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
        }

        .form-group label {
            font-weight: bold;
            color: #555;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            font-size: 16px;
            height: 40px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .form-group select {
            height: 45px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        .text-danger {
            font-size: 12px;
            color: red;
        }

        .form-group {
            margin-bottom: 20px;
        }

        /* Responsive layout */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>${employee.id == null ? 'Thêm Mới' : 'Chỉnh Sửa'} Nhân Viên</h2>
        
        <form:form action="${pageContext.request.contextPath}/employees/save" 
                   method="post" modelAttribute="employee">
            <form:hidden path="id"/>
            
            <!-- Họ -->
            <div class="form-group">
                <label>Họ:</label>
                <form:input path="firstName" class="form-control"/>
                <form:errors path="firstName" cssClass="text-danger"/>
            </div>
            
            <!-- Tên -->
            <div class="form-group">
                <label>Tên:</label>
                <form:input path="lastName" class="form-control"/>
                <form:errors path="lastName" cssClass="text-danger"/>
            </div>
            
            <!-- Email -->
            <div class="form-group">
                <label>Email:</label>
                <form:input path="email" class="form-control" type="email"/>
                <form:errors path="email" cssClass="text-danger"/>
            </div>
            
            <!-- Chức vụ -->
            <div class="form-group">
                <label>Chức vụ:</label>
                <form:input path="position" class="form-control"/>
                <form:errors path="position" cssClass="text-danger"/>
            </div>
            
            <!-- Phòng ban -->
            <div class="form-group">
                <label>Phòng ban:</label>
                <form:select path="department.id" class="form-control">
                    <form:option value="" label="-- Chọn Phòng Ban --"/>
                    <form:options items="${departments}" itemValue="id" itemLabel="name"/>
                </form:select>
                <form:errors path="department" cssClass="text-danger"/>
            </div>
            
            <!-- Các nút -->
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Lưu</button>
            </div>
            
            <a href="<c:url value='/employees'/>" class="btn btn-secondary">Hủy</a>
        </form:form>
    </div>

    <!-- JS and Bootstrap -->
    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
</body>
</html>
