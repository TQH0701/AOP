<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Attendance History</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
    <style>
        body {
            background-color: #f8f9fa;
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

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
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
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2>Attendance History</h2>
        <div class="row mb-3">
            <div class="col">
                <h4>Employee: ${employee.firstName} ${employee.lastName}</h4>
                <p>Department: ${employee.department.name}</p>
            </div>
            <div class="col text-right">
                <a href="<c:url value='/attendance'/>" class="btn btn-secondary">Back</a>
            </div>
        </div>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Date</th>
                    <th>Check In</th>
                    <th>Check Out</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${attendanceList}" var="attendance">
                    <tr>
                        <td>${attendance.date}</td>
                        <td>${attendance.checkIn}</td>
                        <td>${attendance.checkOut}</td>
                        <td>${attendance.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
</body>
</html>
