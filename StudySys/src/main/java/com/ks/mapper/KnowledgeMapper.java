package com.ks.mapper;

import com.ks.po.Knowledge;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("KnowledgeMapper")
public interface KnowledgeMapper {

    public int add(Knowledge know) throws Exception;

    public List<Knowledge> hzfindAll() throws Exception;

    public List<Knowledge> cyfindAll() throws Exception;

    public int delete(int kid) throws Exception;

}
