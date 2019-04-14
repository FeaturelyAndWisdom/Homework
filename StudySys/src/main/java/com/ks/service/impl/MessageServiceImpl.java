package com.ks.service.impl;

import com.ks.mapper.MessageMapper;
import com.ks.po.Message;
import com.ks.service.IMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("MessageServiceImpl")
public class MessageServiceImpl implements IMessageService {

    @Resource(name = "MessageMapper")
    private MessageMapper mm;

    @Override
    public boolean save(Message mes) throws Exception {
        int count = mm.add(mes);
        if(count>0) return true;
        return false;
    }

    @Override
    public boolean remove(int mid) throws Exception {
        int count = mm.delete(mid);
        if(count>0) return true;
        return false;
    }

    @Override
    public Message findByMid(int mid) throws Exception {
        return mm.findByMid(mid);
    }

    @Override
    public List<Message> getAll() throws Exception {
        return mm.findAll();
    }
}
