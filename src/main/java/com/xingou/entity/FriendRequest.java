package com.xingou.entity;
/*
*类FriendRequest
*@DATE2017/8/30
*@author viczyf
*/
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "friend_request", schema = "spring_xingou")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class FriendRequest {
    private Integer id;
//    private int uid;
//    private int reid;
    private byte status;
    private String information;
    private User request_user;
    private User toreceived_user;
    public FriendRequest(){

    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    @Basic
//    @Column(name = "uid", nullable = false)
//    public int getUid() {
//        return uid;
//    }
//
//    public void setUid(int uid) {
//        this.uid = uid;
//    }
//
//    @Basic
//    @Column(name = "reid", nullable = false)
//    public int getReid() {
//        return reid;
//    }
//
//    public void setReid(int reid) {
//        this.reid = reid;
//    }

    @Basic
    @Column(name = "status", nullable = false)
    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    @Basic
    @Column(name = "information", nullable = true, length = 100)
    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FriendRequest that = (FriendRequest) o;

        if (id != that.id) return false;
//        if (uid != that.uid) return false;
//        if (reid != that.reid) return false;
        if (status != that.status) return false;
        if (information != null ? !information.equals(that.information) : that.information != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
//        result = 31 * result + uid;
//        result = 31 * result + reid;
        result = 31 * result + (int) status;
        result = 31 * result + (information != null ? information.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "uid", referencedColumnName = "uid", nullable = false)
    public User getRequest_user() {
        return request_user;
    }

    public void setRequest_user(User request_user) {
        this.request_user = request_user;
    }

    @ManyToOne
    @JoinColumn(name = "reid", referencedColumnName = "uid", nullable = false)
    public User getToreceived_user() {
        return toreceived_user;
    }

    public void setToreceived_user(User toreceived_user) {
        this.toreceived_user = toreceived_user;
    }
}
