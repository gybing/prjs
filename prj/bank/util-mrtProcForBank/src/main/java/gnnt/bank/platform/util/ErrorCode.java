package gnnt.bank.platform.util;

import java.io.PrintStream;
import java.util.Hashtable;

public class ErrorCode
{
  public static final long handle_success = 0L;
  public static final long bankhandle_failure = -100L;
  public static final long inMoney_ErrorBankAcount = -10001L;
  public static final long inMoney_ErrorFirmCode = -10002L;
  public static final long inMoney_ErrorCorrespond = -10003L;
  public static final long inMoney_DataBaseException = -10004L;
  public static final long inMoney_SysException = -10005L;
  public static final long inMoney_ErrorParameter = -10006L;
  public static final long inMoney_FirmNO = -10007L;
  public static final long inMoney_FirmNOUse = -10008L;
  public static final long inMoney_SystemClose = -10009L;
  public static final long inMoneyM_ErrorBankAcount = -10011L;
  public static final long inMoneyM_ErrorFirmCode = -10012L;
  public static final long inMoneyM_ErrorCorrespond = -10013L;
  public static final long inMoneyM_DataBaseException = -10014L;
  public static final long inMoneyM_SysException = -10015L;
  public static final long inMoneyM_ErrorParameter = -10016L;
  public static final long inMoneyM_ErrorApdater = -10018L;
  public static final long inMoneyM_FirmNO = -10019L;
  public static final long inMoneyM_FirmNOUse = -10020L;
  public static final long inMoneyM_SystemClose = -10021L;
  public static final long inMoneyM_Pwd = -10022L;
  public static final long inMoneyM_Bank = -10023L;
  public static final long inMoneyM_ErrorGetRate = -10024L;
  public static final long inMoney_ErrorAddCapital = -10025L;
  public static final long inMoneyM_ErrorAddCapital = -10026L;
  public static final long outMoney_ErrorBankAcount = -20001L;
  public static final long outMoney_ErrorFirmCode = -20002L;
  public static final long outMoney_ErrorCorrespond = -20003L;
  public static final long outMoney_DataBaseException = -20004L;
  public static final long outMoney_SysException = -20005L;
  public static final long outMoney_BankProError = -20006L;
  public static final long outMoney_ErrorParameter = -20007L;
  public static final long outMoney_FirmNO = -20008L;
  public static final long outMoney_FirmNOUse = -20009L;
  public static final long outMoney_SystemClose = -20010L;
  public static final long outMoney_CardNo = -20020L;
  public static final long outMoney_BankNo = -20044L;
  public static final long outMoney_ErrorAddCapital = -20038L;
  public static final long outMoney_ErrorLackFunds = -20039L;
  public static final long outMoney_ErrorGetRate = -20040L;
  public static final long outMoneyM_FirmNO = -20041L;
  public static final long outMoneyB_SysException = -20029L;
  public static final long outMoneyB_DataBaseException = -20028L;
  public static final long outMoneyB_ErrorCorrespond = -20027L;
  public static final long outMoneyB_FirmNOUse = -20026L;
  public static final long outMoneyB_ErrorFirmCode = -20025L;
  public static final long outMoneyB_ErrorBankAcount = -20024L;
  public static final long outMoneyB_FirmNO = -20023L;
  public static final long outMoneyB_SystemClose = -20022L;
  public static final long outMoneyB_ErrorParameter = -20021L;
  public static final long outMoneyB_successRefused = -20043L;
  public static final long outMoneyAudit_ErrorActionID = -20011L;
  public static final long outMoneyAudit_ErrorFirmCode = -20012L;
  public static final long outMoneyAudit_PassDataBaseException = -20013L;
  public static final long outMoneyAudit_RefuseDataBaseException = -20014L;
  public static final long outMoneyAudit_DataBaseException = -20015L;
  public static final long outMoneyAudit_SysException = -20016L;
  public static final long outMoneyAudit_ErrorTimeOut = -20017L;
  public static final long outMoneyAudit_OradyAudite = -20042L;
  public static final long outMoneyAudit_ErrorTimeUn = -20018L;
  public static final long outMoneyAudit_ErrorBank = -20019L;
  public static final long inMoneyAudit_ErrorTimeOut = -20030L;
  public static final long inMoneyAudit_ErrorTimeUn = -20031L;
  public static final long inMoneyAudit_ErrorFirmCode = -20032L;
  public static final long inMoneyAudit_PassDataBaseException = -20033L;
  public static final long inMoneyAudit_RefuseDataBaseException = -20034L;
  public static final long inMoneyAudit_ErrorActionID = -20035L;
  public static final long inMoneyAudit_DataBaseException = -20036L;
  public static final long inMoneyAudit_SysException = -20037L;
  public static final long inMoneyAudit_BankMoneyNotEnough = -20042L;
  public static final long checkTrans_ErrorExceedDayMaxPerMoney = -30000L;
  public static final long checkTrans_ErrorExceedMaxMoney = -30001L;
  public static final long checkTrans_ErrorExceedDayMaxMoney = -30002L;
  public static final long checkTrans_ErrorExceedDayMaxNum = -30003L;
  public static final long checkTrans_DataBaseException = -30004L;
  public static final long checkTrans_SysException = -30005L;
  public static final long checkTrans_ErrorSingleMaxMoney = -30006L;
  public static final long checkTrans_ErrorBankAccount = -30007L;
  public static final long rgstAccount_InfoHalfbaked = -40001L;
  public static final long rgstAccount_NOFirm = -40002L;
  public static final long rgstAccount_NOBank = -40003L;
  public static final long rgstAccount_GRSAcount = -40004L;
  public static final long rgstAccount_BankRgsFail = -40005L;
  public static final long rgstAccount_DatabaseException = -40006L;
  public static final long rgstAccount_SysException = -40007L;
  public static final long rgstAccount_wrongPwd = -40008L;
  public static final long rgstAccount_cardHaveExist = -40009L;
  public static final long delAccount_InfoHalfbaked = -40011L;
  public static final long delAccount_NORgsAcount = -40014L;
  public static final long delAccount_BankDelFail = -40015L;
  public static final long delAccount_DatabaseException = -40016L;
  public static final long delAccount_SysException = -40017L;
  public static final long queryMoney_NoneFirm = -50001L;
  public static final long queryMoney_TENoneFirm = -50002L;
  public static final long queryBankMoney_NoneFirm = -50003L;
  public static final long loginBank_None = -50004L;
  public static final long client_timeout = -50005L;
  public static final long bankSer_None = -50006L;
  public static final long marketSer_None = -50007L;
  public static final long marketBackMoney_False = -50008L;
  public static final long czSystem_error = -50009L;
  public static final long bankNull = -50010L;
  public static final long sendDataError = -50011L;
  public static final long cardMoney_none = -50012L;
  public static final long beyond_AgreementMoney = -50013L;
  public static final long beyond_AgreementMaxPerMoney = -50014L;
  public static final long charge_bankNull = -500001L;
  public static final long charge_noReasion = -500003L;
  public static final long charge_noFirm = -500004L;
  public static final long charge_SQLException = -500005L;
  public static final long synFirm_DBException = -500014L;
  public static final long Firm_UnLogon = -600001L;
  public static final long OutMoney_MaketBalanceError = -800002L;
  public static final long Bank_SysClose = -910020L;
  public static final long Bank_Unrecognised = -910021L;
  public static final long RgsAccount_fail = -910030L;
  public static final long GetAdapter_Error = -920000L;
  public static final long Bank_OtherError = -920001L;
  public static final long delAccount_FrozenFuns = -920002L;
  public static final long Error_MSG = -920002L;
  public static final long Not_TradeDate = -920003L;
  public static final long Be_TradeTime = -920004L;
  public static final long Af_TradeTime = -920005L;
  public static final long Co_Trade = -920006L;
  public static final long Fee_UnlessThanTransferMoney = -920007L;
  public static final long ActionID_Error = -920008L;
  public static final long ActionInAudit = -920009L;
  public static final long Audit_Arraidy = -930000L;
  public static final long delAccount_NotZero = -941001L;
  public static final long delAccount_Transfer = -941002L;
  public static final long inMoneyB_passwordLock = -710001L;
  public static final long balance_FalsePwd = -910002L;
  public static final long BCM_2_SP0001 = 14200001L;
  public static final long BCM_2_SP0002 = 14200002L;
  public static final long BCM_2_SP0003 = 14200003L;
  public static final long BCM_2_SP0004 = 14200004L;
  public static final long BCM_2_SP0005 = 14200005L;
  public static final long BCM_2_SP0006 = 14200006L;
  public static final long BCM_2_SP0007 = 14200007L;
  public static final long BCM_2_SP0008 = 14200008L;
  public static final long BCM_2_SP0009 = 14200009L;
  public static final long BCM_2_SP0099 = 14200099L;
  public static final long CMBC_1_PwdExce = -50051L;
  public static final long CMBC_1_NoPwd = -50052L;
  public static final long CMBC_1_PwdErr = -50053L;
  public static final long CMBC_1_AccErrDifferent = -50054L;
  public static final long CMBC_1_CardErr = -50055L;
  public static final long CMBC_1_HavSigning = -50056L;
  public static final long CMBC_1_AccErr = -50057L;
  public static final long CMBC_1_Status = -50058L;
  public static final long CMBC_1_Cancellation_HavaMoney = -50059L;
  public static final long CMBC_1_Cancellation_HaveTransac = -50060L;
  public static final long CMBC_1_NoFoundAcc = -50061L;
  public static final long CMBC_1_NoSigning = -50062L;
  public static final long CMBC_1_MACVerificaFail = -50063L;
  public static final long CMBC_1_NoFoundFirm = -50064L;
  public static final long CMBC_1_AccExce = -50065L;
  public static final long CMBC_1_NoMuchMoney = -50066L;
  public static final long CMBC_1_Change_HaveTransac = -50067L;
  public static final long CMBC_1_HadReverse = -50068L;
  public static final long CMBC_1_Yu_HavSigning = -50069L;
  public static final long CMBC_1_Y_Tosign = -50070L;
  public static final long CMBC_1_Y_AccountsStatusNotNormal = -50071L;
  public static final long CMBC_2_Y_ReverseMoneyInconsistent = -50072L;
  public static final long CMBC_2_Y_In_NoOut = -50073L;
  public static final long CMBC_2_Y_BankHostError = -50074L;
  public static final long BOC_1_MACError = -42L;
  public static final long CMBC_1_Exce0101 = -50101L;
  public static final long CMBC_1_Exce0102 = -50102L;
  public static final long CMBC_1_Exce0103 = -50103L;
  public static final long CMBC_1_Exce0104 = -50104L;
  public static final long CMBC_1_Exce0105 = -50105L;
  public static final long CMBC_1_Exce0106 = -50106L;
  public static final long CMBC_1_Exce0107 = -50107L;
  public static final long CMBC_1_Exce0108 = -50108L;
  public static final long CMBC_1_Exce8888 = -58888L;
  public static final long BOC_1_Exce0101 = -50101L;
  public static final long BOC_1_Exce0102 = -50102L;
  public static final long BOC_1_Exce0103 = -50103L;
  public static final long BOC_1_Exce0104 = -50104L;
  public static final long BOC_1_Exce0105 = -50105L;
  public static final long BOC_1_Exce0106 = -50106L;
  public static final long BOC_1_Exce0107 = -50107L;
  public static final long BOC_1_Exce0108 = -50108L;
  public static final long BOC_1_Exce8888 = -58888L;
  public static final long BOC_1_PwdExce = -50051L;
  public static final long BOC_1_NoPwd = -50052L;
  public static final long BOC_1_PwdErr = -50053L;
  public static final long BOC_1_AccErrDifferent = -50054L;
  public static final long BOC_1_CardErr = -50055L;
  public static final long BOC_1_HavSigning = -50056L;
  public static final long BOC_1_AccErr = -50057L;
  public static final long BOC_1_Status = -50058L;
  public static final long BOC_1_Cancellation_HavaMoney = -50059L;
  public static final long BOC_1_Cancellation_HaveTransac = -50060L;
  public static final long BOC_1_NoFoundAcc = -50061L;
  public static final long BOC_1_NoSigning = -50062L;
  public static final long BOC_1_MACVerificaFail = -50063L;
  public static final long BOC_1_NoFoundFirm = -50064L;
  public static final long BOC_1_AccExce = -50065L;
  public static final long BOC_1_NoMuchMoney = -50066L;
  public static final long BOC_1_Change_HaveTransac = -50067L;
  public static final long BOC_1_HadReverse = -50068L;
  public static final long BOC_1_Yu_HavSigning = -50069L;
  public static final long BOC_1_Y_Tosign = -50070L;
  public static final long BOC_1_Y_AccountsStatusNotNormal = -50071L;
  public static final long BOC_2_Y_ReverseMoneyInconsistent = -50072L;
  public static final long BOC_2_Y_In_NoOut = -50073L;
  public static final long BOC_2_Y_BankHostError = -50074L;
  public static final long dbError = -990001L;
  public static Hashtable<Long, String> error = new Hashtable();

