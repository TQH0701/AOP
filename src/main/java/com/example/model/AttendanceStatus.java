package com.example.model;

import java.time.LocalTime;

public enum AttendanceStatus {
    PRESENT,
    ABSENT,
    LATE;

    private static final LocalTime ON_TIME_LIMIT = LocalTime.of(9, 0); // 9 AM
    private static final LocalTime LATE_LIMIT = LocalTime.of(12, 0); // 12 PM (Muộn nhưng chưa đến 12h)

    public static AttendanceStatus determineStatus(LocalTime checkInTime) {
        System.out.println("Determining status for Check-in Time: " + checkInTime); // Debug log

        if (checkInTime == null) {
            return ABSENT; // Không điểm danh
        } else if (checkInTime.isBefore(ON_TIME_LIMIT) || checkInTime.equals(ON_TIME_LIMIT)) {
            return PRESENT; // Điểm danh trước hoặc đúng 9 AM
        } else if (checkInTime.isBefore(LATE_LIMIT)) {
            return LATE; // Điểm danh sau 9 AM và trước 12 PM
        } else {
            return ABSENT; // Nếu sau 12 PM thì vắng (không điểm danh)
        }
    }
}
