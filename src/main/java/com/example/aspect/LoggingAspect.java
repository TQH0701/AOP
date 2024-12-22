package com.example.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

    @Before("execution(* com.example.service.EmployeeService.*(..))")
    public void logBefore(JoinPoint joinPoint) {
        System.out.println("Before executing: " + joinPoint.getSignature().getName());
    }

    @After("execution(* com.example.service.EmployeeService.*(..))")
    public void logAfter(JoinPoint joinPoint) {
        System.out.println("After executing: " + joinPoint.getSignature().getName());
    }
} 