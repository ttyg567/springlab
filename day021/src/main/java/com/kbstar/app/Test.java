package com.kbstar.app;

import com.kbstar.dto.UserDTO;
import com.kbstar.frame.MyService;
import com.kbstar.service.BankingService;

public class Test {
    public static void main(String args[]){
        MyService<String, UserDTO> service = new BankingService();
        UserDTO user = new UserDTO("id01", "pw01", "james");
        service.register(user);
    }

}
