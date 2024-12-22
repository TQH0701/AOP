package com.example.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.Department;
import com.example.service.DepartmentService;

@Controller
@RequestMapping("/departments")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @GetMapping
    public String listDepartments(Model model) {
        model.addAttribute("departments", departmentService.getAll());
        return "department/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("department", new Department());
        return "department/form";
    }

    @PostMapping("/save")
    public String saveDepartment(@Valid @ModelAttribute Department department, 
                                BindingResult result) {
        if (result.hasErrors()) {
            return "department/form";
        }
        
        if (department.getId() == null) {
            departmentService.save(department);
        } else {
            departmentService.update(department);
        }
        return "redirect:/departments";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("department", departmentService.getById(id));
        return "department/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteDepartment(@PathVariable Long id) {
        try {
            departmentService.delete(id);
        } catch (RuntimeException e) {
            return "redirect:/departments?error=" + e.getMessage();
        }
        return "redirect:/departments";
    }
} 