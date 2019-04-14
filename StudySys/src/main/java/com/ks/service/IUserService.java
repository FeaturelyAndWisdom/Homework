package com.ks.service;

import com.ks.po.User;

import java.util.List;

public interface IUserService {

    public boolean save(User user) throws Exception;

    public boolean modify(User user) throws Exception;

    public boolean remove(int uid) throws Exception;

    public boolean recover(int uid) throws Exception;

    public User findById(int uid) throws Exception;

    public List<User> findAllUsers() throws Exception;

    public User login(User user) throws Exception;

    public boolean checkName(User user) throws Exception;
}
