package com.example.finalproject_new.controller;

import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/")
    public String start(Model model, HttpServletRequest request) {
        if (request.getAttribute("user") != null) {
            User user = (User) request.getAttribute("user");
            model.addAttribute("streakData", user.getStreak());
            model.addAttribute("badges", user.getBadges());
            return "start";
        } else {
            return "redirect:/login";
        }
    }



}