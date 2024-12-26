package com.example.dao;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.model.Attendance;
import com.example.model.AttendanceStatus;
import com.example.model.Employee;

@Repository
public class AttendanceDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public void save(Attendance attendance) {
        attendance.setStatus(AttendanceStatus.determineStatus(attendance.getCheckIn()));
        getSession().save(attendance);
    }
    
    public void update(Attendance attendance) {
        attendance.setStatus(AttendanceStatus.determineStatus(attendance.getCheckIn()));
        getSession().update(attendance);
    }
    
    public Attendance getById(Long id) {
        Attendance attendance = getSession().get(Attendance.class, id);
        if (attendance != null) {
            attendance.setStatus(AttendanceStatus.determineStatus(attendance.getCheckIn()));
        }
        return attendance;
    }
    
    public List<Attendance> getByEmployee(Employee employee) {
        List<Attendance> attendances = getSession()
            .createQuery("from Attendance where employee = :employee", Attendance.class)
            .setParameter("employee", employee)
            .list();
        attendances.forEach(att -> att.setStatus(AttendanceStatus.determineStatus(att.getCheckIn())));
        return attendances;
    }
    
    public List<Attendance> getByDate(LocalDate date) {
        List<Attendance> attendances = getSession()
            .createQuery("from Attendance where date = :date", Attendance.class)
            .setParameter("date", date)
            .list();
        attendances.forEach(att -> att.setStatus(AttendanceStatus.determineStatus(att.getCheckIn())));
        return attendances;
    }
    
    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
}
