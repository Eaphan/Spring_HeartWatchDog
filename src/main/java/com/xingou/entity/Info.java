package com.xingou.entity;/*
*类Info
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
@Table(name = "info", schema = "spring_xingou")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Info {
    private Integer id;
    private String date;
    private int xinlv;
    private int xdgs;
    private String con1;
    private int sxxdgs;
    private String con2;
    private int xdgh;
    private String con3;
    private int fxyb;
    private String con4;
    private int sxyb;
    private String con5;
    private int xlbq;
    private String con6;
    private int sxzb;
    private String con7;
    private int fxzb;
    private String con8;
    private int jjxzb;
    private String con9;
    private int fc;
    private String con10;
    private String data;
    private int pr;
    private int qrs;
    private int qt;
    private int qtc;
    private int p;
    private User user;

    public Info(){}
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
    @Column(name = "xinlv", nullable = true)
    public int getXinlv() {
        return xinlv;
    }

    public void setXinlv(int xinlv) {
        this.xinlv = xinlv;
    }

    @Basic
    @Column(name = "xdgs", nullable = true, length = 10)
    public int getXdgs() {
        return xdgs;
    }

    public void setXdgs(int xdgs) {
        this.xdgs = xdgs;
    }

    @Basic
    @Column(name = "con1", nullable = true, length = 2)
    public String getCon1() {
        return con1;
    }

    public void setCon1(String con1) {
        this.con1 = con1;
    }

    @Basic
    @Column(name = "sxxdgs", nullable = true, length = 10)
    public int getSxxdgs() {
        return sxxdgs;
    }

    public void setSxxdgs(int sxxdgs) {
        this.sxxdgs = sxxdgs;
    }

    @Basic
    @Column(name = "con2", nullable = true, length = 2)
    public String getCon2() {
        return con2;
    }

    public void setCon2(String con2) {
        this.con2 = con2;
    }

    @Basic
    @Column(name = "xdgh", nullable = true, length = 10)
    public int getXdgh() {
        return xdgh;
    }

    public void setXdgh(int xdgh) {
        this.xdgh = xdgh;
    }

    @Basic
    @Column(name = "con3", nullable = true, length = 2)
    public String getCon3() {
        return con3;
    }

    public void setCon3(String con3) {
        this.con3 = con3;
    }

    @Basic
    @Column(name = "fxyb", nullable = true, length = 10)
    public int getFxyb() {
        return fxyb;
    }

    public void setFxyb(int fxyb) {
        this.fxyb = fxyb;
    }

    @Basic
    @Column(name = "con4", nullable = true, length = 2)
    public String getCon4() {
        return con4;
    }

    public void setCon4(String con4) {
        this.con4 = con4;
    }

    @Basic
    @Column(name = "sxyb", nullable = true, length = 10)
    public int getSxyb() {
        return sxyb;
    }

    public void setSxyb(int sxyb) {
        this.sxyb = sxyb;
    }

    @Basic
    @Column(name = "con5", nullable = true, length = 2)
    public String getCon5() {
        return con5;
    }

    public void setCon5(String con5) {
        this.con5 = con5;
    }

    @Basic
    @Column(name = "xlbq", nullable = true, length = 10)
    public int getXlbq() {
        return xlbq;
    }

    public void setXlbq(int xlbq) {
        this.xlbq = xlbq;
    }

    @Basic
    @Column(name = "con6", nullable = true, length = 2)
    public String getCon6() {
        return con6;
    }

    public void setCon6(String con6) {
        this.con6 = con6;
    }

    @Basic
    @Column(name = "sxzb", nullable = true, length = 10)
    public int getSxzb() {
        return sxzb;
    }

    public void setSxzb(int sxzb) {
        this.sxzb = sxzb;
    }

    @Basic
    @Column(name = "con7", nullable = true, length = 2)
    public String getCon7() {
        return con7;
    }

    public void setCon7(String con7) {
        this.con7 = con7;
    }

    @Basic
    @Column(name = "fxzb", nullable = true, length = 10)
    public int getFxzb() {
        return fxzb;
    }

    public void setFxzb(int fxzb) {
        this.fxzb = fxzb;
    }

    @Basic
    @Column(name = "con8", nullable = true, length = 2)
    public String getCon8() {
        return con8;
    }

    public void setCon8(String con8) {
        this.con8 = con8;
    }

    @Basic
    @Column(name = "jjxzb", nullable = true, length = 10)
    public int getJjxzb() {
        return jjxzb;
    }

    public void setJjxzb(int jjxzb) {
        this.jjxzb = jjxzb;
    }

    @Basic
    @Column(name = "con9", nullable = true, length = 2)
    public String getCon9() {
        return con9;
    }

    public void setCon9(String con9) {
        this.con9 = con9;
    }

    @Basic
    @Column(name = "fc", nullable = true, length = 10)
    public int getFc() {
        return fc;
    }

    public void setFc(int fc) {
        this.fc = fc;
    }

    @Basic
    @Column(name = "con10", nullable = true, length = 2)
    public String getCon10() {
        return con10;
    }

    public void setCon10(String con10) {
        this.con10 = con10;
    }

    @Basic
    @Column(name = "data", nullable = true, length = -1)
    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    @Basic
    @Column(name = "pr", nullable = true, length = 5)
    public int getPr() {
        return pr;
    }

    public void setPr(int pr) {
        this.pr = pr;
    }

    @Basic
    @Column(name = "qrs", nullable = true, length = 5)
    public int getQrs() {
        return qrs;
    }

    public void setQrs(int qrs) {
        this.qrs = qrs;
    }

    @Basic
    @Column(name = "qt", nullable = true, length = 5)
    public int getQt() {
        return qt;
    }

    public void setQt(int qt) {
        this.qt = qt;
    }

    @Basic
    @Column(name = "qtc", nullable = true, length = 5)
    public int getQtc() {
        return qtc;
    }

    public void setQtc(int qtc) {
        this.qtc = qtc;
    }

    @Basic
    @Column(name = "p", nullable = true, length = 5)
    public int getP() {
        return p;
    }

    public void setP(int p) {
        this.p = p;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Info info = (Info) o;

        if (xinlv != info.xinlv) return false;
        if (xdgs != info.xdgs) return false;
        if (sxxdgs != info.sxxdgs) return false;
        if (xdgh != info.xdgh) return false;
        if (fxyb != info.fxyb) return false;
        if (sxyb != info.sxyb) return false;
        if (xlbq != info.xlbq) return false;
        if (sxzb != info.sxzb) return false;
        if (fxzb != info.fxzb) return false;
        if (jjxzb != info.jjxzb) return false;
        if (fc != info.fc) return false;
        if (pr != info.pr) return false;
        if (qrs != info.qrs) return false;
        if (qt != info.qt) return false;
        if (qtc != info.qtc) return false;
        if (p != info.p) return false;
        if (id != null ? !id.equals(info.id) : info.id != null) return false;
        if (date != null ? !date.equals(info.date) : info.date != null) return false;
        if (con1 != null ? !con1.equals(info.con1) : info.con1 != null) return false;
        if (con2 != null ? !con2.equals(info.con2) : info.con2 != null) return false;
        if (con3 != null ? !con3.equals(info.con3) : info.con3 != null) return false;
        if (con4 != null ? !con4.equals(info.con4) : info.con4 != null) return false;
        if (con5 != null ? !con5.equals(info.con5) : info.con5 != null) return false;
        if (con6 != null ? !con6.equals(info.con6) : info.con6 != null) return false;
        if (con7 != null ? !con7.equals(info.con7) : info.con7 != null) return false;
        if (con8 != null ? !con8.equals(info.con8) : info.con8 != null) return false;
        if (con9 != null ? !con9.equals(info.con9) : info.con9 != null) return false;
        if (con10 != null ? !con10.equals(info.con10) : info.con10 != null) return false;
        if (data != null ? !data.equals(info.data) : info.data != null) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + xinlv;
        result = 31 * result + xdgs;
        result = 31 * result + (con1 != null ? con1.hashCode() : 0);
        result = 31 * result + sxxdgs;
        result = 31 * result + (con2 != null ? con2.hashCode() : 0);
        result = 31 * result + xdgh;
        result = 31 * result + (con3 != null ? con3.hashCode() : 0);
        result = 31 * result + fxyb;
        result = 31 * result + (con4 != null ? con4.hashCode() : 0);
        result = 31 * result + sxyb;
        result = 31 * result + (con5 != null ? con5.hashCode() : 0);
        result = 31 * result + xlbq;
        result = 31 * result + (con6 != null ? con6.hashCode() : 0);
        result = 31 * result + sxzb;
        result = 31 * result + (con7 != null ? con7.hashCode() : 0);
        result = 31 * result + fxzb;
        result = 31 * result + (con8 != null ? con8.hashCode() : 0);
        result = 31 * result + jjxzb;
        result = 31 * result + (con9 != null ? con9.hashCode() : 0);
        result = 31 * result + fc;
        result = 31 * result + (con10 != null ? con10.hashCode() : 0);
        result = 31 * result + (data != null ? data.hashCode() : 0);
        result = 31 * result + pr;
        result = 31 * result + qrs;
        result = 31 * result + qt;
        result = 31 * result + qtc;
        result = 31 * result + p;
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
