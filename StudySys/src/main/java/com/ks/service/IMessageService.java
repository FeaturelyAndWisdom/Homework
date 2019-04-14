package com.ks.service;

import com.ks.po.Message;

import java.util.List;

public interface IMessageService {

    public boolean save(Message mes) throws Exception;

    public boolean remove(int mid) throws Exception;

    public Message findByMid(int mid) throws Exception;

    public List<Message> getAll() throws Exception;
}
