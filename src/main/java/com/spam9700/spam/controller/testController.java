package com.spam9700.spam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testController {
/*
    @GetMapping("/test")
    public String test(){
        return "test";
    }
 */
    @GetMapping("/main")
    public String main(){
        return "main";
    }
}