package com.ks.mapper;

import com.ks.po.User;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("UserMapper")
public interface UserMapper {

    public int add(User user) throws Exception;

    public int update(User user) throws Exception;

    public int delete(int uid) throws Exception;

    public int recover(int uid) throws Exception;

    public User findById(int uid) throws Exception;

    public List<User> findAll() throws Exception;

    public User login(User user) throws Exception;

    public int checkName(User user) throws Exception;

}
