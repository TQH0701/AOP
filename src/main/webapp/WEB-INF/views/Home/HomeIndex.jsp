<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Lý Hệ Thống</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.0/css/bootstrap.min.css'/>">
    <style>
        body {
            background-color: #e3f2fd;
            font-family: 'Roboto', sans-serif;
            color: #333;
        }

        .navbar-brand {
            font-size: 2rem;
            font-weight: bold;
        }

        .page-header {
            background-color: #0d6efd;
            color: white;
            padding: 30px 0;
            margin-bottom: 30px;
            text-align: center;
        }

        .nav-tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tab-content {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .tab-pane {
            flex: 1;
            text-align: center;
            margin: 10px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .tab-pane h3 {
            color: #0d6efd;
        }

        footer {
            margin-top: 40px;
            text-align: center;
            color: #6c757d;
            font-size: 14px;
            padding: 20px 0;
            background-color: #f8f9fa;
        }

        .btn {
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="page-header">
        <h1>Trang Quản Lý Hệ Thống</h1>
    </div>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="employees" role="tabpanel">
                <div class="card p-4 text-center">
                    <h3>Danh Sách Nhân Viên</h3>
                    <p>Quản lý thông tin nhân viên trong hệ thống.</p>
                    <a href="<c:url value='/employees'/>" class="btn btn-primary">Xem Chi Tiết</a>
                </div>
            </div>

            <div class="tab-pane fade" id="departments" role="tabpanel">
                <div class="card p-4 text-center">
                    <h3>Danh Sách Phòng Ban</h3>
                    <p>Quản lý các phòng ban trong công ty.</p>
                    <a href="<c:url value='/departments'/>" class="btn btn-success">Xem Chi Tiết</a>
                </div>
            </div>

            <div class="tab-pane fade" id="attendance" role="tabpanel">
                <div class="card p-4 text-center">
                    <h3>Điểm Danh Nhân Viên</h3>
                    <p>Theo dõi lịch sử điểm danh của nhân viên.</p>
                    <a href="<c:url value='/attendance'/>" class="btn btn-warning">Xem Chi Tiết</a>
                </div>
            </div>

            <div class="tab-pane fade" id="aop-monitor" role="tabpanel">
                <div class="card p-4 text-center">
                    <h3>AOP Monitor</h3>
                    <p>Kiểm tra và theo dõi các hoạt động của hệ thống.</p>
                    <a href="<c:url value='/aop-monitor'/>" class="btn btn-danger">Xem Chi Tiết</a>
                </div>
            </div>
        </div>
    </div>

    <footer>
        © 2024 Trang Quản Lý. All rights reserved.
    </footer>

    <script src="<c:url value='/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
