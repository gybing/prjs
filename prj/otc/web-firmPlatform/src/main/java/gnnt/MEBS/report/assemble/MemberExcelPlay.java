package gnnt.MEBS.report.assemble;

import gnnt.MEBS.base.util.SpringContextHelper;
import gnnt.MEBS.report.model.CompleteData;
import gnnt.MEBS.report.model.DataTable;
import gnnt.MEBS.report.model.PrimaryTable;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;

public class MemberExcelPlay
{
  private Map<String, List> map = (Map)SpringContextHelper.getBean("memberReportMap");
  
  public void getExcel(String name, CompleteData vec, OutputStream os, HttpServletRequest request)
  {
    HSSFWorkbook work = new HSSFWorkbook();
    HSSFSheet sheet = work.createSheet(name);
    List<DataTable> list = vec.getDataTableList();
    Integer num = Integer.valueOf(0);
    HSSFRow row = sheet.createRow(num.intValue());
    HSSFCell cell = row.createCell((short)0);
    cell.setEncoding((short)1);
    cell.setCellValue("会员报表");
    createMemo(sheet, 0, num.intValue(), 16, num.intValue());
    createTotalBorder(work.createFont(), cell, work.createCellStyle());
    num = Integer.valueOf(num.intValue() + 1);
    PrimaryTable primaryTable = vec.getPrimaryTable();
    Map<String, Object> primaryMap = primaryTable.getPrimaryMsg();
    HSSFRow row1 = sheet.createRow(num.intValue());
    HSSFCell cell1 = row1.createCell((short)0);
    cell1.setEncoding((short)1);
    cell1.setCellValue("会员名称:" + primaryMap.get("memberName").toString());
    createMemo(sheet, 0, num.intValue(), 2, num.intValue());
    HSSFCell cell2 = row1.createCell((short)3);
    cell2.setEncoding((short)1);
    cell2.setCellValue("开始日期:" + 
      request
      .getParameter("gnnt_primary.clearDate[>=][date]"));
    createMemo(sheet, 3, num.intValue(), 5, num.intValue());
    HSSFCell cell3 = row1.createCell((short)6);
    cell3.setEncoding((short)1);
    cell3.setCellValue("会员编号:" + primaryMap.get("memberNo".toString()));
    createMemo(sheet, 6, num.intValue(), 8, num.intValue());
    HSSFCell cell4 = row1.createCell((short)9);
    cell4.setEncoding((short)1);
    cell4.setCellValue("结束日期:" + 
      request
      .getParameter("gnnt_primary.clearDate[<=][date]"));
    createMemo(sheet, 9, num.intValue(), 11, num.intValue());
    num = Integer.valueOf(num.intValue() + 1);
    for (DataTable table : list) {
      num = Integer.valueOf(getBody(sheet, table.getDataList(), table.getTemplate(), num, 
        work));
    }
    outPut(work, os);
  }
  
