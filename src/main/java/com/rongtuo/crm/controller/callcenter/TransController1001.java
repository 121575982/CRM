package com.rongtuo.crm.controller.callcenter;

import com.rongtuo.crm.model.Trans1001;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 保兴 on 2016/6/1.
 */
@Controller
@RequestMapping(value = "/callcenter")
public class TransController1001 {

    @RequestMapping(value = "/show1001")
    public String show1001(ModelMap map) {

        return "callcenter/trans1001";
    }

    /**
     * 身份认证交易
     * phone 手机号
     * papers 证件号后四位
     */
    @RequestMapping(value = "/trans1001")
    @ResponseBody
    public Map<String, Object> trans1001(String phone,String papers) {

        Map<String, Object> map = new HashMap<String, Object>();
        Trans1001 trans=new Trans1001();
        trans.setPhone("18663582685");
        trans.setPapers("1234");
        trans.setBirthday("10月08日");
        map.put("trans",trans);
        return map;
    }
}
