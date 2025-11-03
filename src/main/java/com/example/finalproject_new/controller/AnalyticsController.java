package com.example.finalproject_new.controller;


import com.example.finalproject_new.repo.CompletedCourseRepository;
import com.example.finalproject_new.repo.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AnalyticsController {
    @Autowired
    private CourseRepository courseRepo;

    @Autowired
    private CompletedCourseRepository completedCourseRepo;



    @GetMapping("/admin/analytics")
    public String displayAnalytics(Model model) {
        List<List> courseStats = courseRepo.getCourseStats();

        model.addAttribute("courseStats", courseStats);
        return "analytics";
    }


}
