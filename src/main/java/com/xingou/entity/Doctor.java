package com.xingou.entity;
/*
*类Doctor
*@DATE2017/8/31
*@author viczyf
*
*/

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Columns;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@DiscriminatorValue(value = "2")
public class Doctor extends User implements Serializable {

    private Doctorinfo doctorinfo;
    public Doctor(){

    }
    @OneToOne()
    @JoinColumn(name = "uid")
    public Doctorinfo getDoctorinfo() {
        return doctorinfo;
    }

    public void setDoctorinfo(Doctorinfo doctorinfo) {
        this.doctorinfo = doctorinfo;
    }
}
