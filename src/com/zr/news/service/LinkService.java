package com.zr.news.service;

import com.zr.news.dao.LinkDao;
import com.zr.news.dao.daoImpl.LinkDaoImpl;
import com.zr.news.entity.Link;

import java.util.List;

/**
 * @Acthor:孙琪; date:2019/3/24;
 */
public class LinkService {

    private LinkDao dao = new LinkDaoImpl();

    public List<Link> findAll(){
        return  dao.findAll();
    }
}
