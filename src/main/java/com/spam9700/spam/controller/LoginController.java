package com.spam9700.spam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    // @GetMapping("/i_login")
    // public String login() {
    //     return "i_login";
    // }

    @GetMapping("/signup")
    public String signupForm() {
        return "signup";
    }
}
