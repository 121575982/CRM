package com.rongtuo.crm.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by admin on 2016/7/7.
 */
public class Project_list implements Serializable {
    private String  project_no;//项目编号
    private String  project_name;//项目名称
    private String  project_purpose;//项目用途
    private Double  plan_money;//计划金额
    private Double  min_money;//最小成立金额
    private Double  max_money;//最大成立金额
    private Double  trans_money;//实际金额
    private Double  risk_reserve;//风险准备金
    private Integer cycle;//周期
    private String  cycle_unit;//周期单位
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date    start_raising_time;//募集开始时间
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date    end_raising_time;//募集结束时间
    private Integer payment_method;//还款方式
    private Double  interest_rate;//利率
    private Double  fee;//手续费
    private String  project_describe;//项目描述
    private Integer  guarantee_id;//担保公司
    private Integer  counter_guarantee_id;//反担保公司
    private String  loan_employee_code;//贷款员工号
    private String  loan_employee_approva_code;//审批人工号
    private Date    insert_time;//录入时间
    private String  insert_code;//录入人工号
    private Date    preliminary_audit_time;//初审时间
    private String  preliminary_audi_code;//初审工号
    private Date    final_audit_time;//终审时间
    private String  final_audit_code;//终审工号
    private Integer project_type;//项目类型
    private Integer id;//ID
    private Integer project_status;//项目审核状态 0 未审核 1 初审通过 2 终审通过 3 未通过


    public String getProject_no() {
        return project_no;
    }

    public void setProject_no(String project_no) {
        this.project_no = project_no;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getProject_purpose() {
        return project_purpose;
    }

    public void setProject_purpose(String project_purpose) {
        this.project_purpose = project_purpose;
    }

    public Double getPlan_money() {
        return plan_money;
    }

    public void setPlan_money(Double plan_money) {
        this.plan_money = plan_money;
    }

    public Double getMin_money() {
        return min_money;
    }

    public void setMin_money(Double min_money) {
        this.min_money = min_money;
    }

    public Double getMax_money() {
        return max_money;
    }

    public void setMax_money(Double max_money) {
        this.max_money = max_money;
    }

    public Double getTrans_money() {
        return trans_money;
    }

    public void setTrans_money(Double trans_money) {
        this.trans_money = trans_money;
    }

    public Double getRisk_reserve() {
        return risk_reserve;
    }

    public void setRisk_reserve(Double risk_reserve) {
        this.risk_reserve = risk_reserve;
    }

    public Integer getCycle() {
        return cycle;
    }

    public void setCycle(Integer cycle) {
        this.cycle = cycle;
    }

    public String getCycle_unit() {
        return cycle_unit;
    }

    public void setCycle_unit(String cycle_unit) {
        this.cycle_unit = cycle_unit;
    }

    public Date getStart_raising_time() {
        return start_raising_time;
    }

    public void setStart_raising_time(Date start_raising_time) {
        this.start_raising_time = start_raising_time;
    }

    public Date getEnd_raising_time() {
        return end_raising_time;
    }

    public void setEnd_raising_time(Date end_raising_time) {
        this.end_raising_time = end_raising_time;
    }

    public Integer getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(Integer payment_method) {
        this.payment_method = payment_method;
    }

    public Double getInterest_rate() {
        return interest_rate;
    }

    public void setInterest_rate(Double interest_rate) {
        this.interest_rate = interest_rate;
    }

    public Double getFee() {
        return fee;
    }

    public void setFee(Double fee) {
        this.fee = fee;
    }

    public String getProject_describe() {
        return project_describe;
    }

    public void setProject_describe(String project_describe) {
        this.project_describe = project_describe;
    }

    public Integer getGuarantee_id() {
        return guarantee_id;
    }

    public void setGuarantee_id(Integer guarantee_id) {
        this.guarantee_id = guarantee_id;
    }

    public Integer getCounter_guarantee_id() {
        return counter_guarantee_id;
    }

    public void setCounter_guarantee_id(Integer counter_guarantee_id) {
        this.counter_guarantee_id = counter_guarantee_id;
    }

    public String getLoan_employee_code() {
        return loan_employee_code;
    }

    public void setLoan_employee_code(String loan_employee_code) {
        this.loan_employee_code = loan_employee_code;
    }

    public String getLoan_employee_approva_code() {
        return loan_employee_approva_code;
    }

    public void setLoan_employee_approva_code(String loan_employee_approva_code) {
        this.loan_employee_approva_code = loan_employee_approva_code;
    }

    public Date getInsert_time() {
        return insert_time;
    }

    public void setInsert_time(Date insert_time) {
        this.insert_time = insert_time;
    }

    public String getInsert_code() {
        return insert_code;
    }

    public void setInsert_code(String insert_code) {
        this.insert_code = insert_code;
    }

    public Date getPreliminary_audit_time() {
        return preliminary_audit_time;
    }

    public void setPreliminary_audit_time(Date preliminary_audit_time) {
        this.preliminary_audit_time = preliminary_audit_time;
    }

    public String getPreliminary_audi_code() {
        return preliminary_audi_code;
    }

    public void setPreliminary_audi_code(String preliminary_audi_code) {
        this.preliminary_audi_code = preliminary_audi_code;
    }

    public Date getFinal_audit_time() {
        return final_audit_time;
    }

    public void setFinal_audit_time(Date final_audit_time) {
        this.final_audit_time = final_audit_time;
    }

    public String getFinal_audit_code() {
        return final_audit_code;
    }

    public void setFinal_audit_code(String final_audit_code) {
        this.final_audit_code = final_audit_code;
    }

    public Integer getProject_type() {
        return project_type;
    }

    public void setProject_type(Integer project_type) {
        this.project_type = project_type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProject_status() {
        return project_status;
    }

    public void setProject_status(Integer project_status) {
        this.project_status = project_status;
    }
}
