package com.rongtuo.crm.mapper;

import com.rongtuo.crm.domain.Holiday;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by admin on 2016/7/28.
 */
@Repository
public interface HolidayMapper {
    public Integer insert(Holiday holiday);

    public Integer maxId();

    public List<Holiday> findAll();

    public Integer delete(int id);
}
