package com.rongtuo.crm.controller;

import com.github.pagehelper.Page;
import com.rongtuo.crm.domain.Holiday;
import com.rongtuo.crm.mapper.HolidayMapper;
import com.rongtuo.crm.service.HolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by admin on 2016/7/28.
 */
@Controller
@RequestMapping(value = "holiday")
public class HolidayController {

    @Autowired
    private HolidayMapper holidayMapper;
    @Autowired
    private HolidayService holidayService;

    @RequestMapping(value = "/add")
    public String add(ModelMap map){
        return "holiday/add";
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> insert(Holiday holiday){
        int result = 0;
        result = holidayMapper.insert(holiday);
        System.out.println("result = "+ result);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result",result);
        if(result > 0){
            map.put("message","保存成功!");
        }else{
            map.put("message","保存失败!");
        }
        return map;
    }

    @RequestMapping(value = "/list")
    public String list(){
        return "holiday/list";
    }

    @RequestMapping(value = "/query")
    @ResponseBody
   public Map<String, Object> query(int pageNumber, int pageSize){
       Map<String,Object> map = new HashMap<String, Object>();
       Page<Holiday> page = holidayService.findPage(pageNumber,pageSize);
       map.put("rows",page);
       map.put("total",page.getTotal());
       return map;
   }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public ModelAndView delete(int id){
        ModelAndView model = new ModelAndView();
        int result = 0;
        result = holidayService.delete(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result",result);
        if(result > 0){
            map.put("message","删除成功!");
        }else{
            map.put("message","删除失败!");
        }
        model.addObject("map",map);
        model.setViewName("holiday/list");
        return model;
    }
}
