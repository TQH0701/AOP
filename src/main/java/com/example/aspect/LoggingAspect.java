package com.example.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import java.util.Arrays;

@Aspect
@Component
public class LoggingAspect {

    // Pointcut declarations
    @Pointcut("execution(* com.example.service.*.*(..))")
    public void allServiceMethods() {}
    
    @Pointcut("execution(* com.example.service.*.save*(..))")
    public void serviceSaveMethods() {}
    
    @Pointcut("execution(* com.example.service.*.delete*(..))")
    public void serviceDeleteMethods() {}

    // Before advice
    @Before("allServiceMethods()")
    public void logBefore(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        Object[] args = joinPoint.getArgs();
        
        System.out.println("=== Before Method Execution ===");
        System.out.println("Calling: " + className + "." + methodName);
        System.out.println("Arguments: " + Arrays.toString(args));
    }

    // After advice
    @After("allServiceMethods()")
    public void logAfter(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        System.out.println("=== After Method Execution ===");
        System.out.println("Finished executing: " + methodName);
    }

    // AfterReturning advice
    @AfterReturning(pointcut = "allServiceMethods()", returning = "result")
    public void logAfterReturning(JoinPoint joinPoint, Object result) {
        String methodName = joinPoint.getSignature().getName();
        System.out.println("=== After Returning ===");
        System.out.println("Method " + methodName + " returned: " + result);
    }

    // AfterThrowing advice
    @AfterThrowing(pointcut = "allServiceMethods()", throwing = "error")
    public void logAfterThrowing(JoinPoint joinPoint, Throwable error) {
        String methodName = joinPoint.getSignature().getName();
        System.out.println("=== After Throwing ===");
        System.out.println("Exception in " + methodName + "(): " + error.getMessage());
    }

    // Around advice
    @Around("serviceSaveMethods() || serviceDeleteMethods()")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().getName();
        long startTime = System.currentTimeMillis();
        
        System.out.println("=== Around - Before ===");
        System.out.println("Starting method: " + methodName);
        
        try {
            Object result = joinPoint.proceed();
            
            long endTime = System.currentTimeMillis();
            System.out.println("=== Around - After ===");
            System.out.println("Method " + methodName + " took " + (endTime - startTime) + "ms");
            
            return result;
        } catch (Exception e) {
            System.out.println("=== Around - Exception ===");
            System.out.println("Method " + methodName + " threw exception: " + e.getMessage());
            throw e;
        }
        
    }
} 