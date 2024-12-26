package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.Employee;
import com.example.service.DepartmentService;
import com.example.service.EmployeeService;

import javax.validation.Valid;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;

    @GetMapping
    public String listEmployees(Model model) {
        model.addAttribute("employees", employeeService.getAll());
        return "employee/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("employee", new Employee());
        model.addAttribute("departments", departmentService.getAll());
        return "employee/form";
    }

    @PostMapping("/save")
    public String saveEmployee(
            @Valid @ModelAttribute Employee employee,
            BindingResult result,
            Model model) {
        if (result.hasErrors()) {
            // Nếu có lỗi validate, trả lại form với thông báo lỗi
            model.addAttribute("departments", departmentService.getAll());
            model.addAttribute("error", "Failed to save the employee. Please check the fields.");
            return "employee/form";
        }
        try {
            if (employee.getId() == null) {
                employeeService.save(employee);
            } else {
                employeeService.update(employee);
            }
            return "redirect:/employees"; // Thành công: chuyển về danh sách nhân viên
        } catch (Exception e) {
            // Xử lý lỗi không mong muốn
            model.addAttribute("departments", departmentService.getAll());
            model.addAttribute("error", "An unexpected error occurred while saving.");
            return "employee/form";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("employee", employeeService.getById(id));
        model.addAttribute("departments", departmentService.getAll());
        return "employee/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable Long id) {
        employeeService.delete(id);
        return "redirect:/employees";
    }
}
