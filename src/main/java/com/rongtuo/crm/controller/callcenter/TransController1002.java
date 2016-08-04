package com.rongtuo.crm.controller.callcenter;

import com.github.pagehelper.Page;
import com.rongtuo.crm.model.Trans1001;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 保兴 on 2016/6/1.
 */
@Controller
@RequestMapping(value = "/callcenter")
public class TransController1002 {

    @RequestMapping(value = "/show1002")
    public String show1002(ModelMap map) {
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String today=df.format(new Date());

        map.put("beginTime",today);
        map.put("endTime",today);
        return "callcenter/trans1002";
    }

    /**
     * 身份认证交易
     * phone 手机号
     * papers 证件号后四位
     */
    @RequestMapping(value = "/trans1002")
    @ResponseBody
    public Map<String, Object> trans1002(int pageNumber, int pageSize) {

        //Page<TbBusiness> page= businessService.findPage(pageNumber,pageSize);
        Page page=new Page();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("rows", page);
        map.put("total", page.getTotal());
        return map;
    }




}
