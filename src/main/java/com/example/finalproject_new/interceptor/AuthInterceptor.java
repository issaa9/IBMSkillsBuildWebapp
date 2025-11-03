package com.example.finalproject_new.interceptor;

import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor {

    private final UserRepository userRepo;

    public AuthInterceptor(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String pageURL = request.getRequestURI();
        Object sessionUserId = request.getSession().getAttribute("userId");
        boolean loggedIn = false;
        User user = null;
        try {
            if (sessionUserId != null) {
                Long userId = Long.parseLong(sessionUserId.toString());
                if (userRepo.findUserByUserId(userId).isPresent()) {
                    user = userRepo.findUserByUserId(userId).get();
                    loggedIn = true;
                    request.setAttribute("user", user);
                }
            }
        } catch (NumberFormatException ignored) {

        }

        request.setAttribute("loggedin", loggedIn);
        if (!pageURL.startsWith("/login") && !pageURL.startsWith("/register")) {
            if (!loggedIn) {
                response.sendRedirect("/login");
                return false;
            }
        }
        if (pageURL.startsWith("/admin")) {
            if (!loggedIn || !user.getAdmin()) {
                response.sendRedirect("/login");
                return false;
            }
        }
        return true;
    }

}
