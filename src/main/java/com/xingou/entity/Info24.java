package com.xingou.entity;/*
*类Info24
*@DATE2017/8/30
*@author viczyf
*
*/

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "info24")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Info24 {
    private Integer id;
    private String date;
    private int time;
    private String dataaddr;
    private String conclusion;
    private User user;

    public Info24(){

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "date", nullable = false, length = 20)
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Basic
    @Column(name = "time", nullable = false)
    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Basic
    @Column(name = "dataaddr", nullable = false, length = 30)
    public String getDataaddr() {
        return dataaddr;
    }

    public void setDataaddr(String dataaddr) {
        this.dataaddr = dataaddr;
    }

    @Basic
    @Column(name = "conclusion", nullable = false, length = -1)
    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Info24 info24 = (Info24) o;

        if (id != info24.id) return false;
        if (time != info24.time) return false;
        if (date != null ? !date.equals(info24.date) : info24.date != null) return false;
        if (dataaddr != null ? !dataaddr.equals(info24.dataaddr) : info24.dataaddr != null) return false;
        if (conclusion != null ? !conclusion.equals(info24.conclusion) : info24.conclusion != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + time;
        result = 31 * result + (dataaddr != null ? dataaddr.hashCode() : 0);
        result = 31 * result + (conclusion != null ? conclusion.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "uid", referencedColumnName = "uid", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
