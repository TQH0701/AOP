<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Quản Lý Phòng Ban</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group label {
            font-size: 16px;
            font-weight: 600;
            color: #555;
        }

        .form-control {
            font-size: 16px;
            height: 40px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 100px;
        }

        .btn {
            width: 48%;
            padding: 12px;
            font-size: 16px;
            border-radius: 5px;
            text-align: center;
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

        .form-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>${department.id == null ? 'Thêm Mới' : 'Chỉnh Sửa'} Phòng Ban</h2>

        <form:form action="${pageContext.request.contextPath}/departments/save" 
                   method="post" modelAttribute="department">
            <form:hidden path="id"/>

            <div class="form-group">
                <label>Tên Phòng Ban:</label>
                <form:input path="name" class="form-control"/>
                <form:errors path="name" cssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label>Mô Tả:</label>
                <form:textarea path="description" class="form-control" rows="3"/>
                <form:errors path="description" cssClass="text-danger"/>
            </div>

            <div class="form-buttons">
                <button type="submit" class="btn btn-primary">Lưu</button>
                <a href="<c:url value='/departments'/>" class="btn btn-secondary">Quay lại</a>
            </div>
        </form:form>
    </div>

    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
</body>
</html>
