package com.rongtuo.crm.domain;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/2/26.
 *
 * 用户
 */
public class User implements Serializable {
    private Integer id;
    private Integer orgId;
    private String name;
    private String orgName;
    private String logincode;
    private String password;
    private String tel;
    private String address;

    public User(){

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrgId() {
        return orgId;
    }

    public void setOrgId(Integer orgId) {
        this.orgId = orgId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogincode() {
        return logincode;
    }

    public void setLogincode(String logincode) {
        this.logincode = logincode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String toString(){
        String str="id="+id+
                ";orgId="+orgId+
                ";name="+name+
                ";logincode="+logincode+
                ";tel"+tel+";";
        return str;
    }
}
