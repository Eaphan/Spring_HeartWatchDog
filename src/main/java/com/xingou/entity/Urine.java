package com.xingou.entity;/*
*类Urine
*@DATE2017/9/21
*@author viczyf
*
*/

import javax.persistence.*;
@Table(name = "urine")
@Entity
public class Urine {
    private int id;
    private String date;
    private String leu;
    private String nit;
    private String ubg;
    private String pro;
    private String ph;
    private String sg;
    private String ca;
    private String bld;
    private String ket;
    private String bil;
    private String glu;
    private String vc;
    private String ma;
    private String cr;
    private User user;

    public Urine(){

    }

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
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
    @Column(name = "leu", nullable = true, length = 5)
    public String getLeu() {
        return leu;
    }

    public void setLeu(String leu) {
        this.leu = leu;
    }

    @Basic
    @Column(name = "nit", nullable = true, length = 5)
    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    @Basic
    @Column(name = "ubg", nullable = true, length = 5)
    public String getUbg() {
        return ubg;
    }

    public void setUbg(String ubg) {
        this.ubg = ubg;
    }

    @Basic
    @Column(name = "pro", nullable = true, length = 5)
    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    @Basic
    @Column(name = "ph", nullable = true, length = 5)
    public String getPh() {
        return ph;
    }

    public void setPh(String ph) {
        this.ph = ph;
    }

    @Basic
    @Column(name = "sg", nullable = true, length = 5)
    public String getSg() {
        return sg;
    }

    public void setSg(String sg) {
        this.sg = sg;
    }

    @Basic
    @Column(name = "ca", nullable = true, length = 5)
    public String getCa() {
        return ca;
    }

    public void setCa(String ca) {
        this.ca = ca;
    }

    @Basic
    @Column(name = "bld", nullable = true, length = 5)
    public String getBld() {
        return bld;
    }

    public void setBld(String bld) {
        this.bld = bld;
    }

    @Basic
    @Column(name = "ket", nullable = true, length = 5)
    public String getKet() {
        return ket;
    }

    public void setKet(String ket) {
        this.ket = ket;
    }

    @Basic
    @Column(name = "bil", nullable = true, length = 5)
    public String getBil() {
        return bil;
    }

    public void setBil(String bil) {
        this.bil = bil;
    }

    @Basic
    @Column(name = "glu", nullable = true, length = 5)
    public String getGlu() {
        return glu;
    }

    public void setGlu(String glu) {
        this.glu = glu;
    }

    @Basic
    @Column(name = "vc", nullable = true, length = 5)
    public String getVc() {
        return vc;
    }

    public void setVc(String vc) {
        this.vc = vc;
    }

    @Basic
    @Column(name = "ma", nullable = true, length = 5)
    public String getMa() {
        return ma;
    }

    public void setMa(String ma) {
        this.ma = ma;
    }

    @Basic
    @Column(name = "cr", nullable = true, length = 5)
    public String getCr() {
        return cr;
    }

    public void setCr(String cr) {
        this.cr = cr;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Urine urine = (Urine) o;

        if (id != urine.id) return false;
        if (date != null ? !date.equals(urine.date) : urine.date != null) return false;
        if (leu != null ? !leu.equals(urine.leu) : urine.leu != null) return false;
        if (nit != null ? !nit.equals(urine.nit) : urine.nit != null) return false;
        if (ubg != null ? !ubg.equals(urine.ubg) : urine.ubg != null) return false;
        if (pro != null ? !pro.equals(urine.pro) : urine.pro != null) return false;
        if (ph != null ? !ph.equals(urine.ph) : urine.ph != null) return false;
        if (sg != null ? !sg.equals(urine.sg) : urine.sg != null) return false;
        if (ca != null ? !ca.equals(urine.ca) : urine.ca != null) return false;
        if (bld != null ? !bld.equals(urine.bld) : urine.bld != null) return false;
        if (ket != null ? !ket.equals(urine.ket) : urine.ket != null) return false;
        if (bil != null ? !bil.equals(urine.bil) : urine.bil != null) return false;
        if (glu != null ? !glu.equals(urine.glu) : urine.glu != null) return false;
        if (vc != null ? !vc.equals(urine.vc) : urine.vc != null) return false;
        if (ma != null ? !ma.equals(urine.ma) : urine.ma != null) return false;
        if (cr != null ? !cr.equals(urine.cr) : urine.cr != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (leu != null ? leu.hashCode() : 0);
        result = 31 * result + (nit != null ? nit.hashCode() : 0);
        result = 31 * result + (ubg != null ? ubg.hashCode() : 0);
        result = 31 * result + (pro != null ? pro.hashCode() : 0);
        result = 31 * result + (ph != null ? ph.hashCode() : 0);
        result = 31 * result + (sg != null ? sg.hashCode() : 0);
        result = 31 * result + (ca != null ? ca.hashCode() : 0);
        result = 31 * result + (bld != null ? bld.hashCode() : 0);
        result = 31 * result + (ket != null ? ket.hashCode() : 0);
        result = 31 * result + (bil != null ? bil.hashCode() : 0);
        result = 31 * result + (glu != null ? glu.hashCode() : 0);
        result = 31 * result + (vc != null ? vc.hashCode() : 0);
        result = 31 * result + (ma != null ? ma.hashCode() : 0);
        result = 31 * result + (cr != null ? cr.hashCode() : 0);
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