  public void load()
  {
    error.put(Long.valueOf(0L), "处理成功");
    error.put(Long.valueOf(-100L), "银行处理失败");

    error.put(Long.valueOf(-10001L), "入金回调非法银行帐号");
    error.put(Long.valueOf(-10002L), "入金回调非法交易商代码");
    error.put(Long.valueOf(-10003L), "入金回调交易商代码和帐号对应关系错误");
    error.put(Long.valueOf(-10004L), "入金回调数据库异常");
    error.put(Long.valueOf(-10005L), "入金回调系统异常");
    error.put(Long.valueOf(-10006L), "入金回调参数错误");
    error.put(Long.valueOf(-10007L), "入金回调交易商未签约");
    error.put(Long.valueOf(-10008L), "入金回调账户被禁用");
    error.put(Long.valueOf(-10009L), "对不起，现在是闭市时间，不允许入金");

    error.put(Long.valueOf(-20042L), "交易商入金，银行账户资金不足");

    error.put(Long.valueOf(-10011L), "交易商发起入金:非法银行帐号");
    error.put(Long.valueOf(-10012L), "交易商发起入金:非法交易商代码");
    error.put(Long.valueOf(-10013L), "交易商发起入金:交易商代码和帐号对应关系错误");
    error.put(Long.valueOf(-10014L), "交易商发起入金:数据库异常");
    error.put(Long.valueOf(-10015L), "交易商发起入金:系统异常");
    error.put(Long.valueOf(-10016L), "交易商发起入金:参数错误");
    error.put(Long.valueOf(-10018L), "交易商发起转账:适配器提交失败");
    error.put(Long.valueOf(-10019L), "交易商发起入金:交易商未签约");
    error.put(Long.valueOf(-10020L), "交易商发起入金：账户被禁用");
    error.put(Long.valueOf(-10021L), "对不起，现在是闭市时间，不允许入金");
    error.put(Long.valueOf(-10022L), "交易商发起入金:银行返回,卡密码错误");
    error.put(Long.valueOf(-10023L), "交易商发起入金:银行端处理失败");
    error.put(Long.valueOf(-10024L), "交易商发起入金:计算手续费错误");
    error.put(Long.valueOf(-10025L), "入金回调，记录资金流水错误");
    error.put(Long.valueOf(-10026L), "交易商发起入金:写入资金流水失败");

    error.put(Long.valueOf(-20001L), "交易商发起出金:非法银行帐号");
    error.put(Long.valueOf(-20002L), "交易商发起出金:非法交易商代码");
    error.put(Long.valueOf(-20003L), "交易商发起出金:交易商代码和帐号对应关系错误");
    error.put(Long.valueOf(-20004L), "对不起，您当前的余额不足");
    error.put(Long.valueOf(-20005L), "交易商发起出金:系统异常");
    error.put(Long.valueOf(-20006L), "交易商发起出金:银行端处理失败");
    error.put(Long.valueOf(-20007L), "交易商发起出金:参数错误");
    error.put(Long.valueOf(-20008L), "交易商发起出金:交易商未签约");
    error.put(Long.valueOf(-20009L), "交易商发起出金：交易商被禁用");
    error.put(Long.valueOf(-20010L), "对不起，现在是闭市时间，不允许出金");
    error.put(Long.valueOf(-20020L), "交易商发起出金:银行返回，客户证件与开户时不符");
    error.put(Long.valueOf(-20044L), "银行返回，客户银行卡号与开户时不符");
    error.put(Long.valueOf(-20038L), "交易商发起出金:记录资金流水错误");
    error.put(Long.valueOf(-20039L), "资金余额不足");
    error.put(Long.valueOf(-20040L), "交易商发起出金:计算出金手续费错误");
    error.put(Long.valueOf(-20041L), "交易商发起出金，交易商未签约");

    error.put(Long.valueOf(-20011L), "出金审核：没有发现业务流水号");
    error.put(Long.valueOf(-20012L), "出金审核：非法交易商代码");
    error.put(Long.valueOf(-20013L), "出金审核：同意出金SQLException，数据回滚，需要手工处理出金和手续费");
    error.put(Long.valueOf(-20014L), "出金审核：拒绝出金SQLException，数据回滚，需要手工处理出金和手续费");
    error.put(Long.valueOf(-20015L), "出金审核：SQLException");
    error.put(Long.valueOf(-20016L), "出金审核：Exception");
    error.put(Long.valueOf(-20017L), "出金审核：审核时间已过");
    error.put(Long.valueOf(-20018L), "出金审核：审核时间未到");
    error.put(Long.valueOf(-20019L), "出金审核：发送给银行 银行处理失败");
    error.put(Long.valueOf(-20043L), "银行发起出金:超出审核额度，出金拒绝成功");

    error.put(Long.valueOf(-30000L), "不符合出金条件：超出每日单笔最大出金金额");
    error.put(Long.valueOf(-30001L), "不符合出金条件：超出最大出金金额");
    error.put(Long.valueOf(-30002L), "不符合出金条件：超出每日最大出金金额");
    error.put(Long.valueOf(-30003L), "不符合出金条件：超出每日最大出金次数");
    error.put(Long.valueOf(-30004L), "不符合出金条件：数据库异常");
    error.put(Long.valueOf(-30005L), "不符合出金条件：系统异常");
    error.put(Long.valueOf(-30006L), "出金提交成功，等待交易所审核");
    error.put(Long.valueOf(-30007L), "银行提示: 客户银行账号异常");

    error.put(Long.valueOf(-40001L), "银行帐号注册:信息不完整");
    error.put(Long.valueOf(-40002L), "银行帐号注册:交易商不存在");
    error.put(Long.valueOf(-40003L), "银行帐号注册:银行不存在");
    error.put(Long.valueOf(-40004L), "银行帐号注册:帐号已注册");
    error.put(Long.valueOf(-40005L), "银行帐号注册:银行签约失败");
    error.put(Long.valueOf(-40006L), "银行帐号注册:数据库操作失败");

    error.put(Long.valueOf(-40009L), "银行账号注册：该证件已注册，不允许重复注册");
    error.put(Long.valueOf(-40007L), "银行帐号注册:系统异常");
    error.put(Long.valueOf(-40008L), "交易商密码错误");

    error.put(Long.valueOf(-40011L), "银行帐号注销:信息不完整");
    error.put(Long.valueOf(-40014L), "银行帐号注销:帐号未注册");
    error.put(Long.valueOf(-40015L), "银行帐号注销:银行解约失败");
    error.put(Long.valueOf(-40016L), "银行帐号注销:数据库操作失败");
    error.put(Long.valueOf(-40017L), "银行帐号注销:系统异常");

    error.put(Long.valueOf(-50001L), "查询交易商资金余额:银行接口交易商不存在");
    error.put(Long.valueOf(-50002L), "查询交易商资金余额:交易系统交易商不存在");
    error.put(Long.valueOf(-50003L), "查询银行资金余额:银行接口交易商不存在");

    error.put(Long.valueOf(-50004L), "不在转账时间内");

    error.put(Long.valueOf(-20029L), "银行发起出金:系统异常");
    error.put(Long.valueOf(-20028L), "银行发起出金:数据库异常");
    error.put(Long.valueOf(-20027L), "银行发起出金:交易商代码和帐号对应关系错误");
    error.put(Long.valueOf(-20026L), "银行发起出金:交易商被禁用");
    error.put(Long.valueOf(-20025L), "银行发起出金:非法交易商代码");
    error.put(Long.valueOf(-20024L), "银行发起出金:非法银行帐号");
    error.put(Long.valueOf(-20023L), "银行发起出金:交易商未签约");
    error.put(Long.valueOf(-20022L), "对不起，现在是闭市时间，不允许出金");
    error.put(Long.valueOf(-20021L), "银行发起出金:参数错误");

    error.put(Long.valueOf(-20030L), "入金审核:入金审核时间已过");
    error.put(Long.valueOf(-20031L), "入金审核:入金审核时间未到");
    error.put(Long.valueOf(-20032L), "入金审核:交易商入金审核错误，非法交易商代码");
    error.put(Long.valueOf(-20033L), "入金审核:审核入金数据库异常，需要手工处理入金状态");
    error.put(Long.valueOf(-20034L), "入金审核:拒绝入金数据库异常，需要手工处理入金状态");
    error.put(Long.valueOf(-20035L), "入金审核:没有发现入金业务流水号");

    error.put(Long.valueOf(-50005L), "连接服务器超时");

    error.put(Long.valueOf(-50006L), "冲正：银行流水号不存在");
    error.put(Long.valueOf(-50007L), "冲正：交易所流水号不存在");
    error.put(Long.valueOf(-50008L), "冲正：调用交易系统失败");
    error.put(Long.valueOf(-50006L), "冲正：银行流水号不存在");
    error.put(Long.valueOf(-500001L), "冲正：时传入的参数为空");
    error.put(Long.valueOf(-500003L), "冲正：查询条件不足");
    error.put(Long.valueOf(-500004L), "冲正：查询交易商失败");
    error.put(Long.valueOf(-500005L), "冲正：数据库异常");

    error.put(Long.valueOf(-50010L), "银行返回数据包为空");
    error.put(Long.valueOf(-50011L), "发送数据IO异常");
    error.put(Long.valueOf(-50012L), "银行卡余额不足");
    error.put(Long.valueOf(-50013L), "银行提示：当日卡转出累计金额超出协议限额");
    error.put(Long.valueOf(-50014L), "银行提示：超出银行最大转账金额");
    error.put(Long.valueOf(-500014L), "同步交易商：数据库异常，请检查！");
    error.put(Long.valueOf(-920001L), "银行返回其他错误");
    error.put(Long.valueOf(-920002L), "解约交易商，银行接口冻结资金不为0");
    error.put(Long.valueOf(-930000L), "本笔交易已经受理");
    error.put(Long.valueOf(-920003L), "当前不是交易日期");
    error.put(Long.valueOf(-920004L), "未到交易时间");
    error.put(Long.valueOf(-920005L), "交易时间已过");
    error.put(Long.valueOf(-920006L), "系统出现异常情况，交易被禁止");
    error.put(Long.valueOf(-941001L), "解约时交易商可用余额不为0");
    error.put(Long.valueOf(-941002L), "交易商当天有转账不能解约");
    error.put(Long.valueOf(-920008L), "交易所流水号冲突");
    error.put(Long.valueOf(-920009L), "流水已经有人处理");
    error.put(Long.valueOf(-710001L), "银行账号被锁定");
    error.put(Long.valueOf(-910002L), "密码错误");
    error.put(Long.valueOf(-920000L), "处理器获取适配器失败");
    error.put(Long.valueOf(-800002L), "出金失败，等待交易所处理，请联系交易所客服");

    error.put(Long.valueOf(14200001L), "系统错误：冲正记录无对应转账流水");
    error.put(Long.valueOf(14200002L), "无市场编号{0}资金账号{1}的签约记录");
    error.put(Long.valueOf(14200003L), "市场流水号{0}无对应的转账记录");
    error.put(Long.valueOf(14200004L), "市场流水号{0}对应的转账已冲正");
    error.put(Long.valueOf(14200005L), "无效密钥");
    error.put(Long.valueOf(14200006L), "无效算法{0}");
    error.put(Long.valueOf(14200007L), "MAC校验失败");
    error.put(Long.valueOf(14200008L), "未查找当前日期是否为工作日");
    error.put(Long.valueOf(14200009L), "当日为休息日");
    error.put(Long.valueOf(14200099L), "市场营运时段为工作日8:30~16:10");

    error.put(Long.valueOf(-910020L), "银行转账时间已过");
    error.put(Long.valueOf(-910021L), "银行端未执行激活");
    error.put(Long.valueOf(-910030L), "市场签约未成功");
    error.put(Long.valueOf(-920002L), "信息不完整");

    error.put(Long.valueOf(-50101L), "签约失败");
    error.put(Long.valueOf(-50102L), "解约失败");
    error.put(Long.valueOf(-50103L), "入金失败");
    error.put(Long.valueOf(-50104L), "出金失败");
    error.put(Long.valueOf(-50105L), "冲入金失败");
    error.put(Long.valueOf(-50106L), "冲出金失败");
    error.put(Long.valueOf(-50107L), "账户变更失败");
    error.put(Long.valueOf(-50108L), "查询余额失败");
    error.put(Long.valueOf(-58888L), "失败");
    error.put(Long.valueOf(-50051L), "密码校验失败");
    error.put(Long.valueOf(-50052L), "账户没有设置密码");
    error.put(Long.valueOf(-50053L), "密码验证错误");
    error.put(Long.valueOf(-50054L), "资金账号错误（银行账号与资金账号不一致)");
    error.put(Long.valueOf(-50055L), "证件号码不正确");
    error.put(Long.valueOf(-50056L), "该账号已签约，不可重复签约");
    error.put(Long.valueOf(-50057L), "资金账号错误或交易商下不存在该银行账户");
    error.put(Long.valueOf(-50058L), "资金账户状态不正常");
    error.put(Long.valueOf(-50059L), "账户有余额，不能解约");
    error.put(Long.valueOf(-50060L), "当日有交易，不能解约");
    error.put(Long.valueOf(-50061L), "该账户不存在");
    error.put(Long.valueOf(-50062L), "该账户未签约");
    error.put(Long.valueOf(-50063L), "MAC校验不通过");
    error.put(Long.valueOf(-50064L), "不存在该交易商或者交易商已销户");
    error.put(Long.valueOf(-50065L), "账户校验失败");
    error.put(Long.valueOf(-50066L), "资金账户可用余额不足");
    error.put(Long.valueOf(-50067L), "当日有交易，不能变更账户");
    error.put(Long.valueOf(-50068L), "流水已冲正，不可重复冲正");
    error.put(Long.valueOf(-50069L), "该账号已签约，不可进行预签约");
    error.put(Long.valueOf(-50070L), "该商品交易所已签退，请在交易时间内办理业务");
    error.put(Long.valueOf(-50071L), "银行帐户状态不正常");
    error.put(Long.valueOf(-50072L), "对公活期帐户余额不足，无法冲正");
    error.put(Long.valueOf(-50073L), "此帐户状态为只进不出");
    error.put(Long.valueOf(-42L), "MAC校验错");
    error.put(Long.valueOf(-50074L), "银行主机系统错误");

    error.put(Long.valueOf(-50101L), "签约失败");
    error.put(Long.valueOf(-50102L), "解约失败");
    error.put(Long.valueOf(-50103L), "入金失败");
    error.put(Long.valueOf(-50104L), "出金失败");
    error.put(Long.valueOf(-50105L), "冲入金失败");
    error.put(Long.valueOf(-50106L), "冲出金失败");
    error.put(Long.valueOf(-50107L), "账户变更失败");
    error.put(Long.valueOf(-50108L), "查询余额失败");
    error.put(Long.valueOf(-58888L), "失败");
    error.put(Long.valueOf(-50051L), "密码校验失败");
    error.put(Long.valueOf(-50052L), "账户没有设置密码");
    error.put(Long.valueOf(-50053L), "密码验证错误");
    error.put(Long.valueOf(-50054L), "资金账号错误（银行账号与资金账号不一致)");
    error.put(Long.valueOf(-50055L), "证件号码不正确");
    error.put(Long.valueOf(-50056L), "该账号已签约，不可重复签约");
    error.put(Long.valueOf(-50057L), "资金账号错误或交易商下不存在该银行账户");
    error.put(Long.valueOf(-50058L), "账号不可用");
    error.put(Long.valueOf(-50059L), "账户有余额，不能解约");
    error.put(Long.valueOf(-50060L), "当日有交易，不能解约");
    error.put(Long.valueOf(-50061L), "该账户不存在");
    error.put(Long.valueOf(-50062L), "该账户未签约");
    error.put(Long.valueOf(-50063L), "MAC校验不通过");
    error.put(Long.valueOf(-50064L), "不存在该交易商或者交易商已销户");
    error.put(Long.valueOf(-50065L), "账户校验失败");
    error.put(Long.valueOf(-50066L), "资金账户可用余额不足");
    error.put(Long.valueOf(-50067L), "当日有交易，不能变更账户");
    error.put(Long.valueOf(-50068L), "流水已冲正，不可重复冲证");
    error.put(Long.valueOf(-50069L), "该账号已签约，不可进行预签约");

    error.put(Long.valueOf(-50070L), "该商品交易所已签退，请在交易时间内办理业务");
    error.put(Long.valueOf(-50071L), "银行帐户状态不正常");
    error.put(Long.valueOf(-50072L), "对公活期帐户余额不足，无法冲正");
    error.put(Long.valueOf(-50073L), "此帐户状态为只进不出");
    error.put(Long.valueOf(-50074L), "银行主机系统错误");

    error.put(Long.valueOf(-600001L), "交易所未签到");

    error.put(Long.valueOf(-920007L), "手续费大于本金");
    error.put(Long.valueOf(-990001L), "数据库异常");
  }

  public static void main(String[] args)
  {
    System.out.println((String)error.get(Long.valueOf(-50005L)));
    ErrorCode ec = new ErrorCode();
    ec.load();
    System.out.println((String)error.get(Long.valueOf(-50005L)));
  }
}