package com.rongtuo.crm.mapper;

import com.rongtuo.crm.domain.Key_Value;
import com.rongtuo.crm.domain.TreeNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by admin on 2016/7/28.
 */
@Repository
public interface Key_ValueMapper {
    public Integer insert(Key_Value key_value);

    public Integer delete(int id);

    public List<Key_Value> findAll();

    public List<Key_Value>selName();

    public Integer maxkeyOrder(Key_Value key_value);

    public List<Key_Value>treeChild(int id);

    public List<Number> selId();

    public Key_Value show(int id);
}
