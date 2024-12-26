package com.example.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class PerformanceAspect {

    @Pointcut("execution(* com.example.dao.*.*(..))")
    public void daoMethods() {}

    @Around("daoMethods()")
    public Object measureExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        
        System.out.println("\n=== Performance Monitoring ===");
        System.out.println("Starting execution of: " + className + "." + methodName);
        System.out.println("Start time: " + new java.util.Date());
        
        long startTime = System.nanoTime();
        try {
            Object result = joinPoint.proceed();
            long endTime = System.nanoTime();
            long duration = (endTime - startTime) / 1_000_000; // Convert to milliseconds
            
            System.out.println("End time: " + new java.util.Date());
            System.out.println("Duration: " + duration + "ms");
            System.out.println("============================\n");
            
            return result;
        } catch (Throwable e) {
            System.out.println("Error occurred after " + 
                ((System.nanoTime() - startTime) / 1_000_000) + "ms");
            System.out.println("Error message: " + e.getMessage());
            System.out.println("============================\n");
            throw e;
        }
    }
} 