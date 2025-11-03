package com.example.finalproject_new.controller;

import com.example.finalproject_new.model.CompletedCourse;
import com.example.finalproject_new.model.Course;
import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.CompletedCourseRepository;
import com.example.finalproject_new.repo.CourseRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CourseRatingController {

    @Autowired
    private CourseRepository courseRepo;

    @Autowired
    private CompletedCourseRepository completedCourseRepo;


    @GetMapping("/courseRating")
    public String showRatings(Model model, HttpServletRequest request) {
        if (request.getAttribute("user") != null) {
            User user = (User) request.getAttribute("user");

            model.addAttribute("aC", courseRepo.getCourses());
            model.addAttribute("completedCourses", findCompletedCourses(user.getId()));
            return "ratings";
        } else {
            return "redirect:/login";
        }
    }

    private List<CompletedCourse> findCompletedCourses(Long userId) {
        return completedCourseRepo.findCompletedCoursesByUserId(userId);

    }

    private List<Course> findAvailableCourses(Long userId) {
        return completedCourseRepo.findAvailableCoursesByUserId(userId);

    }

}
