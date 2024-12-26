package com.example.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class SecurityAspect {

    @Pointcut("execution(* com.example.service.*.delete*(..))")
    public void deleteOperations() {}

    @Pointcut("execution(* com.example.service.*.save*(..))")
    public void saveOperations() {}

    @Before("deleteOperations()")
    public void logDeleteOperation(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        
        System.out.println("=== Security Check ===");
        System.out.println("Attempting to delete in " + className + "." + methodName);
        // Ở đây có thể thêm logic kiểm tra quyền
    }

    @Before("saveOperations()")
    public void logSaveOperation(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        
        System.out.println("=== Security Check ===");
        System.out.println("Attempting to save in " + className + "." + methodName);
        // Ở đây có thể thêm logic kiểm tra quyền
    }
} 