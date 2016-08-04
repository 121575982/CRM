package com.rongtuo.crm.webservice.impl;

import com.rongtuo.crm.webservice.IHello;

import javax.jws.WebService;

/**
 * Created by Administrator on 2016/6/21 0021.
 */
@WebService (serviceName="helloUT",endpointInterface="com.rongtuo.crm.webservice.IHello")
public class IHelloImpl  implements IHello{
    @Override
    public void sayHello() {

    }

    @Override
    public String whatSay() {
        return null;
    }
}
