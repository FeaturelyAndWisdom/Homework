package com.ks.service;

import com.ks.po.Knowledge;

import java.util.List;

public interface IKnowledgeService {

    public List<Knowledge> findAllHz() throws Exception;

    public boolean save(Knowledge know) throws Exception;

    public List<Knowledge> findAllCy() throws Exception;

    public boolean remove(int kid) throws Exception;
}
