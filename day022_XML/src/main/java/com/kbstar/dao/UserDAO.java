package com.kbstar.dao;

import com.kbstar.dto.UserDTO;
import com.kbstar.frame.MyDao;

import java.util.ArrayList;
import java.util.List;

public class UserDAO implements MyDao<String, UserDTO> {

    @Override
    public void insert(UserDTO userDTO) {
        System.out.println("Inserted Oracle:"+ userDTO);
    }

    @Override
    public void delete(String s) {
        System.out.println("Deleted Oracle:"+ s);
    }

    @Override
    public void update(UserDTO userDTO) {
        System.out.println("Updated Oracle:"+ userDTO);
    }

    @Override
    public UserDTO select(String s) {
        UserDTO user = null;
        user = new UserDTO(s, "pwd01", "이말숙");
        return null;
    }

    @Override
    public List<UserDTO> select() {
        List<UserDTO> list =  new ArrayList<>();
        list.add(new UserDTO("id01", "pwd01", "이말숙"));
        list.add(new UserDTO("id02", "pwd02", "김말숙"));
        list.add(new UserDTO("id03", "pwd03", "박말숙"));
        return null;
    }
}
