<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Department List</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
</head>
<body>
    <div class="container mt-4">
        <h2>Department List</h2>
        <a href="<c:url value='/departments/add'/>" class="btn btn-primary mb-3">Add New Department</a>
        
        <c:if test="${param.error != null}">
            <div class="alert alert-danger">${param.error}</div>
        </c:if>
        
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${departments}" var="department">
                    <tr>
                        <td>${department.id}</td>
                        <td>${department.name}</td>
                        <td>${department.description}</td>
                        <td>
                            <a href="<c:url value='/departments/edit/${department.id}'/>" 
                               class="btn btn-sm btn-warning">Edit</a>
                            <a href="<c:url value='/departments/delete/${department.id}'/>" 
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Are you sure?')">Delete</a>
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