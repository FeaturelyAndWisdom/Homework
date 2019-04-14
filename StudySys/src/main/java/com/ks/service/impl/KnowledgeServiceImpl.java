package com.ks.service.impl;

import com.ks.mapper.KnowledgeMapper;
import com.ks.po.Knowledge;
import com.ks.service.IKnowledgeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("KnowledgeServiceImpl")
public class KnowledgeServiceImpl implements IKnowledgeService {

    @Resource(name="KnowledgeMapper")
    private KnowledgeMapper km;

    @Override
    public List<Knowledge> findAllHz() throws Exception {
        return km.hzfindAll();
    }

    @Override
    public boolean save(Knowledge know) throws Exception {
        int count = km.add(know);
        if(count>0) return true;
        return false;
    }

    @Override
    public List<Knowledge> findAllCy() throws Exception {
        List<Knowledge> klst = km.cyfindAll();
        for(Knowledge k:klst){
            k.setPys(k.getPinyin().split("\\s+"));
        }
        return klst;
    }

    @Override
    public boolean remove(int kid) throws Exception {
        int count = km.delete(kid);
        if(count>0) return true;
        return false;
    }
}
