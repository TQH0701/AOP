<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Giám sát AOP</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
    <style>
        /* Căn chỉnh trang */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h2 {
            font-weight: bold;
            color: #007bff;
            font-size: 32px;
            text-align: center;
            margin-bottom: 30px;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            margin-top: 50px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .row.mb-3 {
            margin-bottom: 20px;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            font-weight: bold;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            font-weight: bold;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        .log-container {
            max-height: 500px;
            overflow-y: auto;
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fafafa;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .log-entry {
            background-color: #f8f9fa;
            padding: 15px;
            margin-bottom: 10px;
            border-left: 5px solid #007bff;
            font-family: 'Courier New', monospace;
            white-space: pre-wrap;
            border-radius: 5px;
            font-size: 14px;
        }

        .log-entry.security-log {
            border-left-color: #dc3545;
        }

        .log-entry.performance-log {
            border-left-color: #28a745;
        }

        .alert-info {
            background-color: #e9f7fe;
            color: #0c5460;
            border: 1px solid #bee5eb;
        }

        .alert-info h4 {
            font-size: 18px;
            font-weight: bold;
        }

        /* Media query để làm cho trang đáp ứng với các màn hình nhỏ */
        @media (max-width: 767px) {
            .container {
                padding: 15px;
            }

            h2 {
                font-size: 28px;
            }

            .btn-warning, .btn-secondary {
                font-size: 14px;
                padding: 8px 16px;
            }

            .log-entry {
                font-size: 12px;
            }
        }

        /* Thêm hiệu ứng chuyển động cho các entry log */
        .log-entry {
            opacity: 0;
            animation: fadeIn 1s ease-out forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="row mb-3">
            <div class="col">
                <h2>Giám sát AOP</h2>
            </div>
            <div class="col text-right">
                <form action="<c:url value='/aop-monitor/clear'/>" method="post" style="display: inline;">
                    <button type="submit" class="btn btn-warning">Xóa Nhật ký</button>
                </form>
                <a href="<c:url value='/HomeContro'/>" class="btn btn-secondary ml-2">Quay lại Trang Chủ</a>
            </div>
        </div>

        <div class="log-container">
            <c:forEach items="${logs}" var="log">
                <div class="log-entry">
                    ${log}
                </div>
            </c:forEach>

            <c:if test="${empty logs}">
                <div class="alert alert-info">
                    <h4>Không có nhật ký nào.</h4>
                    Hãy thực hiện một số thao tác để xem AOP hoạt động!
                </div>
            </c:if>
        </div>
    </div>

    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
    <script>
        // Tự động làm mới nhật ký mỗi 5 giây
        setInterval(function() {
            location.reload();
        }, 5000);
    </script>
</body>
</html>
