package com.example.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.AttendanceDAO;
import com.example.model.Attendance;
import com.example.model.AttendanceStatus;
import com.example.model.Employee;

@Service
@Transactional
public class AttendanceService {

    @Autowired
    private AttendanceDAO attendanceDAO;

    public void checkIn(Employee employee) {
        Attendance attendance = new Attendance();
        attendance.setEmployee(employee);
        attendance.setDate(LocalDate.now());
        attendance.setCheckIn(LocalTime.now());
        attendance.setStatus(AttendanceStatus.PRESENT);
        attendanceDAO.save(attendance);
    }

    public void checkOut(Long attendanceId) {
        Attendance attendance = attendanceDAO.getById(attendanceId);
        if (attendance != null) {
            attendance.setCheckOut(LocalTime.now());
            attendanceDAO.update(attendance);
        }
    }

    public List<Attendance> getByEmployee(Employee employee) {
        return attendanceDAO.getByEmployee(employee);
    }

    public List<Attendance> getByDate(LocalDate date) {
        return attendanceDAO.getByDate(date);
    }

    public Attendance getById(Long id) {
        return attendanceDAO.getById(id);
    }
    public AttendanceStatus parseStatus(String inputStatus) {
        if (inputStatus.equalsIgnoreCase("CÓ MẶT")) {
            inputStatus = "PRESENT";
        }
        return AttendanceStatus.valueOf(inputStatus);
    }
} 