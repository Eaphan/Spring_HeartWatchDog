package com.xingou.entity;/*
*类Userinfo
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
@Table(name = "userinfo")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Userinfo {
    private Integer id;
//    private Integer uid;
    private String height;
    private String weight;
    private String gender;
    private String age;
    private String iden;
    private String addr;
    private String nationality;
    private String company;
    private String edu;
    private String job;
    private String marry;
    private String bloodtype;
    private String selfevaluate;
    private String mentality;
    private String allergy;
    private String desease1;
    private String desease2;
    private String desease3;
    private String deseasemore;
    private String dtime1;
    private String dtime2;
    private String dtime3;
    private String operation1;
    private String operation2;
    private String operation3;
    private String operationmore;
    private String otime1;
    private String otime2;
    private String otime3;
    private String f1Desease;
    private String f2Desease;
    private String f3Desease;
    private String f4Desease;
    private String inheridesease;
    private String exefre;
    private String exeway;
    private String exetime;
    private String eathabit;
    private String smokestatus;
    private String smokeamount;
    private String isdrink;
    private String drinkamount;
    private String drinkfre;
    private String sleepstatus;
    private String sleeptime;
    private String jobmaterial;
    private String isjobprotect;
    private User user;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    @Basic
//    @Column(name = "uid", nullable = false)
//    public Integer getUid() {
//        return uid;
//    }
//
//    public void setUid(Integer uid) {
//        this.uid = uid;
//    }

    @Basic
    @Column(name = "height", nullable = true, length = 10)
    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    @Basic
    @Column(name = "weight", nullable = true, length = 10)
    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
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
    @Column(name = "age", nullable = true, length = 10)
    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    @Basic
    @Column(name = "iden", nullable = true, length = 18)
    public String getIden() {
        return iden;
    }

    public void setIden(String iden) {
        this.iden = iden;
    }

    @Basic
    @Column(name = "addr", nullable = true, length = 45)
    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    @Basic
    @Column(name = "nationality", nullable = true, length = 5)
    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    @Basic
    @Column(name = "company", nullable = true, length = 30)
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Basic
    @Column(name = "edu", nullable = true, length = 10)
    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    @Basic
    @Column(name = "job", nullable = true, length = 25)
    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Basic
    @Column(name = "marry", nullable = true, length = 5)
    public String getMarry() {
        return marry;
    }

    public void setMarry(String marry) {
        this.marry = marry;
    }

    @Basic
    @Column(name = "bloodtype", nullable = true, length = 5)
    public String getBloodtype() {
        return bloodtype;
    }

    public void setBloodtype(String bloodtype) {
        this.bloodtype = bloodtype;
    }

    @Basic
    @Column(name = "selfevaluate", nullable = true, length = 5)
    public String getSelfevaluate() {
        return selfevaluate;
    }

    public void setSelfevaluate(String selfevaluate) {
        this.selfevaluate = selfevaluate;
    }

    @Basic
    @Column(name = "mentality", nullable = true, length = 3)
    public String getMentality() {
        return mentality;
    }

    public void setMentality(String mentality) {
        this.mentality = mentality;
    }

    @Basic
    @Column(name = "allergy", nullable = true, length = 20)
    public String getAllergy() {
        return allergy;
    }

    public void setAllergy(String allergy) {
        this.allergy = allergy;
    }

    @Basic
    @Column(name = "desease1", nullable = true, length = 15)
    public String getDesease1() {
        return desease1;
    }

    public void setDesease1(String desease1) {
        this.desease1 = desease1;
    }

    @Basic
    @Column(name = "desease2", nullable = true, length = 15)
    public String getDesease2() {
        return desease2;
    }

    public void setDesease2(String desease2) {
        this.desease2 = desease2;
    }

    @Basic
    @Column(name = "desease3", nullable = true, length = 15)
    public String getDesease3() {
        return desease3;
    }

    public void setDesease3(String desease3) {
        this.desease3 = desease3;
    }

    @Basic
    @Column(name = "deseasemore", nullable = true, length = 200)
    public String getDeseasemore() {
        return deseasemore;
    }

    public void setDeseasemore(String deseasemore) {
        this.deseasemore = deseasemore;
    }

    @Basic
    @Column(name = "dtime1", nullable = true, length = 20)
    public String getDtime1() {
        return dtime1;
    }

    public void setDtime1(String dtime1) {
        this.dtime1 = dtime1;
    }

    @Basic
    @Column(name = "dtime2", nullable = true, length = 20)
    public String getDtime2() {
        return dtime2;
    }

    public void setDtime2(String dtime2) {
        this.dtime2 = dtime2;
    }

    @Basic
    @Column(name = "dtime3", nullable = true, length = 20)
    public String getDtime3() {
        return dtime3;
    }

    public void setDtime3(String dtime3) {
        this.dtime3 = dtime3;
    }

    @Basic
    @Column(name = "operation1", nullable = true, length = 30)
    public String getOperation1() {
        return operation1;
    }

    public void setOperation1(String operation1) {
        this.operation1 = operation1;
    }

    @Basic
    @Column(name = "operation2", nullable = true, length = 30)
    public String getOperation2() {
        return operation2;
    }

    public void setOperation2(String operation2) {
        this.operation2 = operation2;
    }

    @Basic
    @Column(name = "operation3", nullable = true, length = 30)
    public String getOperation3() {
        return operation3;
    }

    public void setOperation3(String operation3) {
        this.operation3 = operation3;
    }

    @Basic
    @Column(name = "operationmore", nullable = true, length = 200)
    public String getOperationmore() {
        return operationmore;
    }

    public void setOperationmore(String operationmore) {
        this.operationmore = operationmore;
    }

    @Basic
    @Column(name = "otime1", nullable = true, length = 20)
    public String getOtime1() {
        return otime1;
    }

    public void setOtime1(String otime1) {
        this.otime1 = otime1;
    }

    @Basic
    @Column(name = "otime2", nullable = true, length = 20)
    public String getOtime2() {
        return otime2;
    }

    public void setOtime2(String otime2) {
        this.otime2 = otime2;
    }

    @Basic
    @Column(name = "otime3", nullable = true, length = 20)
    public String getOtime3() {
        return otime3;
    }

    public void setOtime3(String otime3) {
        this.otime3 = otime3;
    }

    @Basic
    @Column(name = "f1desease", nullable = true, length = 30)
    public String getF1Desease() {
        return f1Desease;
    }

    public void setF1Desease(String f1Desease) {
        this.f1Desease = f1Desease;
    }

    @Basic
    @Column(name = "f2desease", nullable = true, length = 30)
    public String getF2Desease() {
        return f2Desease;
    }

    public void setF2Desease(String f2Desease) {
        this.f2Desease = f2Desease;
    }

    @Basic
    @Column(name = "f3desease", nullable = true, length = 30)
    public String getF3Desease() {
        return f3Desease;
    }

    public void setF3Desease(String f3Desease) {
        this.f3Desease = f3Desease;
    }

    @Basic
    @Column(name = "f4desease", nullable = true, length = 30)
    public String getF4Desease() {
        return f4Desease;
    }

    public void setF4Desease(String f4Desease) {
        this.f4Desease = f4Desease;
    }

    @Basic
    @Column(name = "inheridesease", nullable = true, length = 30)
    public String getInheridesease() {
        return inheridesease;
    }

    public void setInheridesease(String inheridesease) {
        this.inheridesease = inheridesease;
    }

    @Basic
    @Column(name = "exefre", nullable = true, length = 7)
    public String getExefre() {
        return exefre;
    }

    public void setExefre(String exefre) {
        this.exefre = exefre;
    }

    @Basic
    @Column(name = "exeway", nullable = true, length = 10)
    public String getExeway() {
        return exeway;
    }

    public void setExeway(String exeway) {
        this.exeway = exeway;
    }

    @Basic
    @Column(name = "exetime", nullable = true, length = 5)
    public String getExetime() {
        return exetime;
    }

    public void setExetime(String exetime) {
        this.exetime = exetime;
    }

    @Basic
    @Column(name = "eathabit", nullable = true, length = 6)
    public String getEathabit() {
        return eathabit;
    }

    public void setEathabit(String eathabit) {
        this.eathabit = eathabit;
    }

    @Basic
    @Column(name = "smokestatus", nullable = true, length = 5)
    public String getSmokestatus() {
        return smokestatus;
    }

    public void setSmokestatus(String smokestatus) {
        this.smokestatus = smokestatus;
    }

    @Basic
    @Column(name = "smokeamount", nullable = true, length = 5)
    public String getSmokeamount() {
        return smokeamount;
    }

    public void setSmokeamount(String smokeamount) {
        this.smokeamount = smokeamount;
    }

    @Basic
    @Column(name = "isdrink", nullable = true, length = 5)
    public String getIsdrink() {
        return isdrink;
    }

    public void setIsdrink(String isdrink) {
        this.isdrink = isdrink;
    }

    @Basic
    @Column(name = "drinkamount", nullable = true, length = 5)
    public String getDrinkamount() {
        return drinkamount;
    }

    public void setDrinkamount(String drinkamount) {
        this.drinkamount = drinkamount;
    }

    @Basic
    @Column(name = "drinkfre", nullable = true, length = 5)
    public String getDrinkfre() {
        return drinkfre;
    }

    public void setDrinkfre(String drinkfre) {
        this.drinkfre = drinkfre;
    }

    @Basic
    @Column(name = "sleepstatus", nullable = true, length = 5)
    public String getSleepstatus() {
        return sleepstatus;
    }

    public void setSleepstatus(String sleepstatus) {
        this.sleepstatus = sleepstatus;
    }

    @Basic
    @Column(name = "sleeptime", nullable = true, length = 5)
    public String getSleeptime() {
        return sleeptime;
    }

    public void setSleeptime(String sleeptime) {
        this.sleeptime = sleeptime;
    }

    @Basic
    @Column(name = "jobmaterial", nullable = true, length = 5)
    public String getJobmaterial() {
        return jobmaterial;
    }

    public void setJobmaterial(String jobmaterial) {
        this.jobmaterial = jobmaterial;
    }

    @Basic
    @Column(name = "isjobprotect", nullable = true, length = 5)
    public String getIsjobprotect() {
        return isjobprotect;
    }

    public void setIsjobprotect(String isjobprotect) {
        this.isjobprotect = isjobprotect;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Userinfo userinfo = (Userinfo) o;

        if (id != userinfo.id) return false;
        if (height != null ? !height.equals(userinfo.height) : userinfo.height != null) return false;
        if (weight != null ? !weight.equals(userinfo.weight) : userinfo.weight != null) return false;
        if (gender != null ? !gender.equals(userinfo.gender) : userinfo.gender != null) return false;
        if (age != null ? !age.equals(userinfo.age) : userinfo.age != null) return false;
        if (iden != null ? !iden.equals(userinfo.iden) : userinfo.iden != null) return false;
        if (addr != null ? !addr.equals(userinfo.addr) : userinfo.addr != null) return false;
        if (nationality != null ? !nationality.equals(userinfo.nationality) : userinfo.nationality != null)
            return false;
        if (company != null ? !company.equals(userinfo.company) : userinfo.company != null) return false;
        if (edu != null ? !edu.equals(userinfo.edu) : userinfo.edu != null) return false;
        if (job != null ? !job.equals(userinfo.job) : userinfo.job != null) return false;
        if (marry != null ? !marry.equals(userinfo.marry) : userinfo.marry != null) return false;
        if (bloodtype != null ? !bloodtype.equals(userinfo.bloodtype) : userinfo.bloodtype != null) return false;
        if (selfevaluate != null ? !selfevaluate.equals(userinfo.selfevaluate) : userinfo.selfevaluate != null)
            return false;
        if (mentality != null ? !mentality.equals(userinfo.mentality) : userinfo.mentality != null) return false;
        if (allergy != null ? !allergy.equals(userinfo.allergy) : userinfo.allergy != null) return false;
        if (desease1 != null ? !desease1.equals(userinfo.desease1) : userinfo.desease1 != null) return false;
        if (desease2 != null ? !desease2.equals(userinfo.desease2) : userinfo.desease2 != null) return false;
        if (desease3 != null ? !desease3.equals(userinfo.desease3) : userinfo.desease3 != null) return false;
        if (deseasemore != null ? !deseasemore.equals(userinfo.deseasemore) : userinfo.deseasemore != null)
            return false;
        if (dtime1 != null ? !dtime1.equals(userinfo.dtime1) : userinfo.dtime1 != null) return false;
        if (dtime2 != null ? !dtime2.equals(userinfo.dtime2) : userinfo.dtime2 != null) return false;
        if (dtime3 != null ? !dtime3.equals(userinfo.dtime3) : userinfo.dtime3 != null) return false;
        if (operation1 != null ? !operation1.equals(userinfo.operation1) : userinfo.operation1 != null) return false;
        if (operation2 != null ? !operation2.equals(userinfo.operation2) : userinfo.operation2 != null) return false;
        if (operation3 != null ? !operation3.equals(userinfo.operation3) : userinfo.operation3 != null) return false;
        if (operationmore != null ? !operationmore.equals(userinfo.operationmore) : userinfo.operationmore != null)
            return false;
        if (otime1 != null ? !otime1.equals(userinfo.otime1) : userinfo.otime1 != null) return false;
        if (otime2 != null ? !otime2.equals(userinfo.otime2) : userinfo.otime2 != null) return false;
        if (otime3 != null ? !otime3.equals(userinfo.otime3) : userinfo.otime3 != null) return false;
        if (f1Desease != null ? !f1Desease.equals(userinfo.f1Desease) : userinfo.f1Desease != null) return false;
        if (f2Desease != null ? !f2Desease.equals(userinfo.f2Desease) : userinfo.f2Desease != null) return false;
        if (f3Desease != null ? !f3Desease.equals(userinfo.f3Desease) : userinfo.f3Desease != null) return false;
        if (f4Desease != null ? !f4Desease.equals(userinfo.f4Desease) : userinfo.f4Desease != null) return false;
        if (inheridesease != null ? !inheridesease.equals(userinfo.inheridesease) : userinfo.inheridesease != null)
            return false;
        if (exefre != null ? !exefre.equals(userinfo.exefre) : userinfo.exefre != null) return false;
        if (exeway != null ? !exeway.equals(userinfo.exeway) : userinfo.exeway != null) return false;
        if (exetime != null ? !exetime.equals(userinfo.exetime) : userinfo.exetime != null) return false;
        if (eathabit != null ? !eathabit.equals(userinfo.eathabit) : userinfo.eathabit != null) return false;
        if (smokestatus != null ? !smokestatus.equals(userinfo.smokestatus) : userinfo.smokestatus != null)
            return false;
        if (smokeamount != null ? !smokeamount.equals(userinfo.smokeamount) : userinfo.smokeamount != null)
            return false;
        if (isdrink != null ? !isdrink.equals(userinfo.isdrink) : userinfo.isdrink != null) return false;
        if (drinkamount != null ? !drinkamount.equals(userinfo.drinkamount) : userinfo.drinkamount != null)
            return false;
        if (drinkfre != null ? !drinkfre.equals(userinfo.drinkfre) : userinfo.drinkfre != null) return false;
        if (sleepstatus != null ? !sleepstatus.equals(userinfo.sleepstatus) : userinfo.sleepstatus != null)
            return false;
        if (sleeptime != null ? !sleeptime.equals(userinfo.sleeptime) : userinfo.sleeptime != null) return false;
        if (jobmaterial != null ? !jobmaterial.equals(userinfo.jobmaterial) : userinfo.jobmaterial != null)
            return false;
        if (isjobprotect != null ? !isjobprotect.equals(userinfo.isjobprotect) : userinfo.isjobprotect != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (height != null ? height.hashCode() : 0);
        result = 31 * result + (weight != null ? weight.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        result = 31 * result + (iden != null ? iden.hashCode() : 0);
        result = 31 * result + (addr != null ? addr.hashCode() : 0);
        result = 31 * result + (nationality != null ? nationality.hashCode() : 0);
        result = 31 * result + (company != null ? company.hashCode() : 0);
        result = 31 * result + (edu != null ? edu.hashCode() : 0);
        result = 31 * result + (job != null ? job.hashCode() : 0);
        result = 31 * result + (marry != null ? marry.hashCode() : 0);
        result = 31 * result + (bloodtype != null ? bloodtype.hashCode() : 0);
        result = 31 * result + (selfevaluate != null ? selfevaluate.hashCode() : 0);
        result = 31 * result + (mentality != null ? mentality.hashCode() : 0);
        result = 31 * result + (allergy != null ? allergy.hashCode() : 0);
        result = 31 * result + (desease1 != null ? desease1.hashCode() : 0);
        result = 31 * result + (desease2 != null ? desease2.hashCode() : 0);
        result = 31 * result + (desease3 != null ? desease3.hashCode() : 0);
        result = 31 * result + (deseasemore != null ? deseasemore.hashCode() : 0);
        result = 31 * result + (dtime1 != null ? dtime1.hashCode() : 0);
        result = 31 * result + (dtime2 != null ? dtime2.hashCode() : 0);
        result = 31 * result + (dtime3 != null ? dtime3.hashCode() : 0);
        result = 31 * result + (operation1 != null ? operation1.hashCode() : 0);
        result = 31 * result + (operation2 != null ? operation2.hashCode() : 0);
        result = 31 * result + (operation3 != null ? operation3.hashCode() : 0);
        result = 31 * result + (operationmore != null ? operationmore.hashCode() : 0);
        result = 31 * result + (otime1 != null ? otime1.hashCode() : 0);
        result = 31 * result + (otime2 != null ? otime2.hashCode() : 0);
        result = 31 * result + (otime3 != null ? otime3.hashCode() : 0);
        result = 31 * result + (f1Desease != null ? f1Desease.hashCode() : 0);
        result = 31 * result + (f2Desease != null ? f2Desease.hashCode() : 0);
        result = 31 * result + (f3Desease != null ? f3Desease.hashCode() : 0);
        result = 31 * result + (f4Desease != null ? f4Desease.hashCode() : 0);
        result = 31 * result + (inheridesease != null ? inheridesease.hashCode() : 0);
        result = 31 * result + (exefre != null ? exefre.hashCode() : 0);
        result = 31 * result + (exeway != null ? exeway.hashCode() : 0);
        result = 31 * result + (exetime != null ? exetime.hashCode() : 0);
        result = 31 * result + (eathabit != null ? eathabit.hashCode() : 0);
        result = 31 * result + (smokestatus != null ? smokestatus.hashCode() : 0);
        result = 31 * result + (smokeamount != null ? smokeamount.hashCode() : 0);
        result = 31 * result + (isdrink != null ? isdrink.hashCode() : 0);
        result = 31 * result + (drinkamount != null ? drinkamount.hashCode() : 0);
        result = 31 * result + (drinkfre != null ? drinkfre.hashCode() : 0);
        result = 31 * result + (sleepstatus != null ? sleepstatus.hashCode() : 0);
        result = 31 * result + (sleeptime != null ? sleeptime.hashCode() : 0);
        result = 31 * result + (jobmaterial != null ? jobmaterial.hashCode() : 0);
        result = 31 * result + (isjobprotect != null ? isjobprotect.hashCode() : 0);
        return result;
    }

    @OneToOne
    @JoinColumn(name = "uid", referencedColumnName = "uid", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
