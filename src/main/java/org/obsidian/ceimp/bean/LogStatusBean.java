package org.obsidian.ceimp.bean;

/**
 * Created by BillChen on 2017/9/7.
 */
public class LogStatusBean {
    private String status;

    @Override
    public String toString() {
        return "LogStatusBean{" +
                "status='" + status + '\'' +
                '}';
    }

    public LogStatusBean() {
    }

    public LogStatusBean(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
