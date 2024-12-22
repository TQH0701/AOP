<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
</head>
<body>
    <div class="container mt-4">
        <h2>Attendance Management</h2>
        <div class="row mb-3">
            <div class="col">
                <h4>Date: ${today}</h4>
            </div>
            <div class="col text-right">
                <a href="<c:url value='/attendance/report?date=${today}'/>" 
                   class="btn btn-info">View Report</a>
            </div>
        </div>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Actions</th>
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
                                <button type="submit" class="btn btn-sm btn-success">Check In</button>
                            </form>
                            <a href="<c:url value='/attendance/employee/${employee.id}'/>" 
                               class="btn btn-sm btn-info">History</a>
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