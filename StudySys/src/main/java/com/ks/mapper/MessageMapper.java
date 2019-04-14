package com.ks.mapper;

import com.ks.po.Message;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("MessageMapper")
public interface MessageMapper {

    public int add(Message mes) throws Exception;

    public int delete(int mid) throws Exception;

    public Message findByMid(int mid) throws Exception;

    public List<Message> findAll() throws Exception;
}
