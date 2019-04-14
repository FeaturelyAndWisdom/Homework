package com.ks.service;

import com.ks.po.Gushi;

import java.util.List;

public interface IGushiService {

    public boolean save(Gushi gushi) throws Exception;

    public boolean remove(int gid) throws Exception;

    public Gushi findByGid(int gid) throws Exception;

    public List<Gushi> findAll() throws Exception;

}
