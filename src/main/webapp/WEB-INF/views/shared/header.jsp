<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="<c:url value='/'/>">HR Management</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/employees'/>">Employees</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/departments'/>">Departments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/attendance'/>">Attendance</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/aop-monitor'/>">AOP Monitor</a>
                </li>
            </ul>
        </div>
    </div>
</nav> 