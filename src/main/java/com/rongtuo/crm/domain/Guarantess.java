package com.rongtuo.crm.domain;

import org.springframework.stereotype.Repository;

import java.io.Serializable;

/**
 * Created by admin on 2016/7/8.
 */
@Repository
public class Guarantess  implements Serializable {
    private Integer id; //ID
    private Integer client_no;//客户号
    private String client_name;//客户名称
    private Double quota;//授信额度
    private String loan_no;//贷款员工号
    private String loan_name;//贷款员姓名
    private String loan_ratify_no;//贷款批准人工号
    private String loan_ratify_name;//贷款批准人姓名
    private String contacts;//联系人
    private String contacts_add;//联系人地址
    private String contacts_phone;//联系人电话
    private String contacts_email;//联系人邮件地址
    private String legal;//法定代表人
    private String legal_add;//法定代表人地址
    private String legal_phone;//法定代表人电话
    private String legal_email;//法定代表人电子邮件
    private String description;//描述

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClient_no() {
        return client_no;
    }

    public void setClient_no(Integer client_no) {
        this.client_no = client_no;
    }

    public String getClient_name() {
        return client_name;
    }

    public void setClient_name(String client_name) {
        this.client_name = client_name;
    }

    public Double getQuota() {
        return quota;
    }

    public void setQuota(Double quota) {
        this.quota = quota;
    }

    public String getLoan_no() {
        return loan_no;
    }

    public void setLoan_no(String loan_no) {
        this.loan_no = loan_no;
    }

    public String getLoan_name() {
        return loan_name;
    }

    public void setLoan_name(String loan_name) {
        this.loan_name = loan_name;
    }

    public String getLoan_ratify_no() {
        return loan_ratify_no;
    }

    public void setLoan_ratify_no(String loan_ratify_no) {
        this.loan_ratify_no = loan_ratify_no;
    }

    public String getLoan_ratify_name() {
        return loan_ratify_name;
    }

    public void setLoan_ratify_name(String loan_ratify_name) {
        this.loan_ratify_name = loan_ratify_name;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getContacts_add() {
        return contacts_add;
    }

    public void setContacts_add(String contacts_add) {
        this.contacts_add = contacts_add;
    }

    public String getContacts_phone() {
        return contacts_phone;
    }

    public void setContacts_phone(String contacts_phone) {
        this.contacts_phone = contacts_phone;
    }

    public String getContacts_email() {
        return contacts_email;
    }

    public void setContacts_email(String contacts_email) {
        this.contacts_email = contacts_email;
    }

    public String getLegal() {
        return legal;
    }

    public void setLegal(String legal) {
        this.legal = legal;
    }

    public String getLegal_add() {
        return legal_add;
    }

    public void setLegal_add(String legal_add) {
        this.legal_add = legal_add;
    }

    public String getLegal_phone() {
        return legal_phone;
    }

    public void setLegal_phone(String legal_phone) {
        this.legal_phone = legal_phone;
    }

    public String getLegal_email() {
        return legal_email;
    }

    public void setLegal_email(String legal_email) {
        this.legal_email = legal_email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
