package com.rongtuo.crm.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.rongtuo.crm.domain.Holiday;
import com.rongtuo.crm.mapper.HolidayMapper;
import com.rongtuo.crm.service.HolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/7/28.
 */
@Service
public class HolidayServiceImpl implements HolidayService {

    @Autowired
    private HolidayMapper holidayMapper;

    public Integer insert(Holiday holiday) {
        return holidayMapper.insert(holiday);
    }

    public Integer maxId(){
        return  holidayMapper.maxId();
    }

    public List<Holiday> findAll() {
        return holidayMapper.findAll();
    }

    public Page<Holiday> findPage(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        System.out.println("HolidayServiceImpl---------findPage test");
        return (Page<Holiday>)holidayMapper.findAll();
    }

    public Integer delete(int id) {
        return holidayMapper.delete(id);
    }
}
