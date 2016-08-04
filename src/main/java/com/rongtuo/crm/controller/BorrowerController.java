package com.rongtuo.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/6/27 0027.
 */
@Controller
@RequestMapping(value = "/borrower")
public class BorrowerController {
    @RequestMapping(value = "/new")
    public String show1001(ModelMap map) {

        return "borrower/edit";
    }
}
