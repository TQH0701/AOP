<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
    <style>
        body {
            background-color: #f9fafb;
            font-family: 'Roboto', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            font-size: 28px;
            font-weight: bold;
            text-align: left;
            color: #444;
            margin: 20px 0 30px;
        }

        .nav-tabs {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }

        .tab-content {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .tab-pane {
            flex: 1;
            text-align: center;
            margin: 10px;
            padding: 20px; /* Khoảng cách bên trong */
            border: 1px solid #ddd; /* Khung cho từng phần */
            border-radius: 5px; /* Bo góc */
            background-color: #fff; /* Màu nền trắng */
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); /* Đổ bóng cho khung */
        }

        .tab-pane h3 {
            color: #007bff; /* Màu tiêu đề */
        }

        footer {
            margin-top: 40px;
            text-align: center;
            color: #888;
            font-size: 14px;
        }

        .btn {
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn:hover {
            transform: scale(1.05);
        }

        /* Thêm màu sắc cho các nút */
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Trang Quản Lý Hệ Thống</h1>
        <!-- Tabs Điều Hướng -->
        <ul class="nav nav-tabs" id="managementTabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="employees-tab" data-toggle="tab" href="#employees" role="tab" aria-controls="employees" aria-selected="true">Nhân Viên</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="departments-tab" data-toggle="tab" href="#departments" role="tab" aria-controls="departments" aria-selected="false">Phòng Ban</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="attendance-tab" data-toggle="tab" href="#attendance" role="tab" aria-controls="attendance" aria-selected="false">Điểm Danh</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="aop-monitor-tab" data-toggle="tab" href="#aop-monitor" role="tab" aria-controls="aop-monitor" aria-selected="false">AOP Monitor</a>
            </li>
        </ul>

        <!-- Nội Dung Các Tabs -->
        <div class="tab-content">
            <!-- Tab Nhân Viên -->
            <div class="tab-pane fade show active" id="employees" role="tabpanel" aria-labelledby="employees-tab">
                <h3>Danh Sách Nhân Viên</h3>
                <p>Quản lý thông tin nhân viên trong hệ thống.</p>
                <a href="<c:url value='/employees'/>" class="btn btn-primary">Xem Chi Tiết</a>
            </div>

            <!-- Tab Phòng Ban -->
            <div class="tab-pane fade" id="departments" role="tabpanel" aria-labelledby="departments-tab">
                <h3>Danh Sách Phòng Ban</h3>
                <p>Quản lý các phòng ban trong công ty.</p>
                <a href="<c:url value='/departments'/>" class="btn btn-success">Xem Chi Tiết</a>
            </div>

            <!-- Tab Điểm Danh -->
            <div class="tab-pane fade" id="attendance" role="tabpanel" aria-labelledby="attendance-tab">
                <h3>Điểm Danh Nhân Viên</h3>
                <p>Theo dõi lịch sử điểm danh của nhân viên.</p>
                <a href="<c:url value='/attendance'/>" class="btn btn-warning">Xem Chi Tiết</a>
            </div>

            <!-- Tab AOP Monitor -->
            <div class="tab-pane fade" id="aop-monitor" role="tabpanel" aria-labelledby="aop-monitor-tab">
                <h3>AOP Monitor</h3>
                <p>Kiểm tra và theo dõi các hoạt động của hệ thống.</p>
                <a href="<c:url value='/aop-monitor'/>" class="btn btn-danger">Xem Chi Tiết</a>
            </div>
        </div>
    </div>

    <footer>
        © 2024 Trang Quản Lý. All rights reserved.
    </footer>

    <!-- Scripts -->
    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
</body>
</html>