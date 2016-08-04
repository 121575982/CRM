package com.rongtuo.crm.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by Administrator on 2016/2/28.
 */
@Controller
class LoginController {

    @RequestMapping(value = "/")
    public String index(ModelMap map) {
        return "sys/login";
    }

    @RequestMapping(value = "/login")
    public String login(ModelMap map) {

        return "redirect:/main";
    }

    @RequestMapping("/main")
    public String main(ModelMap map) {
        map.put("name", "融托金融");
        return "main";
    }

    @RequestMapping("/callMain")
    public String callMain(ModelMap map) {
        map.put("name", "jojo");
        return "call-main";
    }



    @RequestMapping("/logout")
    public String logout(ModelMap map) {
        return "sys/login";
    }



}
