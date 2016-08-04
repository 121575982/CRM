package com.rongtuo.crm.mapper;

import com.rongtuo.crm.domain.Project_list;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by admin on 2016/7/7.
 */
@Repository
public interface ProjectMapper {
    public Integer insert(Project_list project_list);

    public Integer update(Project_list project_list);

    public List<Project_list> findAll();

    public List<Project_list>checkStatus(int checkStatus);

    public Integer maxId();

    public List<Project_list> selectById(int id);

    public int updateCheck(Project_list project_list);

    public List<Project_list> query(int project_status);
}
