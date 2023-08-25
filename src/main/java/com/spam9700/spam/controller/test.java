package com.spam9700.spam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {
    @GetMapping("/test")
    public String teste(){
        return "choose";
    }

    @GetMapping("/test2")
    public String test2(){
        return "list";
    }

    @GetMapping("/test3")
    public String test3(){
        return "Detail";
    }

    @GetMapping("/test4")
    public String test4(){
        return "table";
    }
}

   