  private int getBody(HSSFSheet sheet, List vec, String template, Integer num, HSSFWorkbook work)
  {
    if (this.map.containsKey(template))
    {
      List<String> list = (List)this.map.get(template);
      if ("/report/tableTemplates/memberClosePositionReport.jsp".equals(template))
      {
        HSSFRow row = sheet.createRow(num.intValue());
        HSSFCell cell = row.createCell((short)0);
        cell.setEncoding((short)1);
        cell.setCellValue("平仓明细");
        createMemo(sheet, 0, num.intValue(), 16, num.intValue());
        createStyleNoBorder(work.createFont(), cell, 
          work.createCellStyle());
        num = Integer.valueOf(num.intValue() + 1);
        getHead(sheet, list, num.intValue());
        for (int i = 0; i < vec.size(); i++) {
          getColse(sheet, (Map)vec.get(i), i + 1 + 
            num.intValue(), i + 1);
        }
      }
      else if ("/report/tableTemplates/memberTradeDetailReport.jsp".equals(template))
      {
        HSSFRow row = sheet.createRow(num.intValue());
        HSSFCell cell = row.createCell((short)0);
        cell.setEncoding((short)1);
        cell.setCellValue("成交明细");
        createMemo(sheet, 0, num.intValue(), 11, num.intValue());
        createStyleNoBorder(work.createFont(), cell, 
          work.createCellStyle());
        num = Integer.valueOf(num.intValue() + 1);
        getHead(sheet, list, num.intValue());
        for (int i = 0; i < vec.size(); i++) {
          getTrade(sheet, (Map)vec.get(i), i + 1 + 
            num.intValue(), i + 1);
        }
      }
      else if ("/report/tableTemplates/memberHoldPositionReport.jsp".equals(template))
      {
        HSSFRow row = sheet.createRow(num.intValue());
        HSSFCell cell = row.createCell((short)0);
        cell.setEncoding((short)1);
        cell.setCellValue("持仓明细");
        createMemo(sheet, 0, num.intValue(), 15, num.intValue());
        createStyleNoBorder(work.createFont(), cell, 
          work.createCellStyle());
        num = Integer.valueOf(num.intValue() + 1);
        getHead(sheet, list, num.intValue());
        for (int i = 0; i < vec.size(); i++) {
          getHold(sheet, (Map)vec.get(i), i + 1 + 
            num.intValue(), i + 1);
        }
      }
      else if ("/report/tableTemplates/memberCapitalFlowingReport.jsp".equals(template))
      {
        HSSFRow row = sheet.createRow(num.intValue());
        HSSFCell cell = row.createCell((short)0);
        cell.setEncoding((short)1);
        cell.setCellValue("资金流水");
        createMemo(sheet, 0, num.intValue(), 7, num.intValue());
        createStyleNoBorder(work.createFont(), cell, 
          work.createCellStyle());
        num = Integer.valueOf(num.intValue() + 1);
        getHead(sheet, list, num.intValue());
        for (int i = 0; i < vec.size(); i++) {
          getFundFlow(sheet, (Map)vec.get(i), i + 
            1 + num.intValue(), i + 1);
        }
      }
      else if ("/report/tableTemplates/memberFundsReport.jsp".equals(template))
      {
        HSSFRow row = sheet.createRow(num.intValue());
        HSSFCell cell = row.createCell((short)0);
        cell.setEncoding((short)1);
        cell.setCellValue("交易资金状况");
        createMemo(sheet, 0, num.intValue(), 13, num.intValue());
        createStyleNoBorder(work.createFont(), cell, 
          work.createCellStyle());
        num = Integer.valueOf(num.intValue() + 1);
        getHead(sheet, list, num.intValue());
        for (int i = 0; i < vec.size(); i++) {
          getFund(sheet, (Map)vec.get(i), i + 1 + 
            num.intValue(), i + 1);
        }
      }
      num = Integer.valueOf(num.intValue() + vec.size() + 3);
    }
    return num.intValue();
  }
  
  private void getColse(HSSFSheet sheet, Map<String, Object> map, int rownum, int n)
  {
    HSSFRow row = sheet.createRow(rownum);
    putCell(row, Integer.valueOf(n), 0, "int");
    putCell(row, toDate(map.get("clearDate")), 1, "");
    putCell(row, toTime(map.get("closedate")), 2, "");
    putCell(row, map.get("membersignno"), 3, "");
    putCell(row, map.get("tradeno"), 4, "bigDecimal");
    putCell(row, map.get("commodityname"), 5, "");
    putCell(row, strStatus(map.get("bs_flag")), 6, "");
    putCell(row, map.get("quantity"), 7, "bigDecimal");
    putCell(row, format(map.get("price")), 8, "double");
    putCell(row, format(map.get("holdprice")), 9, "double");
    putCell(row, format(map.get("close_pl")), 10, "double");
    putCell(row, map.get("opentradeno"), 11, "bigDecimal");
    putCell(row, format(map.get("openprice")), 12, "double");
    putCell(row, toTime(map.get("holdtime")), 13, "");
    putCell(row, format(map.get("tradefee")), 14, "double");
    putCell(row, map.get("s_memberno"), 15, "");
    putCell(row, closeMap(map.get("tradetype")), 16, "");
  }
  
  private void getTrade(HSSFSheet sheet, Map<String, Object> map, int rownum, int n)
  {
    HSSFRow row = sheet.createRow(rownum);
    putCell(row, Integer.valueOf(n), 0, "int");
    putCell(row, toDate(map.get("clearDate")), 1, "");
    putCell(row, toTime(map.get("tradetime")), 2, "");
    putCell(row, strStatus(map.get("bs_flag")), 3, "");
    putCell(row, map.get("membersignno"), 4, "");
    putCell(row, map.get("tradeno"), 5, "bigDecimal");
    putCell(row, map.get("commodityname"), 6, "");
    putCell(row, map.get("quantity"), 7, "bigDecimal");
    putCell(row, format(map.get("price")), 8, "double");
    putCell(row, format(map.get("tradefunds")), 9, "double");
    putCell(row, format(map.get("tradefee")), 10, "double");
    putCell(row, map.get("s_memberno"), 11, "");
  }
  
