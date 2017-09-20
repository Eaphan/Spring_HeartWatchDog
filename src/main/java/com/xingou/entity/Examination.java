package com.xingou.entity;/*
*类Examination
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
@Table(name = "examination")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Examination {
    private Integer id;
    private String name;
    private String gender;
    private String age;
    private String date;
    private String hospital;
    private String height;
    private String weight;
    private String shousuoya;
    private String shuzhangya;
    private String tizhicon;
    private String neike1;
    private String neike2;
    private String neike3;
    private String neike4;
    private String neike5;
    private String neike6;
    private String neike7;
    private String neike8;
    private String neike9;
    private String neike10;
    private String neike11;
    private String neike12;
    private String neikecon;
    private String waike1;
    private String waike2;
    private String waike3;
    private String waike4;
    private String waike5;
    private String waike6;
    private String waike7;
    private String waike8;
    private String waike9;
    private String waike10;
    private String waike11;
    private String waike12;
    private String waikecon;
    private String yanke1;
    private String yanke2;
    private String yanke3;
    private String yanke4;
    private String yanke5;
    private String yanke6;
    private String yanke7;
    private String yanke8;
    private String yanke9;
    private String yanke10;
    private String yankecon;
    private String er;
    private String bi;
    private String yan;
    private String biantaoti;
    private String hou;
    private String erbihoucon;
    private String oral1;
    private String oral2;
    private String oral3;
    private String oralcon;
    private String ecg1;
    private String ecg2;
    private String ecg3;
    private String ecg4;
    private String ecgcon;
    private String bchaocon;
    private String fangshe1;
    private String fangshecon;
    private String cancer1;
    private String cancer2;
    private String cancer3;
    private String cancer4;
    private String cancer5;
    private String cancer6;
    private String cancercon;
    private String blood1;
    private String blood2;
    private String blood3;
    private String blood4;
    private String blood5;
    private String blood6;
    private String blood7;
    private String blood8;
    private String blood9;
    private String blood10;
    private String blood11;
    private String blood12;
    private String blood13;
    private String blood14;
    private String blood15;
    private String blood16;
    private String blood17;
    private String blood18;
    private String blood19;
    private String bloodcon;
    private String urine1;
    private String urine2;
    private String urine3;
    private String urine4;
    private String urine5;
    private String urine6;
    private String urine7;
    private String urine8;
    private String urine9;
    private String urine10;
    private String urine11;
    private String urine12;
    private String urine13;
    private String urine14;
    private String urine15;
    private String urine16;
    private String urinecon;
    private String liver1;
    private String liver2;
    private String liver3;
    private String liver4;
    private String liver5;
    private String liver6;
    private String liver7;
    private String liver8;
    private String liver9;
    private String liver10;
    private String liver11;
    private String liver12;
    private String livercon;
    private String bloodfat1;
    private String bloodfat2;
    private String bloodfat3;
    private String bloodfat4;
    private String bloodfatcon;
    private String kidney1;
    private String kidney2;
    private String kidney3;
    private String kidneycon;
    private String xuetang1;
    private String xuetangcon;
    private String summary;
    private User user;

    public Examination(){

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
    @Column(name = "name", nullable = true, length = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "gender", nullable = true, length = 1)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "age", nullable = true, length = 20)
    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    @Basic
    @Column(name = "date", nullable = true, length = 20)
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Basic
    @Column(name = "hospital", nullable = true, length = 20)
    public String getHospital() {
        return hospital;
    }

    public void setHospital(String hospital) {
        this.hospital = hospital;
    }

    @Basic
    @Column(name = "height", nullable = true, length = 5)
    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    @Basic
    @Column(name = "weight", nullable = true, length = 5)
    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    @Basic
    @Column(name = "shousuoya", nullable = true, length = 5)
    public String getShousuoya() {
        return shousuoya;
    }

    public void setShousuoya(String shousuoya) {
        this.shousuoya = shousuoya;
    }

    @Basic
    @Column(name = "shuzhangya", nullable = true, length = 5)
    public String getShuzhangya() {
        return shuzhangya;
    }

    public void setShuzhangya(String shuzhangya) {
        this.shuzhangya = shuzhangya;
    }

    @Basic
    @Column(name = "tizhicon", nullable = true, length = 50)
    public String getTizhicon() {
        return tizhicon;
    }

    public void setTizhicon(String tizhicon) {
        this.tizhicon = tizhicon;
    }

    @Basic
    @Column(name = "neike1", nullable = true, length = 5)
    public String getNeike1() {
        return neike1;
    }

    public void setNeike1(String neike1) {
        this.neike1 = neike1;
    }

    @Basic
    @Column(name = "neike2", nullable = true, length = 15)
    public String getNeike2() {
        return neike2;
    }

    public void setNeike2(String neike2) {
        this.neike2 = neike2;
    }

    @Basic
    @Column(name = "neike3", nullable = true, length = 15)
    public String getNeike3() {
        return neike3;
    }

    public void setNeike3(String neike3) {
        this.neike3 = neike3;
    }

    @Basic
    @Column(name = "neike4", nullable = true, length = 15)
    public String getNeike4() {
        return neike4;
    }

    public void setNeike4(String neike4) {
        this.neike4 = neike4;
    }

    @Basic
    @Column(name = "neike5", nullable = true, length = 15)
    public String getNeike5() {
        return neike5;
    }

    public void setNeike5(String neike5) {
        this.neike5 = neike5;
    }

    @Basic
    @Column(name = "neike6", nullable = true, length = 15)
    public String getNeike6() {
        return neike6;
    }

    public void setNeike6(String neike6) {
        this.neike6 = neike6;
    }

    @Basic
    @Column(name = "neike7", nullable = true, length = 15)
    public String getNeike7() {
        return neike7;
    }

    public void setNeike7(String neike7) {
        this.neike7 = neike7;
    }

    @Basic
    @Column(name = "neike8", nullable = true, length = 15)
    public String getNeike8() {
        return neike8;
    }

    public void setNeike8(String neike8) {
        this.neike8 = neike8;
    }

    @Basic
    @Column(name = "neike9", nullable = true, length = 15)
    public String getNeike9() {
        return neike9;
    }

    public void setNeike9(String neike9) {
        this.neike9 = neike9;
    }

    @Basic
    @Column(name = "neike10", nullable = true, length = 15)
    public String getNeike10() {
        return neike10;
    }

    public void setNeike10(String neike10) {
        this.neike10 = neike10;
    }

    @Basic
    @Column(name = "neike11", nullable = true, length = 15)
    public String getNeike11() {
        return neike11;
    }

    public void setNeike11(String neike11) {
        this.neike11 = neike11;
    }

    @Basic
    @Column(name = "neike12", nullable = true, length = 15)
    public String getNeike12() {
        return neike12;
    }

    public void setNeike12(String neike12) {
        this.neike12 = neike12;
    }

    @Basic
    @Column(name = "neikecon", nullable = true, length = 50)
    public String getNeikecon() {
        return neikecon;
    }

    public void setNeikecon(String neikecon) {
        this.neikecon = neikecon;
    }

    @Basic
    @Column(name = "waike1", nullable = true, length = 15)
    public String getWaike1() {
        return waike1;
    }

    public void setWaike1(String waike1) {
        this.waike1 = waike1;
    }

    @Basic
    @Column(name = "waike2", nullable = true, length = 15)
    public String getWaike2() {
        return waike2;
    }

    public void setWaike2(String waike2) {
        this.waike2 = waike2;
    }

    @Basic
    @Column(name = "waike3", nullable = true, length = 15)
    public String getWaike3() {
        return waike3;
    }

    public void setWaike3(String waike3) {
        this.waike3 = waike3;
    }

    @Basic
    @Column(name = "waike4", nullable = true, length = 15)
    public String getWaike4() {
        return waike4;
    }

    public void setWaike4(String waike4) {
        this.waike4 = waike4;
    }

    @Basic
    @Column(name = "waike5", nullable = true, length = 15)
    public String getWaike5() {
        return waike5;
    }

    public void setWaike5(String waike5) {
        this.waike5 = waike5;
    }

    @Basic
    @Column(name = "waike6", nullable = true, length = 15)
    public String getWaike6() {
        return waike6;
    }

    public void setWaike6(String waike6) {
        this.waike6 = waike6;
    }

    @Basic
    @Column(name = "waike7", nullable = true, length = 15)
    public String getWaike7() {
        return waike7;
    }

    public void setWaike7(String waike7) {
        this.waike7 = waike7;
    }

    @Basic
    @Column(name = "waike8", nullable = true, length = 15)
    public String getWaike8() {
        return waike8;
    }

    public void setWaike8(String waike8) {
        this.waike8 = waike8;
    }

    @Basic
    @Column(name = "waike9", nullable = true, length = 15)
    public String getWaike9() {
        return waike9;
    }

    public void setWaike9(String waike9) {
        this.waike9 = waike9;
    }

    @Basic
    @Column(name = "waike10", nullable = true, length = 15)
    public String getWaike10() {
        return waike10;
    }

    public void setWaike10(String waike10) {
        this.waike10 = waike10;
    }

    @Basic
    @Column(name = "waike11", nullable = true, length = 15)
    public String getWaike11() {
        return waike11;
    }

    public void setWaike11(String waike11) {
        this.waike11 = waike11;
    }

    @Basic
    @Column(name = "waike12", nullable = true, length = 15)
    public String getWaike12() {
        return waike12;
    }

    public void setWaike12(String waike12) {
        this.waike12 = waike12;
    }

    @Basic
    @Column(name = "waikecon", nullable = true, length = 50)
    public String getWaikecon() {
        return waikecon;
    }

    public void setWaikecon(String waikecon) {
        this.waikecon = waikecon;
    }

    @Basic
    @Column(name = "yanke1", nullable = true, length = 15)
    public String getYanke1() {
        return yanke1;
    }

    public void setYanke1(String yanke1) {
        this.yanke1 = yanke1;
    }

    @Basic
    @Column(name = "yanke2", nullable = true, length = 15)
    public String getYanke2() {
        return yanke2;
    }

    public void setYanke2(String yanke2) {
        this.yanke2 = yanke2;
    }

    @Basic
    @Column(name = "yanke3", nullable = true, length = 15)
    public String getYanke3() {
        return yanke3;
    }

    public void setYanke3(String yanke3) {
        this.yanke3 = yanke3;
    }

    @Basic
    @Column(name = "yanke4", nullable = true, length = 15)
    public String getYanke4() {
        return yanke4;
    }

    public void setYanke4(String yanke4) {
        this.yanke4 = yanke4;
    }

    @Basic
    @Column(name = "yanke5", nullable = true, length = 15)
    public String getYanke5() {
        return yanke5;
    }

    public void setYanke5(String yanke5) {
        this.yanke5 = yanke5;
    }

    @Basic
    @Column(name = "yanke6", nullable = true, length = 15)
    public String getYanke6() {
        return yanke6;
    }

    public void setYanke6(String yanke6) {
        this.yanke6 = yanke6;
    }

    @Basic
    @Column(name = "yanke7", nullable = true, length = 15)
    public String getYanke7() {
        return yanke7;
    }

    public void setYanke7(String yanke7) {
        this.yanke7 = yanke7;
    }

    @Basic
    @Column(name = "yanke8", nullable = true, length = 15)
    public String getYanke8() {
        return yanke8;
    }

    public void setYanke8(String yanke8) {
        this.yanke8 = yanke8;
    }

    @Basic
    @Column(name = "yanke9", nullable = true, length = 15)
    public String getYanke9() {
        return yanke9;
    }

    public void setYanke9(String yanke9) {
        this.yanke9 = yanke9;
    }

    @Basic
    @Column(name = "yanke10", nullable = true, length = 15)
    public String getYanke10() {
        return yanke10;
    }

    public void setYanke10(String yanke10) {
        this.yanke10 = yanke10;
    }

    @Basic
    @Column(name = "yankecon", nullable = true, length = 50)
    public String getYankecon() {
        return yankecon;
    }

    public void setYankecon(String yankecon) {
        this.yankecon = yankecon;
    }

    @Basic
    @Column(name = "er", nullable = true, length = 15)
    public String getEr() {
        return er;
    }

    public void setEr(String er) {
        this.er = er;
    }

    @Basic
    @Column(name = "bi", nullable = true, length = 15)
    public String getBi() {
        return bi;
    }

    public void setBi(String bi) {
        this.bi = bi;
    }

    @Basic
    @Column(name = "yan", nullable = true, length = 15)
    public String getYan() {
        return yan;
    }

    public void setYan(String yan) {
        this.yan = yan;
    }

    @Basic
    @Column(name = "biantaoti", nullable = true, length = 15)
    public String getBiantaoti() {
        return biantaoti;
    }

    public void setBiantaoti(String biantaoti) {
        this.biantaoti = biantaoti;
    }

    @Basic
    @Column(name = "hou", nullable = true, length = 15)
    public String getHou() {
        return hou;
    }

    public void setHou(String hou) {
        this.hou = hou;
    }

    @Basic
    @Column(name = "erbihoucon", nullable = true, length = 50)
    public String getErbihoucon() {
        return erbihoucon;
    }

    public void setErbihoucon(String erbihoucon) {
        this.erbihoucon = erbihoucon;
    }

    @Basic
    @Column(name = "oral1", nullable = true, length = 15)
    public String getOral1() {
        return oral1;
    }

    public void setOral1(String oral1) {
        this.oral1 = oral1;
    }

    @Basic
    @Column(name = "oral2", nullable = true, length = 15)
    public String getOral2() {
        return oral2;
    }

    public void setOral2(String oral2) {
        this.oral2 = oral2;
    }

    @Basic
    @Column(name = "oral3", nullable = true, length = 15)
    public String getOral3() {
        return oral3;
    }

    public void setOral3(String oral3) {
        this.oral3 = oral3;
    }

    @Basic
    @Column(name = "oralcon", nullable = true, length = 50)
    public String getOralcon() {
        return oralcon;
    }

    public void setOralcon(String oralcon) {
        this.oralcon = oralcon;
    }

    @Basic
    @Column(name = "ecg1", nullable = true, length = 5)
    public String getEcg1() {
        return ecg1;
    }

    public void setEcg1(String ecg1) {
        this.ecg1 = ecg1;
    }

    @Basic
    @Column(name = "ecg2", nullable = true, length = 5)
    public String getEcg2() {
        return ecg2;
    }

    public void setEcg2(String ecg2) {
        this.ecg2 = ecg2;
    }

    @Basic
    @Column(name = "ecg3", nullable = true, length = 5)
    public String getEcg3() {
        return ecg3;
    }

    public void setEcg3(String ecg3) {
        this.ecg3 = ecg3;
    }

    @Basic
    @Column(name = "ecg4", nullable = true, length = 5)
    public String getEcg4() {
        return ecg4;
    }

    public void setEcg4(String ecg4) {
        this.ecg4 = ecg4;
    }

    @Basic
    @Column(name = "ecgcon", nullable = true, length = 50)
    public String getEcgcon() {
        return ecgcon;
    }

    public void setEcgcon(String ecgcon) {
        this.ecgcon = ecgcon;
    }

    @Basic
    @Column(name = "bchaocon", nullable = true, length = 80)
    public String getBchaocon() {
        return bchaocon;
    }

    public void setBchaocon(String bchaocon) {
        this.bchaocon = bchaocon;
    }

    @Basic
    @Column(name = "fangshe1", nullable = true, length = 80)
    public String getFangshe1() {
        return fangshe1;
    }

    public void setFangshe1(String fangshe1) {
        this.fangshe1 = fangshe1;
    }

    @Basic
    @Column(name = "fangshecon", nullable = true, length = 50)
    public String getFangshecon() {
        return fangshecon;
    }

    public void setFangshecon(String fangshecon) {
        this.fangshecon = fangshecon;
    }

    @Basic
    @Column(name = "cancer1", nullable = true, length = 10)
    public String getCancer1() {
        return cancer1;
    }

    public void setCancer1(String cancer1) {
        this.cancer1 = cancer1;
    }

    @Basic
    @Column(name = "cancer2", nullable = true, length = 10)
    public String getCancer2() {
        return cancer2;
    }

    public void setCancer2(String cancer2) {
        this.cancer2 = cancer2;
    }

    @Basic
    @Column(name = "cancer3", nullable = true, length = 10)
    public String getCancer3() {
        return cancer3;
    }

    public void setCancer3(String cancer3) {
        this.cancer3 = cancer3;
    }

    @Basic
    @Column(name = "cancer4", nullable = true, length = 10)
    public String getCancer4() {
        return cancer4;
    }

    public void setCancer4(String cancer4) {
        this.cancer4 = cancer4;
    }

    @Basic
    @Column(name = "cancer5", nullable = true, length = 10)
    public String getCancer5() {
        return cancer5;
    }

    public void setCancer5(String cancer5) {
        this.cancer5 = cancer5;
    }

    @Basic
    @Column(name = "cancer6", nullable = true, length = 10)
    public String getCancer6() {
        return cancer6;
    }

    public void setCancer6(String cancer6) {
        this.cancer6 = cancer6;
    }

    @Basic
    @Column(name = "cancercon", nullable = true, length = 50)
    public String getCancercon() {
        return cancercon;
    }

    public void setCancercon(String cancercon) {
        this.cancercon = cancercon;
    }

    @Basic
    @Column(name = "blood1", nullable = true, length = 8)
    public String getBlood1() {
        return blood1;
    }

    public void setBlood1(String blood1) {
        this.blood1 = blood1;
    }

    @Basic
    @Column(name = "blood2", nullable = true, length = 8)
    public String getBlood2() {
        return blood2;
    }

    public void setBlood2(String blood2) {
        this.blood2 = blood2;
    }

    @Basic
    @Column(name = "blood3", nullable = true, length = 8)
    public String getBlood3() {
        return blood3;
    }

    public void setBlood3(String blood3) {
        this.blood3 = blood3;
    }

    @Basic
    @Column(name = "blood4", nullable = true, length = 8)
    public String getBlood4() {
        return blood4;
    }

    public void setBlood4(String blood4) {
        this.blood4 = blood4;
    }

    @Basic
    @Column(name = "blood5", nullable = true, length = 8)
    public String getBlood5() {
        return blood5;
    }

    public void setBlood5(String blood5) {
        this.blood5 = blood5;
    }

    @Basic
    @Column(name = "blood6", nullable = true, length = 8)
    public String getBlood6() {
        return blood6;
    }

    public void setBlood6(String blood6) {
        this.blood6 = blood6;
    }

    @Basic
    @Column(name = "blood7", nullable = true, length = 8)
    public String getBlood7() {
        return blood7;
    }

    public void setBlood7(String blood7) {
        this.blood7 = blood7;
    }

    @Basic
    @Column(name = "blood8", nullable = true, length = 8)
    public String getBlood8() {
        return blood8;
    }

    public void setBlood8(String blood8) {
        this.blood8 = blood8;
    }

    @Basic
    @Column(name = "blood9", nullable = true, length = 8)
    public String getBlood9() {
        return blood9;
    }

    public void setBlood9(String blood9) {
        this.blood9 = blood9;
    }

    @Basic
    @Column(name = "blood10", nullable = true, length = 8)
    public String getBlood10() {
        return blood10;
    }

    public void setBlood10(String blood10) {
        this.blood10 = blood10;
    }

    @Basic
    @Column(name = "blood11", nullable = true, length = 8)
    public String getBlood11() {
        return blood11;
    }

    public void setBlood11(String blood11) {
        this.blood11 = blood11;
    }

    @Basic
    @Column(name = "blood12", nullable = true, length = 8)
    public String getBlood12() {
        return blood12;
    }

    public void setBlood12(String blood12) {
        this.blood12 = blood12;
    }

    @Basic
    @Column(name = "blood13", nullable = true, length = 8)
    public String getBlood13() {
        return blood13;
    }

    public void setBlood13(String blood13) {
        this.blood13 = blood13;
    }

    @Basic
    @Column(name = "blood14", nullable = true, length = 8)
    public String getBlood14() {
        return blood14;
    }

    public void setBlood14(String blood14) {
        this.blood14 = blood14;
    }

    @Basic
    @Column(name = "blood15", nullable = true, length = 8)
    public String getBlood15() {
        return blood15;
    }

    public void setBlood15(String blood15) {
        this.blood15 = blood15;
    }

    @Basic
    @Column(name = "blood16", nullable = true, length = 8)
    public String getBlood16() {
        return blood16;
    }

    public void setBlood16(String blood16) {
        this.blood16 = blood16;
    }

    @Basic
    @Column(name = "blood17", nullable = true, length = 8)
    public String getBlood17() {
        return blood17;
    }

    public void setBlood17(String blood17) {
        this.blood17 = blood17;
    }

    @Basic
    @Column(name = "blood18", nullable = true, length = 8)
    public String getBlood18() {
        return blood18;
    }

    public void setBlood18(String blood18) {
        this.blood18 = blood18;
    }

    @Basic
    @Column(name = "blood19", nullable = true, length = 8)
    public String getBlood19() {
        return blood19;
    }

    public void setBlood19(String blood19) {
        this.blood19 = blood19;
    }

    @Basic
    @Column(name = "bloodcon", nullable = true, length = 80)
    public String getBloodcon() {
        return bloodcon;
    }

    public void setBloodcon(String bloodcon) {
        this.bloodcon = bloodcon;
    }

    @Basic
    @Column(name = "urine1", nullable = true, length = 10)
    public String getUrine1() {
        return urine1;
    }

    public void setUrine1(String urine1) {
        this.urine1 = urine1;
    }

    @Basic
    @Column(name = "urine2", nullable = true, length = 10)
    public String getUrine2() {
        return urine2;
    }

    public void setUrine2(String urine2) {
        this.urine2 = urine2;
    }

    @Basic
    @Column(name = "urine3", nullable = true, length = 10)
    public String getUrine3() {
        return urine3;
    }

    public void setUrine3(String urine3) {
        this.urine3 = urine3;
    }

    @Basic
    @Column(name = "urine4", nullable = true, length = 10)
    public String getUrine4() {
        return urine4;
    }

    public void setUrine4(String urine4) {
        this.urine4 = urine4;
    }

    @Basic
    @Column(name = "urine5", nullable = true, length = 10)
    public String getUrine5() {
        return urine5;
    }

    public void setUrine5(String urine5) {
        this.urine5 = urine5;
    }

    @Basic
    @Column(name = "urine6", nullable = true, length = 10)
    public String getUrine6() {
        return urine6;
    }

    public void setUrine6(String urine6) {
        this.urine6 = urine6;
    }

    @Basic
    @Column(name = "urine7", nullable = true, length = 10)
    public String getUrine7() {
        return urine7;
    }

    public void setUrine7(String urine7) {
        this.urine7 = urine7;
    }

    @Basic
    @Column(name = "urine8", nullable = true, length = 10)
    public String getUrine8() {
        return urine8;
    }

    public void setUrine8(String urine8) {
        this.urine8 = urine8;
    }

    @Basic
    @Column(name = "urine9", nullable = true, length = 10)
    public String getUrine9() {
        return urine9;
    }

    public void setUrine9(String urine9) {
        this.urine9 = urine9;
    }

    @Basic
    @Column(name = "urine10", nullable = true, length = 10)
    public String getUrine10() {
        return urine10;
    }

    public void setUrine10(String urine10) {
        this.urine10 = urine10;
    }

    @Basic
    @Column(name = "urine11", nullable = true, length = 10)
    public String getUrine11() {
        return urine11;
    }

    public void setUrine11(String urine11) {
        this.urine11 = urine11;
    }

    @Basic
    @Column(name = "urine12", nullable = true, length = 10)
    public String getUrine12() {
        return urine12;
    }

    public void setUrine12(String urine12) {
        this.urine12 = urine12;
    }

    @Basic
    @Column(name = "urine13", nullable = true, length = 10)
    public String getUrine13() {
        return urine13;
    }

    public void setUrine13(String urine13) {
        this.urine13 = urine13;
    }

    @Basic
    @Column(name = "urine14", nullable = true, length = 10)
    public String getUrine14() {
        return urine14;
    }

    public void setUrine14(String urine14) {
        this.urine14 = urine14;
    }

    @Basic
    @Column(name = "urine15", nullable = true, length = 10)
    public String getUrine15() {
        return urine15;
    }

    public void setUrine15(String urine15) {
        this.urine15 = urine15;
    }

    @Basic
    @Column(name = "urine16", nullable = true, length = 10)
    public String getUrine16() {
        return urine16;
    }

    public void setUrine16(String urine16) {
        this.urine16 = urine16;
    }

    @Basic
    @Column(name = "urinecon", nullable = true, length = 80)
    public String getUrinecon() {
        return urinecon;
    }

    public void setUrinecon(String urinecon) {
        this.urinecon = urinecon;
    }

    @Basic
    @Column(name = "liver1", nullable = true, length = 8)
    public String getLiver1() {
        return liver1;
    }

    public void setLiver1(String liver1) {
        this.liver1 = liver1;
    }

    @Basic
    @Column(name = "liver2", nullable = true, length = 8)
    public String getLiver2() {
        return liver2;
    }

    public void setLiver2(String liver2) {
        this.liver2 = liver2;
    }

    @Basic
    @Column(name = "liver3", nullable = true, length = 8)
    public String getLiver3() {
        return liver3;
    }

    public void setLiver3(String liver3) {
        this.liver3 = liver3;
    }

    @Basic
    @Column(name = "liver4", nullable = true, length = 8)
    public String getLiver4() {
        return liver4;
    }

    public void setLiver4(String liver4) {
        this.liver4 = liver4;
    }

    @Basic
    @Column(name = "liver5", nullable = true, length = 8)
    public String getLiver5() {
        return liver5;
    }

    public void setLiver5(String liver5) {
        this.liver5 = liver5;
    }

    @Basic
    @Column(name = "liver6", nullable = true, length = 8)
    public String getLiver6() {
        return liver6;
    }

    public void setLiver6(String liver6) {
        this.liver6 = liver6;
    }

    @Basic
    @Column(name = "liver7", nullable = true, length = 8)
    public String getLiver7() {
        return liver7;
    }

    public void setLiver7(String liver7) {
        this.liver7 = liver7;
    }

    @Basic
    @Column(name = "liver8", nullable = true, length = 8)
    public String getLiver8() {
        return liver8;
    }

    public void setLiver8(String liver8) {
        this.liver8 = liver8;
    }

    @Basic
    @Column(name = "liver9", nullable = true, length = 8)
    public String getLiver9() {
        return liver9;
    }

    public void setLiver9(String liver9) {
        this.liver9 = liver9;
    }

    @Basic
    @Column(name = "liver10", nullable = true, length = 8)
    public String getLiver10() {
        return liver10;
    }

    public void setLiver10(String liver10) {
        this.liver10 = liver10;
    }

    @Basic
    @Column(name = "liver11", nullable = true, length = 8)
    public String getLiver11() {
        return liver11;
    }

    public void setLiver11(String liver11) {
        this.liver11 = liver11;
    }

    @Basic
    @Column(name = "liver12", nullable = true, length = 8)
    public String getLiver12() {
        return liver12;
    }

    public void setLiver12(String liver12) {
        this.liver12 = liver12;
    }

    @Basic
    @Column(name = "livercon", nullable = true, length = 80)
    public String getLivercon() {
        return livercon;
    }

    public void setLivercon(String livercon) {
        this.livercon = livercon;
    }

    @Basic
    @Column(name = "bloodfat1", nullable = true, length = 8)
    public String getBloodfat1() {
        return bloodfat1;
    }

    public void setBloodfat1(String bloodfat1) {
        this.bloodfat1 = bloodfat1;
    }

    @Basic
    @Column(name = "bloodfat2", nullable = true, length = 8)
    public String getBloodfat2() {
        return bloodfat2;
    }

    public void setBloodfat2(String bloodfat2) {
        this.bloodfat2 = bloodfat2;
    }

    @Basic
    @Column(name = "bloodfat3", nullable = true, length = 8)
    public String getBloodfat3() {
        return bloodfat3;
    }

    public void setBloodfat3(String bloodfat3) {
        this.bloodfat3 = bloodfat3;
    }

    @Basic
    @Column(name = "bloodfat4", nullable = true, length = 8)
    public String getBloodfat4() {
        return bloodfat4;
    }

    public void setBloodfat4(String bloodfat4) {
        this.bloodfat4 = bloodfat4;
    }

    @Basic
    @Column(name = "bloodfatcon", nullable = true, length = 50)
    public String getBloodfatcon() {
        return bloodfatcon;
    }

    public void setBloodfatcon(String bloodfatcon) {
        this.bloodfatcon = bloodfatcon;
    }

    @Basic
    @Column(name = "kidney1", nullable = true, length = 8)
    public String getKidney1() {
        return kidney1;
    }

    public void setKidney1(String kidney1) {
        this.kidney1 = kidney1;
    }

    @Basic
    @Column(name = "kidney2", nullable = true, length = 8)
    public String getKidney2() {
        return kidney2;
    }

    public void setKidney2(String kidney2) {
        this.kidney2 = kidney2;
    }

    @Basic
    @Column(name = "kidney3", nullable = true, length = 8)
    public String getKidney3() {
        return kidney3;
    }

    public void setKidney3(String kidney3) {
        this.kidney3 = kidney3;
    }

    @Basic
    @Column(name = "kidneycon", nullable = true, length = 50)
    public String getKidneycon() {
        return kidneycon;
    }

    public void setKidneycon(String kidneycon) {
        this.kidneycon = kidneycon;
    }

    @Basic
    @Column(name = "xuetang1", nullable = true, length = 8)
    public String getXuetang1() {
        return xuetang1;
    }

    public void setXuetang1(String xuetang1) {
        this.xuetang1 = xuetang1;
    }

    @Basic
    @Column(name = "xuetangcon", nullable = true, length = 50)
    public String getXuetangcon() {
        return xuetangcon;
    }

    public void setXuetangcon(String xuetangcon) {
        this.xuetangcon = xuetangcon;
    }

    @Basic
    @Column(name = "summary", nullable = true, length = 200)
    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Examination that = (Examination) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (gender != null ? !gender.equals(that.gender) : that.gender != null) return false;
        if (age != null ? !age.equals(that.age) : that.age != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (hospital != null ? !hospital.equals(that.hospital) : that.hospital != null) return false;
        if (height != null ? !height.equals(that.height) : that.height != null) return false;
        if (weight != null ? !weight.equals(that.weight) : that.weight != null) return false;
        if (shousuoya != null ? !shousuoya.equals(that.shousuoya) : that.shousuoya != null) return false;
        if (shuzhangya != null ? !shuzhangya.equals(that.shuzhangya) : that.shuzhangya != null) return false;
        if (tizhicon != null ? !tizhicon.equals(that.tizhicon) : that.tizhicon != null) return false;
        if (neike1 != null ? !neike1.equals(that.neike1) : that.neike1 != null) return false;
        if (neike2 != null ? !neike2.equals(that.neike2) : that.neike2 != null) return false;
        if (neike3 != null ? !neike3.equals(that.neike3) : that.neike3 != null) return false;
        if (neike4 != null ? !neike4.equals(that.neike4) : that.neike4 != null) return false;
        if (neike5 != null ? !neike5.equals(that.neike5) : that.neike5 != null) return false;
        if (neike6 != null ? !neike6.equals(that.neike6) : that.neike6 != null) return false;
        if (neike7 != null ? !neike7.equals(that.neike7) : that.neike7 != null) return false;
        if (neike8 != null ? !neike8.equals(that.neike8) : that.neike8 != null) return false;
        if (neike9 != null ? !neike9.equals(that.neike9) : that.neike9 != null) return false;
        if (neike10 != null ? !neike10.equals(that.neike10) : that.neike10 != null) return false;
        if (neike11 != null ? !neike11.equals(that.neike11) : that.neike11 != null) return false;
        if (neike12 != null ? !neike12.equals(that.neike12) : that.neike12 != null) return false;
        if (neikecon != null ? !neikecon.equals(that.neikecon) : that.neikecon != null) return false;
        if (waike1 != null ? !waike1.equals(that.waike1) : that.waike1 != null) return false;
        if (waike2 != null ? !waike2.equals(that.waike2) : that.waike2 != null) return false;
        if (waike3 != null ? !waike3.equals(that.waike3) : that.waike3 != null) return false;
        if (waike4 != null ? !waike4.equals(that.waike4) : that.waike4 != null) return false;
        if (waike5 != null ? !waike5.equals(that.waike5) : that.waike5 != null) return false;
        if (waike6 != null ? !waike6.equals(that.waike6) : that.waike6 != null) return false;
        if (waike7 != null ? !waike7.equals(that.waike7) : that.waike7 != null) return false;
        if (waike8 != null ? !waike8.equals(that.waike8) : that.waike8 != null) return false;
        if (waike9 != null ? !waike9.equals(that.waike9) : that.waike9 != null) return false;
        if (waike10 != null ? !waike10.equals(that.waike10) : that.waike10 != null) return false;
        if (waike11 != null ? !waike11.equals(that.waike11) : that.waike11 != null) return false;
        if (waike12 != null ? !waike12.equals(that.waike12) : that.waike12 != null) return false;
        if (waikecon != null ? !waikecon.equals(that.waikecon) : that.waikecon != null) return false;
        if (yanke1 != null ? !yanke1.equals(that.yanke1) : that.yanke1 != null) return false;
        if (yanke2 != null ? !yanke2.equals(that.yanke2) : that.yanke2 != null) return false;
        if (yanke3 != null ? !yanke3.equals(that.yanke3) : that.yanke3 != null) return false;
        if (yanke4 != null ? !yanke4.equals(that.yanke4) : that.yanke4 != null) return false;
        if (yanke5 != null ? !yanke5.equals(that.yanke5) : that.yanke5 != null) return false;
        if (yanke6 != null ? !yanke6.equals(that.yanke6) : that.yanke6 != null) return false;
        if (yanke7 != null ? !yanke7.equals(that.yanke7) : that.yanke7 != null) return false;
        if (yanke8 != null ? !yanke8.equals(that.yanke8) : that.yanke8 != null) return false;
        if (yanke9 != null ? !yanke9.equals(that.yanke9) : that.yanke9 != null) return false;
        if (yanke10 != null ? !yanke10.equals(that.yanke10) : that.yanke10 != null) return false;
        if (yankecon != null ? !yankecon.equals(that.yankecon) : that.yankecon != null) return false;
        if (er != null ? !er.equals(that.er) : that.er != null) return false;
        if (bi != null ? !bi.equals(that.bi) : that.bi != null) return false;
        if (yan != null ? !yan.equals(that.yan) : that.yan != null) return false;
        if (biantaoti != null ? !biantaoti.equals(that.biantaoti) : that.biantaoti != null) return false;
        if (hou != null ? !hou.equals(that.hou) : that.hou != null) return false;
        if (erbihoucon != null ? !erbihoucon.equals(that.erbihoucon) : that.erbihoucon != null) return false;
        if (oral1 != null ? !oral1.equals(that.oral1) : that.oral1 != null) return false;
        if (oral2 != null ? !oral2.equals(that.oral2) : that.oral2 != null) return false;
        if (oral3 != null ? !oral3.equals(that.oral3) : that.oral3 != null) return false;
        if (oralcon != null ? !oralcon.equals(that.oralcon) : that.oralcon != null) return false;
        if (ecg1 != null ? !ecg1.equals(that.ecg1) : that.ecg1 != null) return false;
        if (ecg2 != null ? !ecg2.equals(that.ecg2) : that.ecg2 != null) return false;
        if (ecg3 != null ? !ecg3.equals(that.ecg3) : that.ecg3 != null) return false;
        if (ecg4 != null ? !ecg4.equals(that.ecg4) : that.ecg4 != null) return false;
        if (ecgcon != null ? !ecgcon.equals(that.ecgcon) : that.ecgcon != null) return false;
        if (bchaocon != null ? !bchaocon.equals(that.bchaocon) : that.bchaocon != null) return false;
        if (fangshe1 != null ? !fangshe1.equals(that.fangshe1) : that.fangshe1 != null) return false;
        if (fangshecon != null ? !fangshecon.equals(that.fangshecon) : that.fangshecon != null) return false;
        if (cancer1 != null ? !cancer1.equals(that.cancer1) : that.cancer1 != null) return false;
        if (cancer2 != null ? !cancer2.equals(that.cancer2) : that.cancer2 != null) return false;
        if (cancer3 != null ? !cancer3.equals(that.cancer3) : that.cancer3 != null) return false;
        if (cancer4 != null ? !cancer4.equals(that.cancer4) : that.cancer4 != null) return false;
        if (cancer5 != null ? !cancer5.equals(that.cancer5) : that.cancer5 != null) return false;
        if (cancer6 != null ? !cancer6.equals(that.cancer6) : that.cancer6 != null) return false;
        if (cancercon != null ? !cancercon.equals(that.cancercon) : that.cancercon != null) return false;
        if (blood1 != null ? !blood1.equals(that.blood1) : that.blood1 != null) return false;
        if (blood2 != null ? !blood2.equals(that.blood2) : that.blood2 != null) return false;
        if (blood3 != null ? !blood3.equals(that.blood3) : that.blood3 != null) return false;
        if (blood4 != null ? !blood4.equals(that.blood4) : that.blood4 != null) return false;
        if (blood5 != null ? !blood5.equals(that.blood5) : that.blood5 != null) return false;
        if (blood6 != null ? !blood6.equals(that.blood6) : that.blood6 != null) return false;
        if (blood7 != null ? !blood7.equals(that.blood7) : that.blood7 != null) return false;
        if (blood8 != null ? !blood8.equals(that.blood8) : that.blood8 != null) return false;
        if (blood9 != null ? !blood9.equals(that.blood9) : that.blood9 != null) return false;
        if (blood10 != null ? !blood10.equals(that.blood10) : that.blood10 != null) return false;
        if (blood11 != null ? !blood11.equals(that.blood11) : that.blood11 != null) return false;
        if (blood12 != null ? !blood12.equals(that.blood12) : that.blood12 != null) return false;
        if (blood13 != null ? !blood13.equals(that.blood13) : that.blood13 != null) return false;
        if (blood14 != null ? !blood14.equals(that.blood14) : that.blood14 != null) return false;
        if (blood15 != null ? !blood15.equals(that.blood15) : that.blood15 != null) return false;
        if (blood16 != null ? !blood16.equals(that.blood16) : that.blood16 != null) return false;
        if (blood17 != null ? !blood17.equals(that.blood17) : that.blood17 != null) return false;
        if (blood18 != null ? !blood18.equals(that.blood18) : that.blood18 != null) return false;
        if (blood19 != null ? !blood19.equals(that.blood19) : that.blood19 != null) return false;
        if (bloodcon != null ? !bloodcon.equals(that.bloodcon) : that.bloodcon != null) return false;
        if (urine1 != null ? !urine1.equals(that.urine1) : that.urine1 != null) return false;
        if (urine2 != null ? !urine2.equals(that.urine2) : that.urine2 != null) return false;
        if (urine3 != null ? !urine3.equals(that.urine3) : that.urine3 != null) return false;
        if (urine4 != null ? !urine4.equals(that.urine4) : that.urine4 != null) return false;
        if (urine5 != null ? !urine5.equals(that.urine5) : that.urine5 != null) return false;
        if (urine6 != null ? !urine6.equals(that.urine6) : that.urine6 != null) return false;
        if (urine7 != null ? !urine7.equals(that.urine7) : that.urine7 != null) return false;
        if (urine8 != null ? !urine8.equals(that.urine8) : that.urine8 != null) return false;
        if (urine9 != null ? !urine9.equals(that.urine9) : that.urine9 != null) return false;
        if (urine10 != null ? !urine10.equals(that.urine10) : that.urine10 != null) return false;
        if (urine11 != null ? !urine11.equals(that.urine11) : that.urine11 != null) return false;
        if (urine12 != null ? !urine12.equals(that.urine12) : that.urine12 != null) return false;
        if (urine13 != null ? !urine13.equals(that.urine13) : that.urine13 != null) return false;
        if (urine14 != null ? !urine14.equals(that.urine14) : that.urine14 != null) return false;
        if (urine15 != null ? !urine15.equals(that.urine15) : that.urine15 != null) return false;
        if (urine16 != null ? !urine16.equals(that.urine16) : that.urine16 != null) return false;
        if (urinecon != null ? !urinecon.equals(that.urinecon) : that.urinecon != null) return false;
        if (liver1 != null ? !liver1.equals(that.liver1) : that.liver1 != null) return false;
        if (liver2 != null ? !liver2.equals(that.liver2) : that.liver2 != null) return false;
        if (liver3 != null ? !liver3.equals(that.liver3) : that.liver3 != null) return false;
        if (liver4 != null ? !liver4.equals(that.liver4) : that.liver4 != null) return false;
        if (liver5 != null ? !liver5.equals(that.liver5) : that.liver5 != null) return false;
        if (liver6 != null ? !liver6.equals(that.liver6) : that.liver6 != null) return false;
        if (liver7 != null ? !liver7.equals(that.liver7) : that.liver7 != null) return false;
        if (liver8 != null ? !liver8.equals(that.liver8) : that.liver8 != null) return false;
        if (liver9 != null ? !liver9.equals(that.liver9) : that.liver9 != null) return false;
        if (liver10 != null ? !liver10.equals(that.liver10) : that.liver10 != null) return false;
        if (liver11 != null ? !liver11.equals(that.liver11) : that.liver11 != null) return false;
        if (liver12 != null ? !liver12.equals(that.liver12) : that.liver12 != null) return false;
        if (livercon != null ? !livercon.equals(that.livercon) : that.livercon != null) return false;
        if (bloodfat1 != null ? !bloodfat1.equals(that.bloodfat1) : that.bloodfat1 != null) return false;
        if (bloodfat2 != null ? !bloodfat2.equals(that.bloodfat2) : that.bloodfat2 != null) return false;
        if (bloodfat3 != null ? !bloodfat3.equals(that.bloodfat3) : that.bloodfat3 != null) return false;
        if (bloodfat4 != null ? !bloodfat4.equals(that.bloodfat4) : that.bloodfat4 != null) return false;
        if (bloodfatcon != null ? !bloodfatcon.equals(that.bloodfatcon) : that.bloodfatcon != null) return false;
        if (kidney1 != null ? !kidney1.equals(that.kidney1) : that.kidney1 != null) return false;
        if (kidney2 != null ? !kidney2.equals(that.kidney2) : that.kidney2 != null) return false;
        if (kidney3 != null ? !kidney3.equals(that.kidney3) : that.kidney3 != null) return false;
        if (kidneycon != null ? !kidneycon.equals(that.kidneycon) : that.kidneycon != null) return false;
        if (xuetang1 != null ? !xuetang1.equals(that.xuetang1) : that.xuetang1 != null) return false;
        if (xuetangcon != null ? !xuetangcon.equals(that.xuetangcon) : that.xuetangcon != null) return false;
        if (summary != null ? !summary.equals(that.summary) : that.summary != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (hospital != null ? hospital.hashCode() : 0);
        result = 31 * result + (height != null ? height.hashCode() : 0);
        result = 31 * result + (weight != null ? weight.hashCode() : 0);
        result = 31 * result + (shousuoya != null ? shousuoya.hashCode() : 0);
        result = 31 * result + (shuzhangya != null ? shuzhangya.hashCode() : 0);
        result = 31 * result + (tizhicon != null ? tizhicon.hashCode() : 0);
        result = 31 * result + (neike1 != null ? neike1.hashCode() : 0);
        result = 31 * result + (neike2 != null ? neike2.hashCode() : 0);
        result = 31 * result + (neike3 != null ? neike3.hashCode() : 0);
        result = 31 * result + (neike4 != null ? neike4.hashCode() : 0);
        result = 31 * result + (neike5 != null ? neike5.hashCode() : 0);
        result = 31 * result + (neike6 != null ? neike6.hashCode() : 0);
        result = 31 * result + (neike7 != null ? neike7.hashCode() : 0);
        result = 31 * result + (neike8 != null ? neike8.hashCode() : 0);
        result = 31 * result + (neike9 != null ? neike9.hashCode() : 0);
        result = 31 * result + (neike10 != null ? neike10.hashCode() : 0);
        result = 31 * result + (neike11 != null ? neike11.hashCode() : 0);
        result = 31 * result + (neike12 != null ? neike12.hashCode() : 0);
        result = 31 * result + (neikecon != null ? neikecon.hashCode() : 0);
        result = 31 * result + (waike1 != null ? waike1.hashCode() : 0);
        result = 31 * result + (waike2 != null ? waike2.hashCode() : 0);
        result = 31 * result + (waike3 != null ? waike3.hashCode() : 0);
        result = 31 * result + (waike4 != null ? waike4.hashCode() : 0);
        result = 31 * result + (waike5 != null ? waike5.hashCode() : 0);
        result = 31 * result + (waike6 != null ? waike6.hashCode() : 0);
        result = 31 * result + (waike7 != null ? waike7.hashCode() : 0);
        result = 31 * result + (waike8 != null ? waike8.hashCode() : 0);
        result = 31 * result + (waike9 != null ? waike9.hashCode() : 0);
        result = 31 * result + (waike10 != null ? waike10.hashCode() : 0);
        result = 31 * result + (waike11 != null ? waike11.hashCode() : 0);
        result = 31 * result + (waike12 != null ? waike12.hashCode() : 0);
        result = 31 * result + (waikecon != null ? waikecon.hashCode() : 0);
        result = 31 * result + (yanke1 != null ? yanke1.hashCode() : 0);
        result = 31 * result + (yanke2 != null ? yanke2.hashCode() : 0);
        result = 31 * result + (yanke3 != null ? yanke3.hashCode() : 0);
        result = 31 * result + (yanke4 != null ? yanke4.hashCode() : 0);
        result = 31 * result + (yanke5 != null ? yanke5.hashCode() : 0);
        result = 31 * result + (yanke6 != null ? yanke6.hashCode() : 0);
        result = 31 * result + (yanke7 != null ? yanke7.hashCode() : 0);
        result = 31 * result + (yanke8 != null ? yanke8.hashCode() : 0);
        result = 31 * result + (yanke9 != null ? yanke9.hashCode() : 0);
        result = 31 * result + (yanke10 != null ? yanke10.hashCode() : 0);
        result = 31 * result + (yankecon != null ? yankecon.hashCode() : 0);
        result = 31 * result + (er != null ? er.hashCode() : 0);
        result = 31 * result + (bi != null ? bi.hashCode() : 0);
        result = 31 * result + (yan != null ? yan.hashCode() : 0);
        result = 31 * result + (biantaoti != null ? biantaoti.hashCode() : 0);
        result = 31 * result + (hou != null ? hou.hashCode() : 0);
        result = 31 * result + (erbihoucon != null ? erbihoucon.hashCode() : 0);
        result = 31 * result + (oral1 != null ? oral1.hashCode() : 0);
        result = 31 * result + (oral2 != null ? oral2.hashCode() : 0);
        result = 31 * result + (oral3 != null ? oral3.hashCode() : 0);
        result = 31 * result + (oralcon != null ? oralcon.hashCode() : 0);
        result = 31 * result + (ecg1 != null ? ecg1.hashCode() : 0);
        result = 31 * result + (ecg2 != null ? ecg2.hashCode() : 0);
        result = 31 * result + (ecg3 != null ? ecg3.hashCode() : 0);
        result = 31 * result + (ecg4 != null ? ecg4.hashCode() : 0);
        result = 31 * result + (ecgcon != null ? ecgcon.hashCode() : 0);
        result = 31 * result + (bchaocon != null ? bchaocon.hashCode() : 0);
        result = 31 * result + (fangshe1 != null ? fangshe1.hashCode() : 0);
        result = 31 * result + (fangshecon != null ? fangshecon.hashCode() : 0);
        result = 31 * result + (cancer1 != null ? cancer1.hashCode() : 0);
        result = 31 * result + (cancer2 != null ? cancer2.hashCode() : 0);
        result = 31 * result + (cancer3 != null ? cancer3.hashCode() : 0);
        result = 31 * result + (cancer4 != null ? cancer4.hashCode() : 0);
        result = 31 * result + (cancer5 != null ? cancer5.hashCode() : 0);
        result = 31 * result + (cancer6 != null ? cancer6.hashCode() : 0);
        result = 31 * result + (cancercon != null ? cancercon.hashCode() : 0);
        result = 31 * result + (blood1 != null ? blood1.hashCode() : 0);
        result = 31 * result + (blood2 != null ? blood2.hashCode() : 0);
        result = 31 * result + (blood3 != null ? blood3.hashCode() : 0);
        result = 31 * result + (blood4 != null ? blood4.hashCode() : 0);
        result = 31 * result + (blood5 != null ? blood5.hashCode() : 0);
        result = 31 * result + (blood6 != null ? blood6.hashCode() : 0);
        result = 31 * result + (blood7 != null ? blood7.hashCode() : 0);
        result = 31 * result + (blood8 != null ? blood8.hashCode() : 0);
        result = 31 * result + (blood9 != null ? blood9.hashCode() : 0);
        result = 31 * result + (blood10 != null ? blood10.hashCode() : 0);
        result = 31 * result + (blood11 != null ? blood11.hashCode() : 0);
        result = 31 * result + (blood12 != null ? blood12.hashCode() : 0);
        result = 31 * result + (blood13 != null ? blood13.hashCode() : 0);
        result = 31 * result + (blood14 != null ? blood14.hashCode() : 0);
        result = 31 * result + (blood15 != null ? blood15.hashCode() : 0);
        result = 31 * result + (blood16 != null ? blood16.hashCode() : 0);
        result = 31 * result + (blood17 != null ? blood17.hashCode() : 0);
        result = 31 * result + (blood18 != null ? blood18.hashCode() : 0);
        result = 31 * result + (blood19 != null ? blood19.hashCode() : 0);
        result = 31 * result + (bloodcon != null ? bloodcon.hashCode() : 0);
        result = 31 * result + (urine1 != null ? urine1.hashCode() : 0);
        result = 31 * result + (urine2 != null ? urine2.hashCode() : 0);
        result = 31 * result + (urine3 != null ? urine3.hashCode() : 0);
        result = 31 * result + (urine4 != null ? urine4.hashCode() : 0);
        result = 31 * result + (urine5 != null ? urine5.hashCode() : 0);
        result = 31 * result + (urine6 != null ? urine6.hashCode() : 0);
        result = 31 * result + (urine7 != null ? urine7.hashCode() : 0);
        result = 31 * result + (urine8 != null ? urine8.hashCode() : 0);
        result = 31 * result + (urine9 != null ? urine9.hashCode() : 0);
        result = 31 * result + (urine10 != null ? urine10.hashCode() : 0);
        result = 31 * result + (urine11 != null ? urine11.hashCode() : 0);
        result = 31 * result + (urine12 != null ? urine12.hashCode() : 0);
        result = 31 * result + (urine13 != null ? urine13.hashCode() : 0);
        result = 31 * result + (urine14 != null ? urine14.hashCode() : 0);
        result = 31 * result + (urine15 != null ? urine15.hashCode() : 0);
        result = 31 * result + (urine16 != null ? urine16.hashCode() : 0);
        result = 31 * result + (urinecon != null ? urinecon.hashCode() : 0);
        result = 31 * result + (liver1 != null ? liver1.hashCode() : 0);
        result = 31 * result + (liver2 != null ? liver2.hashCode() : 0);
        result = 31 * result + (liver3 != null ? liver3.hashCode() : 0);
        result = 31 * result + (liver4 != null ? liver4.hashCode() : 0);
        result = 31 * result + (liver5 != null ? liver5.hashCode() : 0);
        result = 31 * result + (liver6 != null ? liver6.hashCode() : 0);
        result = 31 * result + (liver7 != null ? liver7.hashCode() : 0);
        result = 31 * result + (liver8 != null ? liver8.hashCode() : 0);
        result = 31 * result + (liver9 != null ? liver9.hashCode() : 0);
        result = 31 * result + (liver10 != null ? liver10.hashCode() : 0);
        result = 31 * result + (liver11 != null ? liver11.hashCode() : 0);
        result = 31 * result + (liver12 != null ? liver12.hashCode() : 0);
        result = 31 * result + (livercon != null ? livercon.hashCode() : 0);
        result = 31 * result + (bloodfat1 != null ? bloodfat1.hashCode() : 0);
        result = 31 * result + (bloodfat2 != null ? bloodfat2.hashCode() : 0);
        result = 31 * result + (bloodfat3 != null ? bloodfat3.hashCode() : 0);
        result = 31 * result + (bloodfat4 != null ? bloodfat4.hashCode() : 0);
        result = 31 * result + (bloodfatcon != null ? bloodfatcon.hashCode() : 0);
        result = 31 * result + (kidney1 != null ? kidney1.hashCode() : 0);
        result = 31 * result + (kidney2 != null ? kidney2.hashCode() : 0);
        result = 31 * result + (kidney3 != null ? kidney3.hashCode() : 0);
        result = 31 * result + (kidneycon != null ? kidneycon.hashCode() : 0);
        result = 31 * result + (xuetang1 != null ? xuetang1.hashCode() : 0);
        result = 31 * result + (xuetangcon != null ? xuetangcon.hashCode() : 0);
        result = 31 * result + (summary != null ? summary.hashCode() : 0);
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
