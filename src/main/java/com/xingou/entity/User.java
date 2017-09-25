package com.xingou.entity;
/*
*类User
*@DATE2017/8/30
*@author viczyf
*
*/
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Set;
@Entity
@Table(name = "user")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy =InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "usertype", discriminatorType = DiscriminatorType.INTEGER)
@DiscriminatorValue(value = "1")
public class User implements Serializable {
    private Integer uid;
    private String uname;
    private String passwd;
    private String email;
    private String phone;
    private String lastlogin;
    private Userinfo userinfo;
    private Set<Examination> Examinations;
    private Set<File> files;
    private Set<Urine> urines;
    private Set<FriendRequest> request_friends;
    private Set<FriendRequest> toreceived_friends;
    private Set<Info> infos;
    private Set<Info24> info24s;
    private Set<Medicalhistory> medicalhistorys;
    private Set<Suggestion> suggestions;
    private Set<User> friends;
    public User(){
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uid")

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "uname")
    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    @Basic
    @Column(name = "passwd")
    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "lastlogin")
    public String getLastlogin() {
        return lastlogin;
    }

    public void setLastlogin(String lastlogin) {
        this.lastlogin = lastlogin;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (uid != user.uid) return false;
//        if (usertype != user.usertype) return false;
        if (uname != null ? !uname.equals(user.uname) : user.uname != null) return false;
        if (passwd != null ? !passwd.equals(user.passwd) : user.passwd != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (phone != null ? !phone.equals(user.phone) : user.phone != null) return false;
        if (lastlogin != null ? !lastlogin.equals(user.lastlogin) : user.lastlogin != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = uid;
        result = 31 * result + (uname != null ? uname.hashCode() : 0);
        result = 31 * result + (passwd != null ? passwd.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (lastlogin != null ? lastlogin.hashCode() : 0);
        return result;
    }

    @OneToOne
    @JoinColumn(name="uid")
    public Userinfo getUserinfo() {
        return userinfo;
    }
    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }

    @OneToMany(mappedBy = "user")
    public Set<Examination> getExaminations() {
        return Examinations;
    }

    public void setExaminations(Set<Examination> examinations) {
        Examinations = examinations;
    }

    @OneToMany(mappedBy = "user")
    public Set<File> getFiles() {
        return files;
    }

    public void setFiles(Set<File> files) {
        this.files = files;
    }
    @OneToMany(mappedBy = "user")
    public Set<Urine> getUrines() {
        return urines;
    }

    public void setUrines(Set<Urine> urines) {
        this.urines = urines;
    }
    @OneToMany(mappedBy = "request_user")
    public Set<FriendRequest> getRequest_friends() {
        return request_friends;
    }
    public void setRequest_friends(Set<FriendRequest> request_friends) {
        this.request_friends = request_friends;
    }

    @OneToMany(mappedBy = "toreceived_user")
    public Set<FriendRequest> getToreceived_friends() {
        return toreceived_friends;
    }

    public void setToreceived_friends(Set<FriendRequest> toreceived_friends) {
        this.toreceived_friends = toreceived_friends;
    }
    @ManyToMany(targetEntity = User.class)
    @JoinTable(name = "user_rela",
            joinColumns = @JoinColumn(name = "uid", referencedColumnName = "uid"),
            inverseJoinColumns = @JoinColumn(name = "reid", referencedColumnName = "uid"))
    public Set<User> getFriends() {
        return friends;
    }

    public void setFriends(Set<User> friends) {
        this.friends = friends;
    }
//,fetch = FetchType.EAGER
//    @OneToMany(mappedBy = "user")
    @OneToMany()
    public Set<Info> getInfos() {
        return infos;
    }

    public void setInfos(Set<Info> infos) {
        this.infos = infos;
    }
    @OneToMany(mappedBy = "user")
    public Set<Info24> getInfo24s() {
        return info24s;
    }

    public void setInfo24s(Set<Info24> info24s) {
        this.info24s = info24s;
    }
    @OneToMany(mappedBy = "user")
    public Set<Medicalhistory> getMedicalhistorys() {
        return medicalhistorys;
    }

    public void setMedicalhistorys(Set<Medicalhistory> medicalhistorys) {
        this.medicalhistorys = medicalhistorys;
    }
    @OneToMany(mappedBy = "user")
    public Set<Suggestion> getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(Set<Suggestion> suggestions) {
        this.suggestions = suggestions;
    }


}
