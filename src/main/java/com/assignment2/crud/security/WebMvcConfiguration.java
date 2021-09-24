package com.assignment2.crud.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
@EnableWebSecurity
public class WebMvcConfiguration extends WebSecurityConfigurerAdapter {
    

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/api/**").hasRole("ADMIN")
                .antMatchers("/trainer/**").hasAnyRole("ADMIN", "USER")
            .and()
                .formLogin()
                .loginPage("/showLoginPage")
                .loginProcessingUrl("/authenticateTheUser")
                .permitAll()
            .and()
                .logout()
                .permitAll()
            .and()
                .exceptionHandling()
                .accessDeniedPage("/access-denied");

        http.csrf()
            .disable();
    }

    @Bean
    @Override
    public UserDetailsService userDetailsService() {
            UserDetails user =
                     User.withDefaultPasswordEncoder()
                            .username("user")
                            .password("user")
                            .roles("USER")
                            .build();
            UserDetails user2 =
                     User.withDefaultPasswordEncoder() 
                            .username("admin")
                            .password("admin")
                            .roles("ADMIN")
                            .build();

            return new InMemoryUserDetailsManager(user, user2);
    }
        
}
