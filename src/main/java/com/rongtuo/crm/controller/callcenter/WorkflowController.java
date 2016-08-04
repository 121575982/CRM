package com.rongtuo.crm.controller.callcenter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2016/6/8 0008.
 */
@Controller
@RequestMapping(value = "/workflow")
public class WorkflowController {
    @RequestMapping(value = "/new")
    public String newSummary(ModelMap map) {

        return "callcenter/workflow-edit";
    }


    @RequestMapping(value = "/query")
    public String query(ModelMap map) {
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String today=df.format(new Date());

        map.put("beginTime",today);
        map.put("endTime",today);
        return "callcenter/workflow-query";
    }
}
