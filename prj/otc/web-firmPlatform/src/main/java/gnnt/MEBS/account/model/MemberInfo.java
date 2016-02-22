package gnnt.MEBS.account.model;

import gnnt.MEBS.base.model.Clone;
import gnnt.MEBS.base.model.inner.ClassDiscription;
import gnnt.MEBS.base.model.inner.ClassStatus;
import java.util.Date;

public class MemberInfo
  extends Clone
{
  private String id;
  private String signNo;
  private String name;
  private String memberType;
  private Integer papersType;
  private String papersName;
  private String address;
  private String phone;
  private String fax;
  private String postCode;
  private String email;
  private String specialMemberNos;
  private String extendData;
  private Date createTime;
  private String password;
  
  public MemberInfo() {}
  
  public MemberInfo(String id, String name)
  {
    this.id = id;
    this.name = name;
  }
  
  public String getPassword()
  {
    return this.password;
  }
  
  public void setPassword(String password)
  {
    this.password = password;
  }
  
  public Date getCreateTime()
  {
    return this.createTime;
  }
  
  public void setCreateTime(Date createTime)
  {
    this.createTime = createTime;
  }
  
  @ClassDiscription(name="会员编号", key=true, keyWord=true)
  public String getId()
  {
    return this.id;
  }
  
  public void setId(String id)
  {
    this.id = id;
  }
  
  @ClassDiscription(name="签约账户")
  public String getSignNo()
  {
    return this.signNo;
  }
  
  public void setSignNo(String signNo)
  {
    this.signNo = signNo;
  }
  
  @ClassDiscription(name="会员名称", keyWord=true)
  public String getName()
  {
    return this.name;
  }
  
  public void setName(String name)
  {
    this.name = name;
  }
  
  @ClassDiscription(name="会员类型", isStatus=true)
  @ClassStatus(status={@gnnt.MEBS.base.model.inner.StatusDiscription(key="B", value="经纪会员"), @gnnt.MEBS.base.model.inner.StatusDiscription(key="C", value="综合会员")})
  public String getMemberType()
  {
    return this.memberType;
  }
  
  public void setMemberType(String memberType)
  {
    this.memberType = memberType;
  }
  
  @ClassDiscription(name="证件类型", isStatus=true)
  @ClassStatus(status={@gnnt.MEBS.base.model.inner.StatusDiscription(key="1", value="机构代码"), @gnnt.MEBS.base.model.inner.StatusDiscription(key="2", value="营业执照")})
  public Integer getPapersType()
  {
    return this.papersType;
  }
  
  public void setPapersType(Integer papersType)
  {
    this.papersType = papersType;
  }
  
  @ClassDiscription(name="地址")
  public String getAddress()
  {
    return this.address;
  }
  
  public void setAddress(String address)
  {
    this.address = address;
  }
  
  @ClassDiscription(name="电话")
  public String getPhone()
  {
    return this.phone;
  }
  
  public void setPhone(String phone)
  {
    this.phone = phone;
  }
  
  @ClassDiscription(name="传真")
  public String getFax()
  {
    return this.fax;
  }
  
  public void setFax(String fax)
  {
    this.fax = fax;
  }
  
  @ClassDiscription(name="邮编")
  public String getPostCode()
  {
    return this.postCode;
  }
  
  public void setPostCode(String postCode)
  {
    this.postCode = postCode;
  }
  
  @ClassDiscription(name="电子邮箱")
  public String getEmail()
  {
    return this.email;
  }
  
  public void setEmail(String email)
  {
    this.email = email;
  }
  
  public String getExtendData()
  {
    return this.extendData;
  }
  
  public void setExtendData(String extendData)
  {
    this.extendData = extendData;
  }
  
  @ClassDiscription(name="证件号码")
  public String getPapersName()
  {
    return this.papersName;
  }
  
  public void setPapersName(String papersName)
  {
    this.papersName = papersName;
  }
  
  public void setPrimary(String primary)
  {
    this.id = primary;
  }
  
  @ClassDiscription(name="会员转单分配的特别会员Id")
  public String getSpecialMemberNos()
  {
    return this.specialMemberNos;
  }
  
  public void setSpecialMemberNos(String specialMemberNos)
  {
    this.specialMemberNos = specialMemberNos;
  }
  
  public String getMemberNo()
  {
    return this.id;
  }
}