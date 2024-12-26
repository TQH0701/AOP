package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/HomeContro") // URL gốc: http://localhost:8080/
    public String home() {
        return "Home/HomeIndex"; // Tên file JSP: homepage.jsp
    }
}
