package com.rongtuo.crm.webservice;

import javax.jws.WebService;

/**
 * Created by Administrator on 2016/6/21 0021.
 */
@WebService
public interface IHello
{
    public void sayHello();

    public String whatSay();
}