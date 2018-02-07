package com.xingou.entity;

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

/*
 * Created by viczyf on 2017/11/27.
 */
@Entity
@Table(name = "temperature", schema = "spring_xingou")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Temperature {
    private Integer id;
    private String date;
    private float temp;
    private User user;

    public Temperature() {

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
    @Column(name = "temp", nullable = false, length = 10)
    public float getTemp() {
        return temp;
    }

    public void setTemp(float temp) {
        this.temp = temp;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Temperature that = (Temperature) o;

        if (Float.compare(that.temp, temp) != 0) return false;
        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        return date != null ? date.equals(that.date) : that.date == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (temp != +0.0f ? Float.floatToIntBits(temp) : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "uid", referencedColumnName = "uid", nullable = false)
    public User getUser(){
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}

