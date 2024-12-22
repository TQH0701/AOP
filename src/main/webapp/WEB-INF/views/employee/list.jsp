<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
</head>
<body>
    <h2>Employee List</h2>
    <a href="<c:url value='/employees/add'/>">Add New Employee</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Position</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${employees}" var="employee">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.firstName}</td>
                <td>${employee.lastName}</td>
                <td>${employee.email}</td>
                <td>${employee.position}</td>
                <td>
                    <a href="<c:url value='/employees/edit/${employee.id}'/>">Edit</a>
                    <a href="<c:url value='/employees/delete/${employee.id}'/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html> 