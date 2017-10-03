package com.xingou.entity;
/*
*类Doctor
*@DATE2017/8/31
*@author viczyf
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
    private Set<User> patients;
    public Doctor(){
    }
    @OneToOne(targetEntity = Doctorinfo.class,mappedBy = "doctor")
//    @JoinColumn(name = "uid")
//    @PrimaryKeyJoinColumn
    public Doctorinfo getDoctorinfo() {
        return doctorinfo;
    }
    public void setDoctorinfo(Doctorinfo doctorinfo) {
        this.doctorinfo = doctorinfo;
    }
    @ManyToMany(targetEntity = Doctor.class)
    @JoinTable(name = "doctor_user",
            joinColumns = @JoinColumn(name = "doctorid", referencedColumnName = "uid"),
            inverseJoinColumns = @JoinColumn(name = "uid", referencedColumnName = "uid"))
    public Set<User> getPatients() {
        return patients;
    }

    public void setPatients(Set<User> patients) {
        this.patients = patients;
    }
}
