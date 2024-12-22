package com.example.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.model.Department;

@Repository
public class DepartmentDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public void save(Department department) {
        getSession().save(department);
    }
    
    public void update(Department department) {
        getSession().update(department);
    }
    
    public Department getById(Long id) {
        return getSession().get(Department.class, id);
    }
    
    public void delete(Department department) {
        getSession().delete(department);
    }
    
    @SuppressWarnings("unchecked")
    public List<Department> getAll() {
        return getSession().createQuery("from Department").list();
    }
    
    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
} 