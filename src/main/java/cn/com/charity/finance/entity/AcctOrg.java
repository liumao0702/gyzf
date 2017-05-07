package cn.com.charity.finance.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "acct_org",catalog = "gyzf")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class AcctOrg implements java.io.Serializable{

    private String id;//id
    private String name;//组织名称
    private String desc;//组织介绍
    private Date createTime; //创建时间
    private String createAcctName;//创建者名称
    private Date lastModifyTime;//最后修改时间
    private String operator;//操作者

    @Id
    @Column(name = "id", unique = true, nullable = false, length = 36)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "org_name", nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "desc",nullable = true)
    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time",nullable = false)
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name="create_acc_name",nullable = false)
    public String getCreateAcctName() {
        return createAcctName;
    }

    public void setCreateAcctName(String createAcctName) {
        this.createAcctName = createAcctName;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="last_modify_time",nullable = false)
    public Date getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
    }

    @Column(name = "operator",nullable = false)
    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}
