package com.rongtuo.crm.service;

import com.github.pagehelper.Page;
import com.rongtuo.crm.domain.Key_Value;

import java.util.List;

/**
 * Created by admin on 2016/7/28.
 */
public interface Key_ValueService {
    public Integer insert(Key_Value key_value);

    public List<Key_Value> findAll();

    public Page<Key_Value> findPage(int pageNumber, int pageSize);

    public Integer delete(int id);

    public List<Key_Value>selName();

    public Integer maxkeyOrder(Key_Value key_value);

    public List<Key_Value> treeChild(int id);

    public List<Number> selId();

    public Key_Value show(int id);

}
