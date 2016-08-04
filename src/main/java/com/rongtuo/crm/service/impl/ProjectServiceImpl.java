package com.rongtuo.crm.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.rongtuo.crm.domain.Project_list;
import com.rongtuo.crm.mapper.ProjectMapper;
import com.rongtuo.crm.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/7/7.
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;


    public Integer insert(Project_list project_list) {
        Integer maxId = projectMapper.maxId();
        System.out.println("getMaxId  = "+ maxId);
        if( maxId == null ) {
            maxId=1;
        }else {
            maxId += 1;

        }
        project_list.setId(maxId);
        project_list.setProject_status(0);
        System.out.println("setMaxId = "+ maxId);
        return projectMapper.insert(project_list);
    }

    public Integer update(Project_list project_list) {
        return projectMapper.update(project_list);
    }

    public List<Project_list> findAll(){
        return projectMapper.findAll();
    }

    public List<Project_list> checkStatus(int checkStatus) {
        return projectMapper.checkStatus(checkStatus);
    }

    public Page<Project_list> findPage(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        return (Page<Project_list>)projectMapper.findAll();
    }

    public Page<Project_list> findPage(int pageNumber, int pageSize,int project_status) {
        PageHelper.startPage(pageNumber,pageSize);
        return (Page<Project_list>)projectMapper.query(project_status);
    }

    public Integer maxId() {
        return projectMapper.maxId();
    }

    public List<Project_list> selectById(int id) {
        return projectMapper.selectById(id);
    }

    public Integer updateCheck(Project_list project_list) {
        return projectMapper.updateCheck(project_list);
    }

    public List<Project_list> query(int project_status) {
        return projectMapper.query(project_status);
    }
}
