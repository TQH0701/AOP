<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Nhân viên</title>
    <style>
        /* Base styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin: 30px 0;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }

        .container {
            width: 85%;
            max-width: 1200px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .add-button {
            display: inline-block;
            margin-bottom: 30px;
            padding: 12px 25px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-button:hover {
            background-color: #218838;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 12px 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
        }

        th {
            background-color: #007bff;
            color: white;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .actions a {
            margin-right: 15px;
            color: #007bff;
            font-size: 14px;
            padding: 6px 12px;
            border: 1px solid #007bff;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        .actions a:hover {
            background-color: #007bff;
            color: white;
        }

        .actions a:active {
            background-color: #0056b3;
        }

        /* Back button styles */
        .back-button {
            display: inline-block;
            padding: 8px 15px; /* Decrease size of button */
            background-color: #6c757d;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 14px; /* Smaller font size */
            cursor: pointer;
            margin-top: 20px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #5a6268;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px;
            }

            .add-button, .back-button {
                width: 100%;
                margin-bottom: 20px;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 10px;
            }
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
