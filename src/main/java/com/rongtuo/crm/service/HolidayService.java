package com.rongtuo.crm.service;

import com.github.pagehelper.Page;
import com.rongtuo.crm.domain.Holiday;

import java.util.List;

/**
 * Created by admin on 2016/7/28.
 */
public interface HolidayService {
    public Integer insert(Holiday holiday);

    public Integer maxId();

    public List<Holiday>findAll();

    public Page<Holiday> findPage(int pageNumber,int pageSize);

    public Integer delete(int id);
}
