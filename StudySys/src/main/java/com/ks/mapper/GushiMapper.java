package com.ks.mapper;

import com.ks.po.Gushi;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GushiMapper {

    public int add(Gushi gushi) throws Exception;

    public int delete(int gid) throws Exception;

    public Gushi findByGid(int gid) throws Exception;

    public List<Gushi> findAllGushi() throws Exception;
}
