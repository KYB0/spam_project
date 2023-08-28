package com.spam9700.spam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class paymentController {
     @GetMapping("/test")
    public String test(){
        return "payment";
    }
 
    @GetMapping("/return")
    public String hi(){
        return "return";
    }

    
    @GetMapping("/bot")
    public String chat(){
        return "bot";
    }
}
