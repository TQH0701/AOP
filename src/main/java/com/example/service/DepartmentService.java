package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.DepartmentDAO;
import com.example.model.Department;

@Service
@Transactional
public class DepartmentService {

    @Autowired
    private DepartmentDAO departmentDAO;

    public void save(Department department) {
        departmentDAO.save(department);
    }

    public void update(Department department) {
        departmentDAO.update(department);
    }

    public Department getById(Long id) {
        return departmentDAO.getById(id);
    }

    public void delete(Long id) {
        Department department = departmentDAO.getById(id);
        if (department != null && (department.getEmployees() == null || department.getEmployees().isEmpty())) {
            departmentDAO.delete(department);
        } else {
            throw new RuntimeException("Cannot delete department with assigned employees");
        }
    }

    public List<Department> getAll() {
        return departmentDAO.getAll();
    }
} 