package com.ks.service.impl;

import com.ks.mapper.UserMapper;
import com.ks.po.User;
import com.ks.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("UserServiceImpl")
public class UserServiceImpl implements IUserService {

    @Resource(name = "UserMapper")
    private UserMapper um;

    @Override
    public boolean save(User user) throws Exception {
        int count = um.add(user);
        if(count>0) return true;
        return false;
    }

    @Override
    public boolean modify(User user) throws Exception {
        int count = um.update(user);
        if(count>0) return true;
        return false;
    }

    @Override
    public boolean remove(int uid) throws Exception {
        int count = um.delete(uid);
        if(count>0) return true;
        return false;
    }

    @Override
    public boolean recover(int uid) throws Exception {
        int count = um.recover(uid);
        if(count>0) return true;
        return false;
    }

    @Override
    public User findById(int uid) throws Exception {
        return um.findById(uid);
    }

    @Override
    public List<User> findAllUsers() throws Exception {
        return um.findAll();
    }

    @Override
    public User login(User user) throws Exception {
        return um.login(user);
    }

    @Override
    public boolean checkName(User user) throws Exception {
        int count = um.checkName(user);
        if(count>0) return false;
        return true;
    }
}
