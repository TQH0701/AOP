<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Form</title>
</head>
<body>
    <h2>Employee Form</h2>
    <form:form action="${pageContext.request.contextPath}/employees/save" method="post" modelAttribute="employee">
        <form:hidden path="id"/>
        <div>
            <label>First Name:</label>
            <form:input path="firstName"/>
        </div>
        <div>
            <label>Last Name:</label>
            <form:input path="lastName"/>
        </div>
        <div>
            <label>Email:</label>
            <form:input path="email"/>
        </div>
        <div>
            <label>Position:</label>
            <form:input path="position"/>
        </div>
        <div class="form-group">
            <label>Department:</label>
            <form:select path="department" cssClass="form-control">
                <form:option value="" label="-- Select Department --"/>
                <form:options items="${departments}" itemValue="id" itemLabel="name"/>
            </form:select>
            <form:errors path="department" cssClass="text-danger"/>
        </div>
        <button type="submit">Save</button>
    </form:form>
</body>
</html> 