package com.rongtuo.crm.domain;

import java.io.Serializable;

/**
 * Created by admin on 2016/8/2.
 */
public class TreeNode implements Serializable {
    private  int id;
    private  String name;
    private  String key_value;
    private boolean open;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKey_value() {
        return key_value;
    }

    public void setKey_value(String key_value) {
        this.key_value = key_value;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public String toString(){
        String str = "id="+id+";name="+name+";key_value="+key_value+";open="+open;
        return str;
    }
}
