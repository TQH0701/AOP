package com.example.controller;

import com.example.service.AopLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/aop-monitor")
public class AopLogController {

    @Autowired
    private AopLogService logService;

    // Hiển thị trang giám sát AOP
    @GetMapping
    public String showLogs(Model model) {
        List<String> logs = logService.getLogs();
        model.addAttribute("logs", logs);
        return "aop/monitor";
    }

    // Xóa tất cả logs
    @PostMapping("/clear")
    public String clearLogs() {
        logService.clearLogs();
        return "redirect:/monitor";
    }
}
