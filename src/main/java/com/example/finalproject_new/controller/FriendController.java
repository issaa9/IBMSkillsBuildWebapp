package com.example.finalproject_new.controller;

import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.Map;
import java.util.Optional;

@Controller
@SessionAttributes("userCredentials")
public class FriendController {
    @Autowired
    private UserRepository userRepo;

    @RequestMapping("/SF")
    public String showSearchForm() {
        return "searchFriend";
    }

    @PostMapping("/SF")
    public String search(@RequestParam String username, Model model, HttpServletRequest request) {
        if (request.getAttribute("user") != null) {
            User user = (User) request.getAttribute("user");
            Optional<User> friend = userRepo.findUserByUsername(username);

            if (friend.isPresent()) {
                user.addFriend(friend.get());
                friend.get().addFriend(user);
                userRepo.save(user);
                userRepo.save(friend.get());
                model.addAttribute("message", "This user has been found and added to your friend list! :)");
            } else {
                model.addAttribute("message", "This user does not have an account");
            }

            return "searchResult";
        } else {
            return "redirect:/login";
        }

    }
}