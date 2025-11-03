package com.example.finalproject_new.config;

import com.example.finalproject_new.interceptor.AuthInterceptor;
import com.example.finalproject_new.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;

@Configuration
public class AuthInterceptorConfig implements WebMvcConfigurer {
    @Autowired
    UserRepository userRepo;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthInterceptor(userRepo));
    }

}
