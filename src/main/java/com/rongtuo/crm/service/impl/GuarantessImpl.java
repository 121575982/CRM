package com.rongtuo.crm.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.rongtuo.crm.mapper.GuarantessMapper;
import com.rongtuo.crm.domain.Guarantess;
import com.rongtuo.crm.service.GuarantessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by admin on 2016/7/8.
 */
@Service
@Transactional(readOnly = true)
public class GuarantessImpl implements GuarantessService{
    @Autowired
    private GuarantessMapper guarantessMapper;

    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public Integer insert(Guarantess guarantess){
        Integer maxId = guarantessMapper.maxId();
        System.out.println("getMaxId  = "+ maxId);
        if( maxId == null ) {
            maxId=1;
        }else {
            maxId += 1;
        }
        guarantess.setId(maxId);
        System.out.println("setMaxId = "+ maxId);
        return guarantessMapper.insert(guarantess);
    }

    public Integer update(Guarantess guarantess) {
        return guarantessMapper.update(guarantess);
    }

    public List<Guarantess> findAll() {
        return guarantessMapper.findAll();
    }

    public List<Guarantess> selName() {
        return guarantessMapper.selName();
    }

    public List<Guarantess> find(Guarantess guarantess) {
        return guarantessMapper.find(guarantess);
    }

    public List<Guarantess> selGuarantess(Guarantess guarantess) {
        return guarantessMapper.selGuarantess(guarantess);
    }

    public Page<Guarantess> findPage(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        return (Page<Guarantess>)guarantessMapper.findAll();
    }

    public Integer maxId() {
        return guarantessMapper.maxId();
    }

    public List<Guarantess> selectById(int id) {
        return guarantessMapper.selectById(id);
    }
}
