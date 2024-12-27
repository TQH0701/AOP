<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách Nhân viên</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 40px auto;
            background: #ffffff;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
            font-size: 32px;
        }

        .add-button, .back-button {
            display: inline-block;
            margin-bottom: 30px;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .add-button {
            background-color: #28a745;
            color: white;
        }

        .add-button:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }

        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .actions a {
            margin-right: 10px;
            padding: 8px 15px;
            border-radius: 5px;
            border: 1px solid #007bff;
            color: #007bff;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .actions a:hover {
            background-color: #007bff;
            color: white;
        }

        .back-button {
            background-color: #6c757d;
            color: white;
            margin-top: 30px;
        }

        .back-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Nhân viên</h2>
        <a class="add-button" href="<c:url value='/employees/add'/>">Thêm Nhân viên Mới</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Họ</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Chức vụ</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employees}" var="employee">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.firstName}</td>
                        <td>${employee.lastName}</td>
                        <td>${employee.email}</td>
                        <td>${employee.position}</td>
                        <td class="actions">
                            <a href="<c:url value='/employees/edit/${employee.id}'/>">Sửa</a>
                            <a href="<c:url value='/employees/delete/${employee.id}'/>">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="<c:url value='/HomeContro'/>" class="back-button">Quay lại Trang Chính</a>
    </div>
</body>
</html>
