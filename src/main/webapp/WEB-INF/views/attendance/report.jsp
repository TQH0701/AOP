<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Report</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
</head>
<body>
    <div class="container mt-4">
        <h2>Attendance Report</h2>
        <div class="row mb-3">
            <div class="col">
                <h4>Date: ${date}</h4>
            </div>
            <div class="col text-right">
                <a href="<c:url value='/attendance'/>" class="btn btn-secondary">Back</a>
            </div>
        </div>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Employee</th>
                    <th>Department</th>
                    <th>Check In</th>
                    <th>Check Out</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${attendanceList}" var="attendance">
                    <tr>
                        <td>${attendance.employee.firstName} ${attendance.employee.lastName}</td>
                        <td>${attendance.employee.department.name}</td>
                        <td>${attendance.checkIn}</td>
                        <td>${attendance.checkOut}</td>
                        <td>${attendance.status}</td>
                        <td>
                            <c:if test="${attendance.checkOut == null}">
                                <form action="<c:url value='/attendance/check-out/${attendance.id}'/>" 
                                      method="post">
                                    <button type="submit" class="btn btn-sm btn-warning">Check Out</button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
</body>
</html> 