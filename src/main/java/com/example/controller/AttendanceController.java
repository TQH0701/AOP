package com.example.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.Employee;
import com.example.service.AttendanceService;
import com.example.service.EmployeeService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private EmployeeService employeeService;

    // Hiển thị trang quản lý điểm danh
    @GetMapping
    public String showAttendancePage(Model model) {
        model.addAttribute("employees", employeeService.getAll());
        model.addAttribute("today", LocalDate.now());
        return "attendance/manage";
    }

    // Check-in cho nhân viên
    @PostMapping("/check-in/{employeeId}")
    public String checkIn(@PathVariable Long employeeId) {
        Employee employee = employeeService.getById(employeeId);
        if (employee != null) {
            attendanceService.checkIn(employee);
        }
        return "redirect:/attendance";
    }

    // Check-out cho nhân viên
    @PostMapping("/check-out/{attendanceId}")
    public String checkOut(@PathVariable Long attendanceId) {
        attendanceService.checkOut(attendanceId);
        return "redirect:/attendance";
    }

    // Hiển thị báo cáo điểm danh theo ngày
    @GetMapping("/report")
    public String showReport(@RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date,
                             Model model) {
        model.addAttribute("attendanceList", attendanceService.getByDate(date));
        model.addAttribute("date", date);
        return "attendance/report";
    }

    // Hiển thị lịch sử điểm danh của nhân viên
    @GetMapping("/employee/{employeeId}")
    public String showEmployeeAttendance(@PathVariable Long employeeId, Model model) {
        Employee employee = employeeService.getById(employeeId);
        if (employee != null) {
            model.addAttribute("employee", employee);
            model.addAttribute("attendanceList", attendanceService.getByEmployee(employee));
        } else {
            model.addAttribute("errorMessage", "Employee not found.");
        }
        return "attendance/employee-report";
    }
}
