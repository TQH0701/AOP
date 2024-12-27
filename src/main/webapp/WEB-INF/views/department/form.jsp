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
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }

        h2 {
            text-align: center;
            font-size: 26px;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group label {
            font-size: 16px;
            font-weight: 600;
            color: #555;
        }

        .form-control {
            font-size: 16px;
            height: 45px;
            border-radius: 8px;
            border: 1px solid #ced4da;
            padding: 5px;
            width: 100%;
            margin-bottom: 15px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 120px;
            width: 100%;
            margin-bottom: 15px;
        }

        .btn {
            width: 45%;
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
            text-align: center;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            transform: translateY(-3px);
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
            transform: translateY(-3px);
        }

        .text-danger {
            font-size: 12px;
            color: red;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 22px;
            }

            .form-group label {
                font-size: 14px;
            }

            .btn {
                width: 100%;
                margin-top: 10px;
            }

            .form-control, .form-group textarea {
                width: 100%;
            }
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
