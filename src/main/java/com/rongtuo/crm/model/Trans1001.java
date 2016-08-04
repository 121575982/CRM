package com.rongtuo.crm.model;

import java.io.Serializable;

/**
 * Created by 保兴 on 2016/6/1.
 */
public class Trans1001 implements Serializable {

    private String customerId;           //客户号
    private String phone;                //手机号码
    private String papers;               //证件号后4位
    private String customerName;         //客户姓名
    private String hengfengId;           //恒丰虚拟号
    private String huifuId;              //汇付ID
    private String regeditSource;        //注册来源
    private String birthday;             //生日
    private String grade;                //等级
    private String balance;              //余额

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPapers() {
        return papers;
    }

    public void setPapers(String papers) {
        this.papers = papers;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getHengfengId() {
        return hengfengId;
    }

    public void setHengfengId(String hengfengId) {
        this.hengfengId = hengfengId;
    }

    public String getHuifuId() {
        return huifuId;
    }

    public void setHuifuId(String huifuId) {
        this.huifuId = huifuId;
    }

    public String getRegeditSource() {
        return regeditSource;
    }

    public void setRegeditSource(String regeditSource) {
        this.regeditSource = regeditSource;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }
}
