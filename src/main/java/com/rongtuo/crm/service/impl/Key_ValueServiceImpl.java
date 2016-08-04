package com.rongtuo.crm.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.rongtuo.crm.domain.Key_Value;
import com.rongtuo.crm.mapper.Key_ValueMapper;
import com.rongtuo.crm.service.Key_ValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/7/28.
 */
@Service
public class Key_ValueServiceImpl  implements Key_ValueService{

    @Autowired
    private Key_ValueMapper key_ValueMapper;


    public Integer insert(Key_Value key_value) {
        return key_ValueMapper.insert(key_value);
    }

    public List<Key_Value> findAll() {
        return key_ValueMapper.findAll();
    }

    public Page<Key_Value> findPage(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);

        return (Page<Key_Value>)key_ValueMapper.findAll();
    }

    public Integer delete(int id) {
        return key_ValueMapper.delete(id);
    }

    public List<Key_Value> selName() {
        return key_ValueMapper.selName();
    }

    public Integer maxkeyOrder(Key_Value key_value) {
        return key_ValueMapper.maxkeyOrder(key_value);
    }

    public List<Key_Value> treeChild(int id) {
        return key_ValueMapper.treeChild(id);
    }

    public List<Number> selId() {
        return key_ValueMapper.selId();
    }

    public Key_Value show(int id) {
        return key_ValueMapper.show(id);
    }


}
