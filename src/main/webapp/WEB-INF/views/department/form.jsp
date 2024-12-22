<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Department Form</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.0/css/bootstrap.min.css'/>">
</head>
<body>
    <div class="container mt-4">
        <h2>${department.id == null ? 'Add New' : 'Edit'} Department</h2>
        
        <form:form action="${pageContext.request.contextPath}/departments/save" 
                   method="post" modelAttribute="department" cssClass="col-md-6">
            <form:hidden path="id"/>
            
            <div class="form-group">
                <label>Name:</label>
                <form:input path="name" cssClass="form-control"/>
                <form:errors path="name" cssClass="text-danger"/>
            </div>
            
            <div class="form-group">
                <label>Description:</label>
                <form:textarea path="description" cssClass="form-control" rows="3"/>
                <form:errors path="description" cssClass="text-danger"/>
            </div>
            
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="<c:url value='/departments'/>" class="btn btn-secondary">Cancel</a>
        </form:form>
    </div>
    
    <script src="<c:url value='/webjars/jquery/3.5.1/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.0/js/bootstrap.min.js'/>"></script>
</body>
</html> 