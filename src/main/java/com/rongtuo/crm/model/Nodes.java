package com.rongtuo.crm.model;

import java.util.List;

/**
 * Created by admin on 2016/7/17.
 */
public class Nodes {
    private int pageSize;
    private int pageNumber;
    private List<Integer> orgs;
    public Nodes(){

    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public List<Integer> getOrgs() {
        return orgs;
    }

    public void setOrgs(List<Integer> orgs) {
        this.orgs = orgs;
    }
}
