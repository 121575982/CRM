package com.rongtuo.crm.controller.callcenter;

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
@RequestMapping(value = "/callcenter/summary")
public class SummaryController {

    @RequestMapping(value = "/new")
    public String newSummary(ModelMap map) {

        return "callcenter/summary-edit";
    }


    @RequestMapping(value = "/query")
    public String query(ModelMap map) {
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String today=df.format(new Date());

        map.put("beginTime",today);
        map.put("endTime",today);
        return "callcenter/summary-query";
    }

}