  private void getHold(HSSFSheet sheet, Map<String, Object> map, int rownum, int n)
  {
    HSSFRow row = sheet.createRow(rownum);
    putCell(row, Integer.valueOf(n), 0, "int");
    putCell(row, toDate(map.get("clearDate")), 1, "");
    putCell(row, toTime(map.get("holdtime")), 2, "");
    putCell(row, format(map.get("openprice")), 3, "double");
    putCell(row, map.get("membersignno"), 4, "");
    putCell(row, map.get("opentradeno"), 5, "bigDecimal");
    putCell(row, map.get("commodityname"), 6, "");
    putCell(row, strStatus(map.get("bs_flag")), 7, "");
    putCell(row, map.get("holdno"), 8, "bigDecimal");
    putCell(row, map.get("holdqty"), 9, "bigDecimal");
    putCell(row, format(map.get("holdprice")), 10, "double");
    putCell(row, format(map.get("clearprice")), 11, "double");
    putCell(row, format(map.get("holdpl")), 12, "double");
    putCell(row, format(map.get("holdmargin")), 13, "double");
    putCell(row, format(map.get("delayFee")), 14, "double");
    putCell(row, map.get("s_memberno"), 15, "");
  }
  
  private void getFundFlow(HSSFSheet sheet, Map<String, Object> map, int rownum, int n)
  {
    HSSFRow row = sheet.createRow(rownum);
    putCell(row, Integer.valueOf(n), 0, "int");
    putCell(row, toDate(map.get("clearDate")), 1, "");
    putCell(row, map.get("fundflowid"), 2, "bigDecimal");
    putCell(row, map.get("amount"), 3, "bigDecimal");
    putCell(row, format(map.get("balance")), 4, "double");
    putCell(row, map.get("voucherno"), 5, "");
    putCell(row, code(map.get("oprcode")), 6, "");
    putCell(row, toTime(map.get("createtime")), 7, "");
  }
  
  private void getFund(HSSFSheet sheet, Map<String, Object> map, int rownum, int n)
  {
    HSSFRow row = sheet.createRow(rownum);
    putCell(row, Integer.valueOf(n), 0, "int");
    putCell(row, toDate(map.get("clearDate")), 1, "");
    putCell(row, format(map.get("begincapital")), 2, "double");
    putCell(row, format(map.get("fundio")), 3, "double");
    putCell(row, format(map.get("memberfee")), 4, "double");
    putCell(row, format(map.get("mktfee")), 5, "double");
    putCell(row, format(map.get("customerfee")), 6, "double");
    putCell(row, format(map.get("memberclosepl")), 7, "double");
    putCell(row, format(map.get("memberholdpl")), 8, "double");
    putCell(row, format(map.get("customerdelayfee")), 9, "double");
    putCell(row, format(map.get("smemberdelayfee")), 10, "double");
    putCell(row, format(map.get("delayfeesum")), 11, "double");
    putCell(row, format(map.get("endcapital")), 12, "double");
    putCell(row, riskRate_log(map.get("risk"), map.get("status")), 13, "");
  }
  
  private void getHead(HSSFSheet sheet, List<String> head, int num)
  {
    HSSFRow row = sheet.createRow(num);
    if ((head != null) && (head.size() > 0)) {
      for (int i = 0; i < head.size(); i++) {
        putCell(row, head.get(i), i, null);
      }
    }
  }
  
  private void putCell(HSSFRow row, Object value, int colnum, String type)
  {
    HSSFCell cell = row.createCell((short)colnum);
    cell.setEncoding((short)1);
    if (value != null)
    {
      if ((type == null) || ("".equals(type))) {
        cell.setCellValue((String)value);
      } else if ("double".equals(type)) {
        cell.setCellValue(((Double)value).doubleValue());
      } else if ("date".equals(type)) {
        cell.setCellValue((Date)value);
      } else if ("bigDecimal".equals(type)) {
        cell.setCellValue(((BigDecimal)value).doubleValue());
      } else if ("int".equals(type)) {
        cell.setCellValue(((Integer)value).intValue());
      }
    }
    else {
      cell.setCellValue("");
    }
  }
  
  private void outPut(HSSFWorkbook work, OutputStream os)
  {
    try
    {
      work.write(os);
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }
  }
  
