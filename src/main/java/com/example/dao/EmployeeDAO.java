package com.example.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.model.Employee;

@Repository
public class EmployeeDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void save(Employee employee) {
        getSession().save(employee);
    }

    public void update(Employee employee) {
        getSession().update(employee);
    }

    public Employee getById(Long id) {
        return getSession().get(Employee.class, id);
    }

    public void delete(Employee employee) {
        getSession().delete(employee);
    }

    @SuppressWarnings("unchecked")
    public List<Employee> getAll() {
        return getSession().createQuery("from Employee").list();
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
} 