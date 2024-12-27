<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Điểm Danh</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
    <style>
        body {
            background-color: #f2f4f7; /* Màu nền trang */
            font-family: 'Arial', sans-serif;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin: 50px auto; /* Đưa container vào chính giữa */
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #2c3e50; /* Màu tối cho tiêu đề */
            margin-bottom: 30px;
        }

        h4 {
            font-size: 20px;
            color: #34495e; /* Màu chữ cho thông tin ngày */
        }

        .row.mb-3 {
            margin-bottom: 30px;
        }

        .btn-info {
            background-color: #3498db; /* Màu xanh dương */
            border-color: #2980b9;
            padding: 12px 25px; /* Tăng kích thước của nút */
            font-size: 16px; /* Tăng kích thước chữ */
            border-radius: 5px; /* Bo góc nút */
            text-transform: uppercase; /* Viết hoa chữ */
            font-weight: bold; /* Làm đậm chữ */
        }

        .btn-info:hover {
            background-color: #2980b9; /* Màu xanh dương đậm khi hover */
            border-color: #1c5d8a;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Thêm hiệu ứng bóng khi hover */
        }

        .btn-info:focus, .btn-info:active {
            box-shadow: none; /* Loại bỏ bóng khi click */
        }

        .btn-success {
            background-color: #2ecc71; /* Màu xanh lá */
            border-color: #27ae60;
        }

        .btn-success:hover {
            background-color: #27ae60; /* Màu xanh lá đậm khi hover */
            border-color: #1f8240;
        }

        .btn-sm {
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 5px;
        }

        .table {
            width: 100%;
            margin-bottom: 20px;
            color: #333;
        }

        .table-bordered {
            border: 1px solid #ddd;
        }

        .table th, .table td {
            padding: 12px;
            vertical-align: middle;
            text-align: center;
        }

        .table th {
            background-color:  #0d6efd; 
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f9f9f9; /* Màu nền khi hover qua dòng */
        }

        .table tbody tr td a {
            margin-left: 5px;
        }

        /* Nút Quay lại Trang Chính */
        .back-button {
            background-color: #7f8c8d; /* Màu xám */
            border-color: #7f8c8d;
            color: white;
            font-size: 14px;
            padding: 8px 15px;
            border-radius: 4px;
            display: inline-block;
            text-decoration: none;
            margin-top: 20px;
        }

        .back-button:hover {
            background-color: #95a5a6; /* Màu xám đậm khi hover */
            border-color: #7f8c8d;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 26px;
            }

            h4 {
                font-size: 16px;
            }

            .table th, .table td {
                padding: 8px;
            }

            .btn-sm {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2>Quản Lý Điểm Danh</h2>
        <div class="row mb-3">
            <div class="col">
                <h4>Ngày: ${today}</h4>
            </div>
            <div class="col text-right">
                <a href="<c:url value='/attendance/report?date=${today}'/>" 
                   class="btn btn-info">Xem Báo Cáo</a>
            </div>
        </div>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Mã Nhân Viên</th>
                    <th>Họ Tên</th>
                    <th>Phòng Ban</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employees}" var="employee">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.firstName} ${employee.lastName}</td>
                        <td>${employee.department.name}</td>
                        <td>
                            <form action="<c:url value='/attendance/check-in/${employee.id}'/>" 
                                  method="post" style="display: inline;">
                                <button type="submit" class="btn btn-sm btn-success">Điểm Danh</button>
                            </form>
                            <a href="<c:url value='/attendance/employee/${employee.id}'/>" 
                               class="btn btn-sm btn-info">Lịch Sử</a>
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
