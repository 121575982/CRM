package com.rongtuo.crm.service;

import com.github.pagehelper.Page;
import com.rongtuo.crm.domain.Guarantess;

import java.util.List;

/**
 * Created by admin on 2016/7/8.
 */

public interface GuarantessService  {
    public Integer insert(Guarantess guarantess);

    public Integer update(Guarantess guarantess);

    public List<Guarantess> findAll();

    public List<Guarantess>selName();

    public List<Guarantess>find(Guarantess guarantess);

    public List<Guarantess>selGuarantess(Guarantess guarantess);

    public Page<Guarantess> findPage(int pageNumber, int pageSize);

    public Integer maxId();

    public List<Guarantess>selectById(int id);

}
