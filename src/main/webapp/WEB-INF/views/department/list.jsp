<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Phòng Ban</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }

        h2 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
            color: #333;
        }

        .alert {
            font-size: 16px;
            font-weight: 600;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 15px;
            text-align: center;
        }

        .table-bordered {
            border: 1px solid #ddd;
        }

        .thead-dark {
            background-color: #343a40;
            color: white;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 5px;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        /* Nút Quay lại Trang Chính */
        .back-button {
            background-color: #6c757d;
            border-color: #6c757d;
            color: white;
            font-size: 14px;
            padding: 8px 15px;
            border-radius: 4px;
            display: inline-block;
            text-decoration: none;
            margin-top: 20px;
        }

        .back-button:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }

            .btn-primary {
                width: 100%;
            }

            .table th, .table td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2>Danh Sách Phòng Ban</h2>
        <a href="<c:url value='/departments/add'/>" class="btn btn-primary mb-3">Thêm Mới Phòng Ban</a>
        
        <c:if test="${param.error != null}">
            <div class="alert alert-danger">${param.error}</div>
        </c:if>
        
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Mô Tả</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${departments}" var="department">
                    <tr>
                        <td>${department.id}</td>
                        <td>${department.name}</td>
                        <td>${department.description}</td>
                        <td>
                            <a href="<c:url value='/departments/edit/${department.id}'/>" 
                               class="btn btn-sm btn-warning">Chỉnh Sửa</a>
                            <a href="<c:url value='/departments/delete/${department.id}'/>" 
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Bạn có chắc chắn không?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Nút quay lại trang chính -->
        <a href="<c:url value='/HomeContro'/>" class="back-button">Quay lại Trang Chính</a>
    </div>
    
    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
</body>
</html>
