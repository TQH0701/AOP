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
        String fullClassName = joinPoint.getTarget().getClass().getName();
        Object[] args = joinPoint.getArgs();

        System.out.println("=====================================");
        System.out.println("[TRƯỚC KHI GỌI PHƯƠNG THỨC] ");
        System.out.println("Phương thức sắp được gọi: " + fullClassName + "." + methodName);
        System.out.println("Thông tin tham số truyền vào: " + Arrays.deepToString(args));
        System.out.println("=====================================");
    }

    // After advice
    @After("allServiceMethods()")
    public void logAfter(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();

        System.out.println("=====================================");
        System.out.println("[SAU KHI THỰC THI PHƯƠNG THỨC] ");
        System.out.println("Phương thức đã được thực thi: " + fullClassName + "." + methodName);
        System.out.println("=====================================");
    }

    // AfterReturning advice
    @AfterReturning(pointcut = "allServiceMethods()", returning = "result")
    public void logAfterReturning(JoinPoint joinPoint, Object result) {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();

        System.out.println("=====================================");
        System.out.println("[SAU KHI NHẬN KẾT QUẢ] ");
        System.out.println("Phương thức: " + fullClassName + "." + methodName);
        System.out.println("Kết quả trả về: " + result);
        System.out.println("=====================================");
    }

    // AfterThrowing advice
    @AfterThrowing(pointcut = "allServiceMethods()", throwing = "error")
    public void logAfterThrowing(JoinPoint joinPoint, Throwable error) {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();

        System.out.println("=====================================");
        System.out.println("[SAU KHI CÓ LỖI XẢY RA] ");
        System.out.println("Phương thức: " + fullClassName + "." + methodName);
        System.out.println("Lỗi gặp phải: " + error.getMessage());
        System.out.println("Chi tiết lỗi: ");
        error.printStackTrace();
        System.out.println("=====================================");
    }

    // Around advice
    @Around("serviceSaveMethods() || serviceDeleteMethods()")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();
        Object[] args = joinPoint.getArgs();
        long startTime = System.currentTimeMillis();

        System.out.println("=====================================");
        System.out.println("[TRƯỚC KHI THỰC THI PHƯƠNG THỨC (AROUND)] ");
        System.out.println("Phương thức: " + fullClassName + "." + methodName);
        System.out.println("Thông tin tham số truyền vào: " + Arrays.deepToString(args));
        System.out.println("Thời gian bắt đầu: " + startTime);
        System.out.println("=====================================");
        
        try {
            Object result = joinPoint.proceed();

            long endTime = System.currentTimeMillis();
            System.out.println("=====================================");
            System.out.println("[SAU KHI THỰC THI PHƯƠNG THỨC (AROUND)] ");
            System.out.println("Phương thức: " + fullClassName + "." + methodName);
            System.out.println("Kết quả trả về: " + result);
            System.out.println("Thời gian hoàn thành: " + endTime);
            System.out.println("Tổng thời gian thực thi: " + (endTime - startTime) + "ms");
            System.out.println("=====================================");
            
            return result;
        } catch (Exception e) {
            long errorTime = System.currentTimeMillis();
            System.out.println("=====================================");
            System.out.println("[LỖI XẢY RA TRONG PHƯƠNG THỨC (AROUND)] ");
            System.out.println("Phương thức: " + fullClassName + "." + methodName);
            System.out.println("Lỗi: " + e.getMessage());
            System.out.println("Thời gian gặp lỗi: " + errorTime);
            System.out.println("Chi tiết lỗi: ");
            e.printStackTrace();
            System.out.println("=====================================");
            throw e;
        }
    }
}
