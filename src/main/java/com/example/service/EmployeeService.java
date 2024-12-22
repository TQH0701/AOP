package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.EmployeeDAO;
import com.example.model.Employee;

@Service
@Transactional
public class EmployeeService {

    @Autowired
    private EmployeeDAO employeeDAO;

    public void save(Employee employee) {
        employeeDAO.save(employee);
    }

    public void update(Employee employee) {
        employeeDAO.update(employee);
    }

    public Employee getById(Long id) {
        return employeeDAO.getById(id);
    }

    public void delete(Long id) {
        Employee employee = employeeDAO.getById(id);
        if (employee != null) {
            employeeDAO.delete(employee);
        }
    }

    public List<Employee> getAll() {
        return employeeDAO.getAll();
    }
} 