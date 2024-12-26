package com.example.model;

public enum AttendanceStatus {
    PRESENT,
    ABSENT,
    LATE;

    public static AttendanceStatus fromString(String inputStatus) {
        switch (inputStatus.toUpperCase()) {
            case "CÓ MẶT":
                return PRESENT;
            case "VẮNG MẶT":
                return ABSENT;
            case "ĐẾN MUỘN":
                return LATE;
            default:
                throw new IllegalArgumentException("Invalid status: " + inputStatus);
        }
    }
}

