package com.example.service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Service;

@Service
public class AopLogService {
    private final List<String> logs = new CopyOnWriteArrayList<>();
    
    public void addLog(String log) {
        logs.add(log);
        if (logs.size() > 100) { // Giữ tối đa 100 logs gần nhất
            logs.remove(0);
        }
    }
    
    public List<String> getLogs() {
        return new ArrayList<>(logs);
    }
    
    public void clearLogs() {
        logs.clear();
    }
} 