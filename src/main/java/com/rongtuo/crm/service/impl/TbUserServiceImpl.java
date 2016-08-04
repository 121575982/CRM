package com.rongtuo.crm.service.impl;

import com.rongtuo.crm.domain.User;
import com.rongtuo.crm.mapper.TbUserMapper;
import com.rongtuo.crm.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by admin on 2016/7/9.
 */
@Service
public class TbUserServiceImpl implements TbUserService {

    @Autowired
    private TbUserMapper tbUserMapper;

    public List<User> findAll() {
        return tbUserMapper.findAll();
    }
}
