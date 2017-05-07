package cn.com.charity.finance.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "acct_user", catalog = "gyzf")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class AcctUser implements java.io.Serializable {

    private static final long serialVersionUID = 6980093847795726310L;
    private String id;
    private String nickName;
    private String nickPassword;
    private String conNickPassword;
    private String telephone;
    private String email;
    private Date registerTime;
    private Set<AcctRole> acctRoles = new HashSet<AcctRole>(0);

    //注册时，页面表单映射临时添加org字段，只产生get/set方法，不做库表映射
    private String orgName;
    private String desc;

    @Transient
    public String getOrgName() {
        return orgName;
    }

    @Transient
    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    @Transient
    public String getDesc() {
        return desc;
    }

    @Transient
    public void setDesc(String desc) {
        this.desc = desc;
    }

    public AcctUser() {

    }

    public AcctUser(String id, String nickName) {
        this.id = id;
        this.nickName = nickName;
    }

    public AcctUser(String id, String nickName, String nickPassword,String conNickPassword,String telephone,String email,
                    Date registerTime, Set<AcctRole> acctRoles) {
        this.id = id;
        this.nickName = nickName;
        this.nickPassword = nickPassword;
        this.conNickPassword = conNickPassword;
        this.telephone = telephone;
        this.email = email;
        this.registerTime = registerTime;
        this.acctRoles = acctRoles;
    }

    @Id
    @Column(name = "id", unique = true, nullable = false, length = 36)
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "nick_name", nullable = false)
    public String getNickName() {
        return this.nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    @Column(name = "nick_password")
    public String getNickPassword() {
        return nickPassword;
    }

    public void setNickPassword(String nickPassword) {
        this.nickPassword = nickPassword;
    }

    public String getConNickPassword(){return conNickPassword;}

    public void setConNickPassword(String conNickPassword){this.conNickPassword = conNickPassword;}

    @Column(name = "telephone")
    public String getTelephone() {
        return this.telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Column(name = "email")
    public String getEmail(){return this.email;}

    public void setEmail(String email){this.email = email;}

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "register_time", length = 19)
    public Date getRegisterTime() {
        return this.registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    @JsonIgnoreProperties(value = {"acctUsers", "acctAuthorities"})
    @ManyToMany(fetch = FetchType.LAZY)
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    @JoinTable(name = "acct_user_role", catalog = "gyzf", joinColumns = {
            @JoinColumn(name = "user_id", nullable = false, updatable = false)}, inverseJoinColumns = {
            @JoinColumn(name = "role_id", nullable = false, updatable = false)})
    public Set<AcctRole> getAcctRoles() {
        return this.acctRoles;
    }

    public void setAcctRoles(Set<AcctRole> acctRoles) {
        this.acctRoles = acctRoles;
    }

}