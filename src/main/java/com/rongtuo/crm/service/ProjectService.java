package com.rongtuo.crm.service;

import com.rongtuo.crm.domain.Project_list;
import com.github.pagehelper.Page;
import java.util.List;

/**
 * Created by admin on 2016/7/7.
 */
public interface ProjectService {
    public Integer insert(Project_list project_list);

    public Integer update(Project_list project_list);

    public List<Project_list> findAll();

    public List<Project_list>checkStatus(int checkStatus);

    public Page<Project_list>findPage(int pageNumber,int pageSize);

    public Page<Project_list>findPage(int pageNumber,int pageSize,int project_status);

    public Integer maxId();

    public List<Project_list>selectById(int id);

    public Integer updateCheck(Project_list project_list);

    public List<Project_list>query(int project_status);
}
