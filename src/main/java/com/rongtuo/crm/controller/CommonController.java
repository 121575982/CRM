package com.rongtuo.crm.controller;

import com.github.pagehelper.Page;
import com.rongtuo.crm.domain.Guarantess;
import com.rongtuo.crm.service.GuarantessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by WangChangJie on 2016/7/8.
 */
@Controller
@RequestMapping(value = "/common")
public class CommonController {
    @Autowired
    private GuarantessService guarantessService;
    //担保人跳转
    @RequestMapping(value = "/new")
    public String  guarantess(ModelMap map){
        return "guarantess/add";
    }
       //担保人查询跳转
    @RequestMapping(value = "/sel")
    public String  sel(ModelMap map){
        return "guarantess/sel";
    }

    //担保人新增
    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> guarantessSava(Guarantess guarantess){
        System.out.println("guarantess :"+ guarantess.getDescription());
        int result = 0;
        result=guarantessService.insert(guarantess);
        System.out.println("result = "+ result);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result",result);
        if(result > 0){
            map.put("message","保存成功！");
        }else{
            map.put("message","保存失败！");
        }
        return map;
    }
    /**
     * 担保人列表
     */
    @RequestMapping(value = "/guarantessList")
    public ModelAndView guarantessList(){
        System.out.println("++++++++++++++++++++++guarantessList++++++++++++++++++");
        ModelAndView model = new ModelAndView();
        List guarantessList = null;
        guarantessList = guarantessService.findAll();
        System.out.println("guarantessList.size = " + guarantessList.size());
        model.addObject("guarantessList",guarantessList);
        model.setViewName("guarantess/list");
        return model;
    }
    /**
     * 担保人列表
     */
    @RequestMapping("query")
    @ResponseBody
    public Map<String,Object> query(int pageNumber, int pageSize){

        System.out.println("-----------------调用common.query方法------------------");
        System.out.println("pageNumber = "+ pageNumber + "pageSize = " + pageSize);
        Page<Guarantess>page = guarantessService.findPage(pageNumber,pageSize);
        System.out.println("-----page.size()----- = " + page.size());
        Map<String, Object> map= new HashMap<String, Object>();
        map.put("rows",page);
        map.put("total",page.getTotal());
        return map;
    }
    /**
     * 担保人查询2.0
     */
    @RequestMapping(value = "/selGuarantess")
    @ResponseBody
    public Map<String,Object> selGuarantess(Guarantess guarantess){
        System.out.println("***************************调用find方法2.0*****************************");
        System.out.println(guarantess.getClient_no());
        List <Guarantess> selGuarantess  = guarantessService.selGuarantess(guarantess);
        Map<String,Object> map=new HashMap<String, Object>();
        if(selGuarantess!=null&&selGuarantess.size()>0){
            System.out.println(selGuarantess.size());
            Guarantess guarantess1=selGuarantess.get(0);
            map.put("guarantess",guarantess1);
            Integer client_no = guarantess1.getClient_no();
            map.put("client_no",client_no);
            String client_name = guarantess1.getClient_name();
            map.put("client_name",client_name);
            Double quota = guarantess1.getQuota();
            map.put("quota",quota);
            String loan_no = guarantess1.getLoan_no();
            map.put("loan_no",loan_no);
            String loan_name = guarantess1.getLoan_name();
            map.put("loan_name",loan_name);
            String loan_ratify_no = guarantess1.getLoan_ratify_no();
            map.put("loan_ratify_no",loan_ratify_no);
            String loan_ratify_name = guarantess1.getLoan_ratify_name();
            map.put("loan_ratify_name",loan_ratify_name);
            String contacts = guarantess1.getContacts();
            map.put("contacts",contacts);
            String contacts_add = guarantess1.getContacts_add();
            map.put("contacts_add",contacts_add);
            String contacts_email = guarantess1.getContacts_email();
            map.put("contacts_email",contacts_email);
            String contacts_phone = guarantess1.getContacts_phone();
            map.put("contacts_phone",contacts_phone);
            String legal = guarantess1.getLegal();
            map.put("legal",legal);
            String legal_add = guarantess1.getLegal_add();
            map.put("legal_add",legal_add);
            String legal_email = guarantess1.getLegal_email();
            map.put("legal_email",legal_email);
            String legal_phone = guarantess1.getLegal_phone();
            map.put("legal_phone",legal_phone);
            String description = guarantess1.getDescription();
            map.put("description",description);
        }
        return map;
    }

    @RequestMapping(value = "/edit")
    @ResponseBody
    public ModelAndView editShow(int id){
        ModelAndView model = new ModelAndView();
        model.addObject("id",id);
        model.setViewName("guarantess/edit");
        return model;
    }

    @RequestMapping(value = "/editData")
    @ResponseBody
    public Map<String,Object> showData(int id){
        Map<String,Object> map = new HashMap<String, Object>();
        System.out.println("id = " + id);
        List<Guarantess> list = guarantessService.selectById(id);
        if(list !=null && list.size()>0){
            Guarantess guarantess = list.get(0);
            Integer client_no = guarantess.getClient_no();
            System.out.println("000000000000000000000 = " + client_no);
            map.put("client_no",client_no);
            String client_name = guarantess.getClient_name();
            map.put("client_name",client_name);
            Double quota = guarantess.getQuota();
            map.put("quota",quota);
            String loan_no = guarantess.getLoan_no();
            map.put("loan_no",loan_no);
            String loan_name = guarantess.getLoan_name();
            map.put("loan_name",loan_name);
            String loan_ratify_no = guarantess.getLoan_ratify_no();
            map.put("loan_ratify_no",loan_ratify_no);
            String loan_ratify_name = guarantess.getLoan_ratify_name();
            map.put("loan_ratify_name",loan_ratify_name);
            String contacts = guarantess.getContacts();
            map.put("contacts",contacts);
            String contacts_add = guarantess.getContacts_add();
            map.put("contacts_add",contacts_add);
            String contacts_phone = guarantess.getContacts_phone();
            map.put("contacts_phone",contacts_phone);
            String contacts_email = guarantess.getContacts_email();
            map.put("contacts_email",contacts_email);
            String legal = guarantess.getLegal();
            map.put("legal",legal);
            String legal_add = guarantess.getLegal_add();
            map.put("legal_add",legal_add);
            String legal_phone = guarantess.getLegal_phone();
            map.put("legal_phone",legal_phone);
            String legal_email = guarantess.getLegal_email();
            map.put("legal_email",legal_email);
            String description = guarantess.getDescription();
            map.put("description",description);
        }
        return map;
    }


}
