package com.rongtuo.crm.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.rongtuo.crm.domain.Key_Value;
import com.rongtuo.crm.mapper.Key_ValueMapper;
import com.rongtuo.crm.service.Key_ValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2016/7/28.
 */
@Controller
@RequestMapping(value = "/keyValue")
public class Key_ValueController {

    @Autowired
    private Key_ValueMapper key_ValueMapper;

    @Autowired
    private Key_ValueService key_ValueService;

    @RequestMapping(value = "/add")
    public ModelAndView add(){
        ModelAndView model = new ModelAndView();
        List listInfo = null;
        listInfo = key_ValueService.selName();
        model.addObject("listInfo",listInfo);
        model.setViewName("keyValue/add");
        return model;
    }

    @RequestMapping(value = "/list")
    public String list(){
        return "keyValue/list";
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public Map<String, Object> insert(Key_Value key_value){
        System.out.println("-------------------KeyValue.save--------------------");

        if (key_value.getGroup_id() != null) {
            Integer maxkey_order = key_ValueMapper.maxkeyOrder(key_value);
            System.out.println("getmaxkey_order = " + maxkey_order);
            if(maxkey_order== null){
                maxkey_order = 1;
            }else {
                maxkey_order+=1;
            }
            System.out.println("setmaxkey_order = " + maxkey_order);
            key_value.setKey_order(maxkey_order);
        }

        int result = key_ValueService.insert(key_value);
        System.out.println("KeyValue.result = "+ result);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result",result);
        if(result > 0){
            map.put("message","保存成功!");
        }else{
            map.put("message","保存失败!");
        }
        return map;
    }

    @RequestMapping(value = "/query")
    @ResponseBody
    public Map<String, Object> query(int pageNumber, int pageSize){
        Map<String,Object> map = new HashMap<String, Object>();
        Page<Key_Value> page = key_ValueService.findPage(pageNumber,pageSize);
        map.put("rows",page);
        map.put("total",page.getTotal());
        return map;
    }


    @RequestMapping(value = "/delete")
    @ResponseBody
    public ModelAndView delete(int id){
        ModelAndView model = new ModelAndView();
        int result = 0;
        result = key_ValueService.delete(id);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result",result);
        if(result > 0){
            map.put("message","删除成功!");
        }else{
            map.put("message","删除失败!");
        }
        model.addObject("map",map);
        model.setViewName("keyValue/list");
        return model;
    }

    /**
     * 查询树状结构父类
     * @return
     */
    @RequestMapping (value = "/tree")
    @ResponseBody
    public JSONArray tree(){
        List<Key_Value> key_valueList = key_ValueService.selName();
        JSONArray jsonArray=new JSONArray();
        for(int i=0;i<key_valueList.size();i++){
            Key_Value key_value = key_valueList.get(i);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id",key_value.getId());
            jsonObject.put("name",key_value.getKey_name());
            jsonObject.put("key_value",key_value.getKey_value());
            jsonObject.put("group_id",key_value.getGroup_id());
            jsonObject.put("open",false);
            jsonObject.put("isParent",true);
            jsonArray.add(jsonObject);
        }
        System.out.println("key_ValueService.selName();"+jsonArray.toString());
        return jsonArray;
    }


    /**
     * 查询树状结构子类
     * @param
     * @return
     */
    @RequestMapping(value = "/display")
    @ResponseBody
    public JSONArray display(int id){
        List<Key_Value> key_valueList = key_ValueService.treeChild(id);
        JSONArray jsonArray = new JSONArray();
        for(int i=0;i<key_valueList.size();i++){
            Key_Value key_value = key_valueList.get(i);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id",key_value.getId());
            jsonObject.put("name",key_value.getKey_name());
            jsonObject.put("key_value",key_value.getKey_value());
            jsonObject.put("open",true);
            jsonArray.add(jsonObject);
        }
        System.out.println(" key_ValueService.treeChild(id);"+jsonArray.toString());
        return jsonArray;
    }

    @RequestMapping(value = "/show")
    @ResponseBody
    public Map<String,Object> show(int id){
        Map<String,Object> map = new HashMap<String, Object>();
        Key_Value key_value = key_ValueService.show(id);

        map.put("id",key_value.getId());
        map.put("group_id",key_value.getGroup_id());
        map.put("key_name",key_value.getKey_name());
        map.put("key_word",key_value.getKey_word());
        map.put("key_value",key_value.getKey_value());
        map.put("state",key_value.getState());
        map.put("remark",key_value.getRemark());
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + map.toString());
        return map;
    }


}
