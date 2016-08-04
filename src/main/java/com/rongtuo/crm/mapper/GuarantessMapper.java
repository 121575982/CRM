package com.rongtuo.crm.mapper;

import com.fasterxml.jackson.core.TreeNode;
import com.rongtuo.crm.domain.Guarantess;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by admin on 2016/7/8.
 */
@Repository
public interface GuarantessMapper {
    public Integer insert(Guarantess guarantess);

    public Integer update(Guarantess guarantess);

    public List<Guarantess> findAll();

    public List<Guarantess>selName();

    public List<Guarantess>find(Guarantess guarantess);

    public List<Guarantess>selGuarantess(Guarantess guarantess);

    public Integer maxId();

    public List<Guarantess>selectById(int id);

}
