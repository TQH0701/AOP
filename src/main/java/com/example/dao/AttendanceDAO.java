package com.example.dao;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.model.Attendance;
import com.example.model.Employee;

@Repository
public class AttendanceDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public void save(Attendance attendance) {
        getSession().save(attendance);
    }
    
    public void update(Attendance attendance) {
        getSession().update(attendance);
    }
    
    public Attendance getById(Long id) {
        return getSession().get(Attendance.class, id);
    }
    
    public List<Attendance> getByEmployee(Employee employee) {
        return getSession()
            .createQuery("from Attendance where employee = :employee")
            .setParameter("employee", employee)
            .list();
    }
    
    public List<Attendance> getByDate(LocalDate date) {
        return getSession()
            .createQuery("from Attendance where date = :date")
            .setParameter("date", date)
            .list();
    }
    
    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
} 