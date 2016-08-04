package com.rongtuo.crm.domain;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/2/26.
 *
 * 部门
 */
public class Department implements Serializable {

    private Integer id;
    private Integer parentId;
    private Integer  preId;
    private String name;
    private String contacts;
    private String tel;
    private String address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getPreId() {
        return preId;
    }

    public void setPreId(Integer preId) {
        this.preId = preId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
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
        String str="id="+ id+
                ";parentId="+ parentId+
                ";preId="+preId+
                ";name="+name+
                ";contacts="+contacts+
                ";tel="+tel+
                ";address="+address+";";
        return str;
    }
}
