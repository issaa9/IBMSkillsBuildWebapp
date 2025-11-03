package com.example.finalproject_new.controller;

import com.example.finalproject_new.model.CompletedCourse;
import com.example.finalproject_new.model.Course;
import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.CompletedCourseRepository;
import com.example.finalproject_new.repo.CourseRepository;
import com.example.finalproject_new.repo.UserRepository;
import com.example.finalproject_new.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@SessionAttributes("userCredentials")
public class AuthController {
    @Autowired
    private UserRepository userRepo;
    @Autowired
    private UserService userService;
    @Autowired
    private CourseRepository courseRepo;
    @Autowired
    private CompletedCourseRepository completedCourseRepo;


    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("userId", "");
        return "redirect:/login";
    }
    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model, HttpServletRequest request) {
        email = email.toLowerCase();
        if (isValidCredentials(email, password)) {
            User u = userRepo.findUserByEmail(email).get();
            HttpSession session = request.getSession();
            session.setAttribute("userId", u.getId());
            userService.login(u.getId());
            return "redirect:/";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegistrationForm() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String email, @RequestParam String password, @RequestParam String username, Model model) {
        email = email.toLowerCase();
        if (emailExists(email)) {
            model.addAttribute("error", "email already exists");
            return "register";
        } else if (!isValidEmail(email)) {
            model.addAttribute("error", "email is not valid");
            return "register";
        } else if (!isValidPassword(password)) {
            model.addAttribute("error", "Password must have at least 6 characters and include a special character or number");
            return "register";
        } else if (!isValidUsername(username)) {
            model.addAttribute("error", "Username is not valid");
            return "register";
        } else {
            // Add the new user to the dictionary
            String hashedPassword = hashPassword(password);
            User u = new User();
            u.setAdmin(false);
            u.setEmail(email);
            u.setUsername(username);
            u.setHashedPassword(hashedPassword);
            userRepo.save(u);
            for (long i = 1L; i <= 6L; i++) {
                Optional<Course> course = courseRepo.getCourseByCourseId(i);
                if (course.isPresent()) {
                    CompletedCourse cc = new CompletedCourse();
                    cc.setUser(u);
                    cc.setCourse(course.get());
                    if (i <= 3) {
                        cc.setStatus("recommended");
                    } else {
                        cc.setStatus("available");
                    }
                    cc = completedCourseRepo.save(cc);
                }
            }

            return "redirect:/login";
        }
    }
    private Boolean isValidUsername(String username) {
        return true;
    }
    public static String hashPassword(String password) {
        String salt = BCrypt.gensalt();
        return BCrypt.hashpw(password, salt);
    }

    private boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password,hashedPassword);
    }
    private boolean isValidCredentials(String email, String password) {
        Optional<User> user = userRepo.findUserByEmail(email);
        if (user.isPresent()) {
            User u = user.get();
            return checkPassword(password, u.getHashedPassword());
        } else {
            return false;
        }
    }

    private boolean emailExists(String email) {
        return userRepo.findUserByEmail(email).isPresent();
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[\\w.-]+@[\\w.-]+\\.[a-z]{2,}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    private boolean isValidPassword(String password) {
        // Password must have at least 6 characters and include a special character or number
        return password.length() >= 6 && (password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?0-9]+.*") || password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]+.*"));
    }


}
