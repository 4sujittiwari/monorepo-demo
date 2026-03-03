package com.example.user.controller;

import com.example.common.BaseResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
public class UserController {
    @GetMapping("/hello")
    public BaseResponse<String> hello() {
        return BaseResponse.success("Hello from User Service!");
    }
}
