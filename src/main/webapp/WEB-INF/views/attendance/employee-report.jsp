<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Attendance History</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
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