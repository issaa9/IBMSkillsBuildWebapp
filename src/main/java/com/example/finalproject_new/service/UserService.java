package com.example.finalproject_new.service;


import com.example.finalproject_new.model.User;
import com.example.finalproject_new.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void login(Long userId) {

        Optional<User> userOptional = userRepository.findUserByUserId(userId);
        User user = userOptional.orElseThrow(() -> new RuntimeException("User not found. User needs to be logged in."));

        Date now = new Date();
        if (user.getLastLoginDate() != null) {
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.setTime(user.getLastLoginDate());
            cal2.setTime(now);
            if (cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) &&
                    cal1.get(Calendar.DAY_OF_YEAR) + 1 == cal2.get(Calendar.DAY_OF_YEAR)) {
                user.setStreak(user.getStreak() + 1);
            } else {
                user.setStreak(1); // Reset streak if not consecutive
            }
        } else {
            user.setStreak(1);
        }

        user.setLastLoginDate(now);
        userRepository.save(user);
    }
}
