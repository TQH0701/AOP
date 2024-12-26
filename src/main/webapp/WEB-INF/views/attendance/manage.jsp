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
            background-color: #f9f9f9;
            font-family: 'Arial', sans-serif;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin-top: 50px;
            margin-bottom: 50px;
        }

        h2 {
            text-align: center;
            font-size: 32px;
            color: #333;
            margin-bottom: 30px;
        }

        h4 {
            font-size: 20px;
            color: #555;
        }

        .row.mb-3 {
            margin-bottom: 30px;
        }

        .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

        .btn-info:hover {
            background-color: #138496;
            border-color: #117a8b;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .btn-sm {
            padding: 6px 12px;
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
            background-color: #343a40;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table tbody tr td a {
            margin-left: 5px;
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
