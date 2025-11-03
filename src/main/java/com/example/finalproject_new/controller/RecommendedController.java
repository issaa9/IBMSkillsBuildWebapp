package com.example.finalproject_new.controller;



import com.example.finalproject_new.model.CompletedCourse;
import com.example.finalproject_new.model.Course;
import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.CompletedCourseRepository;
import com.example.finalproject_new.repo.CourseRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Optional;

@Controller
public class RecommendedController {


    @Autowired
    private CourseRepository courseRepo;


    @Autowired
    private CompletedCourseRepository completedCourseRepo;

    @PostMapping("/courseAction/{courseid}/{action}")
    @ResponseBody
    public String courseAction(@PathVariable Long courseid, @PathVariable String action, Model model, HttpServletRequest request){
        if (request.getAttribute("user") != null) {
            long userId = ((User) request.getAttribute("user")).getId();
            Optional<CompletedCourse> optionalcourse = completedCourseRepo.findCourseByUserId(courseid, userId);
            if (optionalcourse.isPresent()) {
                CompletedCourse course = optionalcourse.get();
                course.setStatus(action);
                completedCourseRepo.save(course);
                return "percent:" + calculatePercent(userId);
            } else {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND);
            }
        }else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }

    }

    @GetMapping("/RC")
    public String getRecommendedCourses(Model model, HttpServletRequest request) {
        if (request.getAttribute("user") != null) {
            long userId = ((User) request.getAttribute("user")).getId();
            String percent = calculatePercent(userId);
            model.addAttribute("percentage", percent);
            model.addAttribute("availableCourses", findAvailableCourses(userId));
            model.addAttribute("recommendedCourses", findRecommendedCourses(userId));
            model.addAttribute("chosenCourses", findChosenCourses(userId));
            model.addAttribute("startedCourses", findStartedCourses(userId));
            model.addAttribute("completedCourses", findCompletedCourses(userId));
            return "dashboard";
        } else {
            return "redirect:/login";
        }
    }

    private String calculatePercent(Long userId) {
        double completed = findCompletedCourses(userId).size();
        double courses = 6;
        double percentComplete = (completed / courses) * 100;
        DecimalFormat d = new DecimalFormat("##.##");
        String percent = d.format(percentComplete);
        return percent;
    }


    private List<Course> findAvailableCourses(Long userId) {
        return completedCourseRepo.findAvailableCoursesByUserId(userId);

    }
    private List<Course> findRecommendedCourses(Long userId) {
        return completedCourseRepo.findRecommendedCoursesByUserId(userId);

    }
    private List<Course> findChosenCourses(Long userId) {
        return completedCourseRepo.findChosenCoursesByUserId(userId);

    }
    private List<CompletedCourse> findStartedCourses(Long userId) {
        return completedCourseRepo.findStartedCoursesByUserId(userId);

    }
    private List<CompletedCourse> findCompletedCourses(Long userId) {
        return completedCourseRepo.findCompletedCoursesByUserId(userId);

    }
}
