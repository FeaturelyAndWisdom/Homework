package com.ks.service.impl;

import com.ks.mapper.GushiMapper;
import com.ks.po.Gushi;
import com.ks.service.IGushiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("GushiServiceImpl")
public class GushiServiceImpl implements IGushiService {

    @Autowired
    private GushiMapper gushiMapper;

    @Override
    public boolean save(Gushi gushi) throws Exception {
        int count = gushiMapper.add(gushi);
        if(count>0) return true;
        return false;
    }

    @Override
    public boolean remove(int gid) throws Exception {
        int count = gushiMapper.delete(gid);
        if(count>0) return true;
        return false;
    }

    @Override
    public Gushi findByGid(int gid) throws Exception {
        Gushi gs = gushiMapper.findByGid(gid);
        String[] gspy = gs.getPinyin().split("\\r\\n");
        List<String[]> pys = new ArrayList<>();
        for(int i=0;i<gspy.length;i++){
            pys.add(gspy[i].split("//s+"));
        }
        gs.setPys(pys);
        gs.setWlines(gs.getWord().split("\\r\\n"));
        return gs;
    }

    @Override
    public List<Gushi> findAll() throws Exception {
        return gushiMapper.findAllGushi();
    }
}
