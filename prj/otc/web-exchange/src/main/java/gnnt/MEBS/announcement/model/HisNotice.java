package gnnt.MEBS.announcement.model;

import gnnt.MEBS.base.model.Clone;
import java.util.Date;
import org.springframework.web.util.HtmlUtils;

public class HisNotice
  extends Clone
{
  private Long id;
  private String status;
  private Long okoticeId;
  private String title;
  private String content;
  private String noticeType;
  
  public HisNotice() {}
  
  public HisNotice(Long id, Long okoticeId, String author, String title, Date sendTime)
  {
    this.id = id;
    this.okoticeId = okoticeId;
    this.title = title;
    this.author = author;
    this.sendTime = sendTime;
  }
  
  private Integer sendType = Integer.valueOf(1);
  private String recipientRules;
  private Date createTime = new Date();
  private String author;
  private String Source;
  private String publishOrganization;
  private Date sendTime;
  private Date expiryTime;
  private Date clearDate;
  
  public String getPublishOrganization()
  {
    return this.publishOrganization;
  }
  
  public void setPublishOrganization(String publishOrganization)
  {
    this.publishOrganization = publishOrganization;
  }
  
  public String getStatus()
  {
    return this.status;
  }
  
  public void setStatus(String status)
  {
    this.status = status;
  }
  
  public Long getOkoticeId()
  {
    return this.okoticeId;
  }
  
  public void setOkoticeId(Long okoticeId)
  {
    this.okoticeId = okoticeId;
  }
  
  public Long getId()
  {
    return this.id;
  }
  
  public void setId(Long id)
  {
    this.id = id;
  }
  
  public String getTitle()
  {
    return this.title;
  }
  
  public void setTitle(String title)
  {
    this.title = title;
  }
  
  public String getContent()
  {
    return this.content;
  }
  
  public void setContent(String content)
  {
    this.content = content;
  }
  
  public String getNoticeType()
  {
    return this.noticeType;
  }
  
  public void setNoticeType(String noticeType)
  {
    this.noticeType = noticeType;
  }
  
  public Integer getSendType()
  {
    return this.sendType;
  }
  
  public void setSendType(Integer sendType)
  {
    this.sendType = sendType;
  }
  
  public String getRecipientRules()
  {
    return this.recipientRules;
  }
  
  public void setRecipientRules(String recipientRules)
  {
    this.recipientRules = recipientRules;
  }
  
  public Date getCreateTime()
  {
    return this.createTime;
  }
  
  public void setCreateTime(Date createTime)
  {
    this.createTime = createTime;
  }
  
  public String getAuthor()
  {
    return this.author;
  }
  
  public void setAuthor(String author)
  {
    this.author = author;
  }
  
  public Date getSendTime()
  {
    return this.sendTime;
  }
  
  public void setSendTime(Date sendTime)
  {
    this.sendTime = sendTime;
  }
  
  public Date getExpiryTime()
  {
    return transformData(this.expiryTime);
  }
  
  public void setExpiryTime(Date expiryTime)
  {
    this.expiryTime = expiryTime;
  }
  
  public Date getClearDate()
  {
    return this.clearDate;
  }
  
  public void setClearDate(Date clearDate)
  {
    this.clearDate = clearDate;
  }
  
  public String getSource()
  {
    return this.Source;
  }
  
  public void setSource(String source)
  {
    this.Source = source;
  }
  
  public String getContentBr()
  {
    return this.content.replaceAll("\r", "<br>").replaceAll(" ", "&nbsp;");
  }
  
  public String getTitleHtml()
  {
    return HtmlUtils.htmlEscape(this.title);
  }
  
  public String getContentHtml()
  {
    return HtmlUtils.htmlEscape(this.content);
  }
  
  public void setPrimary(String primary)
  {
    this.id = Long.valueOf(Long.parseLong(primary));
  }
}
