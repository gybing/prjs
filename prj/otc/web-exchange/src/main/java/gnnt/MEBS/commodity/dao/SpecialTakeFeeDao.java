package gnnt.MEBS.commodity.dao;

import gnnt.MEBS.base.query.hibernate.PageInfo;
import gnnt.MEBS.base.query.hibernate.QueryConditions;
import gnnt.MEBS.commodity.model.TakeFee;
import gnnt.MEBS.packaging.dao.BaseDao;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

@Repository("specialTakeFeeDao")
public class SpecialTakeFeeDao
  extends BaseDao<TakeFee>
{
  private final transient Log logger = LogFactory.getLog(SpecialTakeFeeDao.class);
  
  public Class getEntityClass()
  {
    return new TakeFee().getClass();
  }
  
  public List<TakeFee> getList(QueryConditions conditions, PageInfo pageInfo)
  {
    String hql = "select new TakeFee(primary.commodityId,primary.m_FirmId,commodity.name,specialMember.name,primary.feeAlgr,primary.feeRate,primary.feeMode,primary.mkt_FeeRate) from TakeFee as primary,SpecialMember as specialMember,Commodity as commodity where primary.commodityId=commodity.id and primary.m_FirmId=specialMember.s_memberNo";
    

    Object[] values = (Object[])null;
    String[] names = (String[])null;
    if ((conditions != null) && (conditions.getFieldsSqlClause() != null))
    {
      values = conditions.getValueArray();
      names = conditions.getNameArray();
      hql = hql + " and " + conditions.getFieldsSqlClause();
    }
    this.logger.debug("hql:" + hql);
    return queryByHQL(hql, names, values, pageInfo, null);
  }
}
