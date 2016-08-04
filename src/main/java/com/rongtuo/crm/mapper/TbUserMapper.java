package com.rongtuo.crm.mapper;

import com.rongtuo.crm.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 保兴 on 2016/3/3.
 */
@Repository
public interface TbUserMapper {
    public List<User> findAll();

}