  public void createMemo(HSSFSheet sheet, int cx, int cy, int cx1, int cy1)
  {
    Region r = new Region(cy, (short)cx, cy1, (short)cx1);
    sheet.addMergedRegion(r);
  }
  
  public void createStyleNoBorder(HSSFFont font, HSSFCell cell, HSSFCellStyle style)
  {
    font.setFontHeightInPoints((short)10);
    font.setFontName("宋体");
    font.setBoldweight((short)700);
    style.setVerticalAlignment((short)1);
    style.setAlignment((short)2);
    style.setFont(font);
    cell.setCellStyle(style);
  }
  
  public void createTotalBorder(HSSFFont font, HSSFCell cell, HSSFCellStyle style)
  {
    font.setFontHeightInPoints((short)20);
    font.setFontName("宋体");
    font.setBoldweight((short)700);
    style.setVerticalAlignment((short)1);
    style.setAlignment((short)2);
    style.setFont(font);
    cell.setCellStyle(style);
  }
  
  private Double format(Object num)
  {
    try
    {
      DecimalFormat df = new DecimalFormat(".00");
      return Double.valueOf(Double.parseDouble(df.format(num)));
    }
    catch (Exception e) {}
    return Double.valueOf(0.0D);
  }
  
  private String toDate(Object obj)
  {
    String date = "";
    if (obj != null)
    {
      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
      date = df.format(obj);
    }
    return date;
  }
  
  private String toTime(Object obj)
  {
    String date = "";
    try
    {
      SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      date = df.format(obj);
    }
    catch (Exception localException) {}
    return date;
  }
  
  private String strStatus(Object obj)
  {
    String str = "";
    try
    {
      if ("1".equals(obj.toString())) {
        str = "买入";
      } else if ("2".equals(obj.toString())) {
        str = "卖出";
      }
    }
    catch (Exception localException) {}
    return str;
  }
  
  private String code(Object obj)
  {
    String str = "";
    try
    {
      if ("101".equals(obj.toString())) {
        str = "入金";
      } else if ("102".equals(obj.toString())) {
        str = "出金";
      } else if ("201".equals(obj.toString())) {
        str = "扣除手续费";
      } else if ("204".equals(obj.toString())) {
        str = "持仓亏损";
      } else if ("205".equals(obj.toString())) {
        str = "持仓盈利";
      } else if ("206".equals(obj.toString())) {
        str = "平仓亏损";
      } else if ("207".equals(obj.toString())) {
        str = "平仓盈利";
      } else if ("210".equals(obj.toString())) {
        str = "扣除延期费";
      } else if ("211".equals(obj.toString())) {
        str = "与客户结算延期费";
      } else if ("212".equals(obj.toString())) {
        str = "与客户结算手续费";
      } else if ("213".equals(obj.toString())) {
        str = "与客户结算平仓盈亏";
      } else if ("214".equals(obj.toString())) {
        str = "与客户结算持仓盈亏";
      } else if ("310".equals(obj.toString())) {
        str = "客户与会员的结算盈亏";
      }
    }
    catch (Exception localException) {}
    return str;
  }
  
  public String closeMap(Object obj)
  {
    String str = "";
    try
    {
      if ("1".equals(((BigDecimal)obj).toString())) {
        str = "市价成交";
      } else if ("2".equals(((BigDecimal)obj).toString())) {
        str = "市价成交";
      } else if ("3".equals(((BigDecimal)obj).toString())) {
        str = "市价成交";
      } else if ("4".equals(((BigDecimal)obj).toString())) {
        str = "自动强平";
      } else if ("5".equals(((BigDecimal)obj).toString())) {
        str = "手动强平";
      } else if ("6".equals(((BigDecimal)obj).toString())) {
        str = "指价成交";
      } else if ("7".equals(((BigDecimal)obj).toString())) {
        str = "指价成交";
      }
    }
    catch (Exception localException) {}
    return str;
  }
  
  public String riskRate_log(Object obj1, Object status)
  {
    String rate = "";
    if ("F".equals((String)status)) {
      rate = "--";
    } else if (((BigDecimal)obj1).doubleValue() >= 2.0D) {
      rate = "安全";
    } else {
      rate = 
      
        formatDecimals(((BigDecimal)obj1).multiply(new BigDecimal(100)), 2) + "%";
    }
    return rate;
  }
  
  public BigDecimal formatDecimals(BigDecimal value, int scale)
  {
    BigDecimal valueFormat = null;
    if (value != null) {
      valueFormat = value.setScale(scale, 4);
    }
    return valueFormat;
  }
}
