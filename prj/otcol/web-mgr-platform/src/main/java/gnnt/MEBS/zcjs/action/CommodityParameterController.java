package gnnt.MEBS.zcjs.action;

import gnnt.MEBS.base.copy.ParamUtil;
import gnnt.MEBS.base.query.PageInfo;
import gnnt.MEBS.base.query.QueryConditions;
import gnnt.MEBS.base.query.QueryHelper;
import gnnt.MEBS.zcjs.model.CommodityParameter;
import gnnt.MEBS.zcjs.services.CommodityParameterService;
import gnnt.MEBS.zcjs.util.SysData;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;

public class CommodityParameterController
  extends BaseController
{
  private final transient Log logger = LogFactory.getLog(CommodityParameterController.class);
  
  private CommodityParameterService getBeanOfCommodityParameterService()
  {
    CommodityParameterService localCommodityParameterService = null;
    synchronized (CommodityParameterService.class)
    {
      if (localCommodityParameterService == null) {
        localCommodityParameterService = (CommodityParameterService)SysData.getBean("z_commodityParameterService");
      }
    }
    return localCommodityParameterService;
  }
  
  public ModelAndView list(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
    throws Exception
  {
    this.logger.debug("enter list========");
    QueryConditions localQueryConditions = QueryHelper.getQueryConditionsFromRequest(paramHttpServletRequest);
    PageInfo localPageInfo = QueryHelper.getPageInfoFromRequest(paramHttpServletRequest);
    if (localPageInfo == null) {
      localPageInfo = new PageInfo(1, Condition.PAGESIZE, "parameterId", false);
    }
    List localList = getBeanOfCommodityParameterService().getTableList(localQueryConditions, localPageInfo);
    Map localMap = QueryHelper.getMapFromRequest(paramHttpServletRequest);
    ModelAndView localModelAndView = new ModelAndView(Condition.PATH + "commodityParameter/commodityParameterList");
    localModelAndView.addObject("resultList", localList);
    localModelAndView.addObject("pageInfo", localPageInfo);
    localModelAndView.addObject("oldParams", localMap);
    return localModelAndView;
  }
  
  public ModelAndView mod(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
    throws Exception
  {
    this.logger.debug("enter mod========");
    String str1 = paramHttpServletRequest.getParameter("type");
    CommodityParameter localCommodityParameter1 = new CommodityParameter();
    ParamUtil.bindData(paramHttpServletRequest, localCommodityParameter1);
    String[] arrayOfString1 = paramHttpServletRequest.getParameterValues("delCheck");
    ArrayList localArrayList = new ArrayList();
    int i = 1;
    int j = Integer.parseInt(str1);
    StringBuffer localStringBuffer = new StringBuffer();
    for (String str2 : arrayOfString1)
    {
      String[] arrayOfString3 = str2.split(",");
      CommodityParameter localCommodityParameter2 = getBeanOfCommodityParameterService().getObjectById(Long.parseLong(arrayOfString3[0]));
      if (j == localCommodityParameter2.getParameterStatus()) {
        localStringBuffer.append(arrayOfString3[0] + ",");
      } else {
        localArrayList.add(Long.valueOf(Long.parseLong(arrayOfString3[0])));
      }
    }
    if (localStringBuffer.length() > 0) {
      localStringBuffer.append("无需修改！");
    }
    if (localArrayList.size() > 0)
    {
      for (int k = 0; k < localArrayList.size(); k++) {
        localStringBuffer.append(localArrayList.get(k) + ",");
      }
      try
      {
        getBeanOfCommodityParameterService().update(localArrayList, str1);
        localStringBuffer.append("修改成功！");
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        localStringBuffer.append("修改失败！");
      }
    }
    setResultMsg(paramHttpServletRequest, localStringBuffer.toString());
    return new ModelAndView("redirect:" + Condition.PATH + "commodityParameterController.zcjs?funcflg=list");
  }
  
  public ModelAndView listReturn(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
    throws Exception
  {
    return new ModelAndView("redirect:" + Condition.PATH + "commodityParameterController.zcjs?funcflg=list");
  }
}
