package com.example.finalproject_new.service;

import com.example.finalproject_new.model.Badge;
import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.server.ResponseStatusException;


@Service
public class BadgeService {

    @Autowired
    private UserRepository userRepository;


    public void awardBadgeForChoosingCourse(User user) {
        boolean badgeAlreadyAwarded = user.getBadges().stream()
                .anyMatch(b -> b.getName().equals("Course Selector"));

        if (!badgeAlreadyAwarded) {
            Badge badge = new Badge();
            badge.setName("Course Selector");
            badge.setDescription("Awarded for choosing your first course");
            badge.setImageUrl("/src/main/images/1stCourse.jpg");
            user.getBadges().add(badge);
            userRepository.save(user);
        }
    }

    @PostMapping("/awardBadge/chooseCourse/{courseId}")
    public String awardBadgeForChoosingCourse(@PathVariable Long courseId, HttpServletRequest request) {
        if (request.getAttribute("user") != null) {
            User user = (User) request.getAttribute("user");
            awardBadgeForChoosingCourse(user);
            return "Success";
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}

