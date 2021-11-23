package com.web.springmvc;

import org.springframework.stereotype.Service;

@Service
public class LoginService {
    public boolean isUserValid(String user, String password) {
        return "user".equalsIgnoreCase(user) && "psw".equals(password);
    }
}
