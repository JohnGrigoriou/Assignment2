package com.assignment2.crud;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/showLoginPage").setViewName("login");
        registry.addViewController("/access-denied").setViewName("access-denied"); 
        registry.addViewController("/trainer/").setViewName("list-trainers");
        registry.addViewController("/api/");
        
    }

}
