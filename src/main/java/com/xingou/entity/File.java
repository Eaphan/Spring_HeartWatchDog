package com.xingou.entity;/*
*类File
*@DATE2017/8/30
*@author viczyf
*
*/

import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "file")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class File {
    private Integer id;
    private String fileaddr;
    private String filedate;
    private String fileinfo;
    private User user;
    public File() {

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

    @Basic
    @Column(name = "fileaddr", nullable = false, length = 30)
    public String getFileaddr() {
        return fileaddr;
    }

    public void setFileaddr(String fileaddr) {
        this.fileaddr = fileaddr;
    }

    @Basic
    @Column(name = "filedate", nullable = false, length = 20)
    public String getFiledate() {
        return filedate;
    }

    public void setFiledate(String filedate) {
        this.filedate = filedate;
    }

    @Basic
    @Column(name = "fileinfo", nullable = true, length = -1)
    public String getFileinfo() {
        return fileinfo;
    }

    public void setFileinfo(String fileinfo) {
        this.fileinfo = fileinfo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        File file = (File) o;

        if (fileaddr != null ? !fileaddr.equals(file.fileaddr) : file.fileaddr != null) return false;
        if (filedate != null ? !filedate.equals(file.filedate) : file.filedate != null) return false;
        if (fileinfo != null ? !fileinfo.equals(file.fileinfo) : file.fileinfo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (fileaddr != null ? fileaddr.hashCode() : 0);
        result = 31 * result + (filedate != null ? filedate.hashCode() : 0);
        result = 31 * result + (fileinfo != null ? fileinfo.hashCode() : 0);
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
