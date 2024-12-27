package com.example.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.example.service.AopLogService;
import java.util.Arrays;

@Aspect
@Component
public class LoggingAspect {

    @Autowired
    private AopLogService aopLogService;

    @Pointcut("execution(* com.example.service.*.*(..)) && !within(com.example.service.AopLogService) ")
    public void allServiceMethods() {}

    @Pointcut("execution(* com.example.service.*.save*(..)) && !within(com.example.service.AopLogService) ")
    public void serviceSaveMethods() {}

    @Pointcut("execution(* com.example.service.*.delete*(..)) && !within(com.example.service.AopLogService) ")
    public void serviceDeleteMethods() {}

    @Before("allServiceMethods()")
    public void logBefore(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();
        Object[] args = joinPoint.getArgs();

        String log = "[TRƯỚC KHI GỌI PHƯƠNG THỨC] \n" +
                     "Phương thức sắp được gọi: " + fullClassName + "." + methodName + "\n" +
                     "Thông tin tham số truyền vào: " + Arrays.deepToString(args);
        System.out.println(log);
        aopLogService.addLog(log);
    }

    @After("allServiceMethods()")
    public void logAfter(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();

        String log = "[SAU KHI THỰC THI PHƯƠNG THỨC] \n" +
                     "Phương thức đã được thực thi: " + fullClassName + "." + methodName;
        System.out.println(log);
        aopLogService.addLog(log);
    }

    @AfterReturning(pointcut = "allServiceMethods()", returning = "result")
    public void logAfterReturning(JoinPoint joinPoint, Object result) {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();

        String log = "[SAU KHI NHẬN KẾT QUẢ] \n" +
                     "Phương thức: " + fullClassName + "." + methodName + "\n" +
                     "Kết quả trả về: " + result;
        System.out.println(log);
        aopLogService.addLog(log);
    }

    @AfterThrowing(pointcut = "allServiceMethods()", throwing = "error")
    public void logAfterThrowing(JoinPoint joinPoint, Throwable error) {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();

        String log = "[SAU KHI CÓ LỖI XẢY RA] \n" +
                     "Phương thức: " + fullClassName + "." + methodName + "\n" +
                     "Lỗi gặp phải: " + error.getMessage();
        System.out.println(log);
        aopLogService.addLog(log);
    }

    @Around("serviceSaveMethods() || serviceDeleteMethods()")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().getName();
        String fullClassName = joinPoint.getTarget().getClass().getName();
        Object[] args = joinPoint.getArgs();
        long startTime = System.currentTimeMillis();

        String logStart = "[TRƯỚC KHI THỰC THI PHƯƠNG THỨC (AROUND)] \n" +
                          "Phương thức: " + fullClassName + "." + methodName + "\n" +
                          "Thời gian bắt đầu: " + startTime;
        System.out.println(logStart);
        aopLogService.addLog(logStart);

        try {
            Object result = joinPoint.proceed();

            long endTime = System.currentTimeMillis();
            String logEnd = "[SAU KHI THỰC THI PHƯƠNG THỨC (AROUND)] \n" +
                            "Phương thức: " + fullClassName + "." + methodName + "\n" +
                            "Kết quả trả về: " + result + "\n" +
                            "Tổng thời gian thực thi: " + (endTime - startTime) + "ms";
            System.out.println(logEnd);
            aopLogService.addLog(logEnd);
            return result;
        } catch (Exception e) {
            long errorTime = System.currentTimeMillis();
            String logError = "[LỖI XẢY RA TRONG PHƯƠNG THỨC (AROUND)] \n" +
                              "Phương thức: " + fullClassName + "." + methodName + "\n" +
                              "Lỗi: " + e.getMessage() + "\n" +
                              "Thời gian gặp lỗi: " + errorTime;
            System.out.println(logError);
            aopLogService.addLog(logError);
            throw e;
        }
    }
}
