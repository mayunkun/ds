/*
 * @(#)ConstantsUtil.java 2013-11-12下午03:25:14
 * Copyright 2013 sinovatech, Inc. All rights reserved.
 */
package cn.com.util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;

/**
 * 全局常量工具类
 * 
 * @author apple
 *
 */
@Component("ConstantsUtil")
public class ConstantsUtil {
	// 配置
	/**
	 * 默认字符编码集
	 */
	public static final String SYSTEM_DEFAULT_ENCODING = "utf-8";

	public static final int PASSWORD_DEFAULT_UPDATE_SECTION = 90;// 密码默认修改期间，单位天

	public static final String SYSTEM_SSESSION_MENU = "SESSIONMENU";

	public static final String SYSTEM_SSESSION_USERID = "SESSIONUSERID";

	/** 表单重复提交 **/
	public static final String FORM_RESUBMIT_STATE = "-3";

	public static final int SYSTEM_NORMAL_STATE_NEGATIVE = -1;
	public static final int SYSTEM_NORMAL_STATE_POSITIVE = 1;

	/**
	 * 数据字典
	 */
	public static final String SYSTEM_TYPEGROUP_ID_BTNMANAGER = "4";
	public static final String SYSTEM_TYPEGROUP_ID_BTNMENUICON = "menuicon";
	public static final String HTTPRESPONSE_STATE_ERROR = "-1";
	public static final String HTTPRESPONSE_STATE_TRUE = "1";
	public static final String HTTPRESPONSE_STATE_NO_DATA = "-4";

	// 全局map
	public static Map<String, String> GLOBAL_MAP = new ConcurrentHashMap<String, String>();
	// 行政区域map
	public static Map<String, Object> AREA_MAP = new ConcurrentHashMap<String, Object>();

	/**
	 * 系统比率常量
	 */
	public static final int SYSTEM_RATIO_CONSTANT = 100;

	/**
	 * 系统初始化密码
	 */
	public static final String SYSTEM_INIT_PASSWORD = "123456";

	/**
	 * 图片/文件配置
	 */
	public static final Long IMAGE_UPLOAD_SIZE_LIMIT = 5l; // 上传图片大小限制,单位M
	public static final String IMAGE_UPLOAD_ALLOW_EXTENDSIONS = "jpg,jpeg,bmp,gif,png";// 允许上传图片格式
	public static final String FILE_UPLOAD_ALLOW_EXTENDSIONS = "doc,docx,txt,xls,xlsx,pdf,ppt,pptx,zip,rar";// 允许上传图片格式

	/**
	 * 全局上传异常信息 -1:对不起，上传图片过大！请换其他图片 -2:对不起，不应许上传图片 -3:对不起，系统不支持您所上传图片的后缀名!
	 * -4:对不起，上传证件失败，请更换其他图片后重试!
	 */
	public final static String IMAGE_UPLAOD_SIZE_LIMIT = "-1";
	public final static String IMAGE_STOP_UPLOAD = "-2";
	public final static String IMAGE_EXTENDSION_UNSUPPORT = "-3";
	public final static String IMAGE_UPLOAD_ERROR = "-4";

	/**
	 * 广告图片类型 1.图片，2文字 3.flash
	 */
	public static final String AD_IMAGE_TYPE_PHOTO = "1";
	public static final String AD_IMAGE_TYPE_TXT = "2";
	public static final String AD_IMAGE_TYPE_FLASH = "3";

	/**
	 * 用户信息字典
	 */
	public static final String SESSION_KEY_OF_RAND_CODE = "sesssion_img_rand_code";

	public static final String USER_LOGIN_KICKEDOUT = "-6";
	public static final String USER_ROLE_REG_REPEAT = "-5";
	public static final String USER_REG_REPEAT = "-4";
	public static final String RANDOM_CODE_ERROR = "-3";
	public static final String USER_NAMEORPASS_ERROR = "-2";
	public static final String USER_LOGIN_NOTEXITS = "-1";
	public static final String USER_LOGIN_STATE_TRUE = "1";

	/**
	 * 用户信息正在审核中
	 */
	public static final String USER_LOGIN_STATE_REVIEW = "2";

	/**
	 * 系统认证状态 -1：未认证 1：已认证
	 */
	public static final String SYSTEM_STATE_NOTCERTIFIED = "-1";
	public static final String SYSTEM_STATE_VERIFIED = "1";

	public static final int QUERY_DATA_LIST_PAGE_SIZE = 10;
	public static final int QUERY_DATA_LIST_PAGE_MAX = 99999;
	public static final int QUERY_DATA_LIST_PAGE_ALL = -1; // 全部

	public static final String HTTPRESPONSE_STATE_ERROR_ROLE_REG_REPEAT = "-3";

	public final static String SESSION_KEY_OF_USER = "SESSIONUSER";
	public final static String COOKIE_KEY_OF_USERID = "COOKIEUSERID";

	/**
	 * 用户角色id 超级管理、管理员
	 */
	public static final String USER_ROLEID_SUPER = "40289f094f5db132014f5dc3e95d0002";

	/**
	 * 审核状态：-2:无效，-1:审核不通过，1:待审核 2：审查中 3:审核通过
	 */
	public static final int SYSTEM_STATE_INVALID = -2;
	public static final int SYSTEM_STATE_AUDITNOTPASS = -1;
	public static final int SYSTEM_STATE_REVIEW = 1;
	public static final int SYSTEM_STATE_PROCESSING = 2;
	public static final int SYSTEM_STATE_AUDITPASS = 3;

	/**
	 * 商品属性 录入方式 1 手动录入 2下拉框
	 */
	public static final String PRODUCT_INPUTTYPE_MANUAL = "1";
	public static final String PRODUCT_INPUTTYPE_SELECT = "2";

	/**
	 * 审核状态：-2:审核不通过，-1:待审核 1:审核通过
	 */
	public static final String STORE_STATE_REVIEW = "-1";
	public static final String STORE_STATE_AUDITNOTPASS = "-2";
	public static final String STORE_STATE_AUDITPASS = "1";

	/**
	 * 显示状态：-1:隐藏 1:显示
	 */
	public static final String PRODUCT_STATE_NOSHOW = "-1";
	public static final String PRODUCT_STATE_SHOW = "1";

	/**
	 * 用户类
	 */
	public static final String USER_STATE_LACK_OF_INTEGRAL = "-2";// 积分不足

	/**
	 * 用户分类 : 1:老人 2:子女
	 */
	public static final String USER_TYPE_OLDER = "1";
	public static final String USER_TYPE_CHILDREN = "2";

	/**
	 * 订单支付类型
	 */
	public static final String PAY_TYPE_ALIPAY = "1";// 支付宝
	public static final String PAY_TYPE_INTEGRAL = "2";// 积分

	/**
	 * 订单类型 1.商品订单 2陪诊 3护理 4康复 5名医坐堂 6专家预约 7养老院 8.康复院 9家政 10旅游，11文化活动 12.专属医生 13.康复院-其他
	 */
	public static final String ORDER_TYPE_PRODUCT = "1";
	public static final String ORDER_TYPE_CLINIC = "2";
	public static final String ORDER_TYPE_CARE = "3";
	public static final String ORDER_TYPE_REHABILITATION = "4";
	public static final String ORDER_TYPE_DISCUSSION = "5";
	public static final String ORDER_TYPE_RESERVATION = "6";
	public static final String ORDER_TYPE_NURSING = "7";
	public static final String ORDER_TYPE_REHABILITATION_HOSPITAL = "8";
	public static final String ORDER_TYPE_HOUSEKEEPING = "9";
	public static final String ORDER_TYPE_TOURISM = "10";
	public static final String ORDER_TYPE_ACTIVITY = "11";
	public static final String ORDER_TYPE_EXCLUSIVEDOCTOR = "12";
	public static final String ORDER_TYPE_REHABILITATION_OTHER = "13";
	public static final String ORDER_TYPE_RECHARGE = "14";

	/**
	 * 热推类型 1.商品订单 2陪诊 3护理 4康复 5名医坐堂 6专家预约 7养老院 8.康复院 9家政 10旅游，11文化活动 12.专属医生 13.康复院-其他
	 */
	public static final String RECOMMEND_TYPE_PRODUCT = "1";
	public static final String RECOMMEND_TYPE_CLINIC = "2";
	public static final String RECOMMEND_TYPE_CARE = "3";
	public static final String RECOMMEND_TYPE_REHABILITATION = "4";
	public static final String RECOMMEND_TYPE_DISCUSSION = "5";
	public static final String RECOMMEND_TYPE_RESERVATION = "6";
	public static final String RECOMMEND_TYPE_NURSING = "7";
	public static final String RECOMMEND_TYPE_REHABILITATION_HOSPITAL = "8";
	public static final String RECOMMEND_TYPE_HOUSEKEEPING = "9";
	public static final String RECOMMEND_TYPE_TOURISM = "10";
	public static final String RECOMMEND_TYPE_ACTIVITY = "11";
	public static final String RECOMMEND_TYPE_EXCLUSIVEDOCTOR = "12";
	public static final String RECOMMEND_REHABILITATION_OTHER = "13";

	/**
	 * (产品) -5.退款失败 -4.已退款 -3.退款申请中 -2.已取消 -1.新建 1.已支付 2.待发货 3.已发货 8.已完成 9.已评价
	 * (服务) -5.退款失败 -4.退款已审核 -3.退款申请中 -2.取消 -1.未付款 1.待服务 3.服务中 8.已服务 9.已评价
	 */
	public static final String ORDER_STATE_REFUND_FAIL = "-5";
	public static final String ORDER_STATE_REFUND_SUCCESS = "-4";
	public static final String ORDER_STATE_REFUND_APPLY = "-3";
	public static final String ORDER_STATE_CANCEL = "-2";
	public static final String ORDER_STATE_CREATE = "-1";
	public static final String ORDER_STATE_PAYMENT = "1";
	public static final String ORDER_STATE_REVIEWDELIVERY = "2";
	public static final String ORDER_STATE_SERVING = "3";
	public static final String ORDER_STATE_COMPLETED = "8";
	public static final String ORDER_STATE_EVALUATED = "9";

	/**
	 * 活动分类
	 */
	public static final String ACTIVITY_TYPE_PANIC = "panic";
	public static final String ACTIVITY_TYPE_ORDER_PROMOTION = "order_promotion";
	public static final String ACTIVITY_TYPE_GROUP = "group";
	public static final String ACTIVITY_TYPE_PROMOTION = "promotion";

	/**
	 * 产品分类-状态 -1不显示 1显示
	 */
	public static final String PRODUCTCATEGORY_STATE_HIDDEN = "-1";
	public static final String PRODUCTCATEGORY_STATE_SHOW = "1";

	/**
	 * 医院-状态 -1下线 1上线
	 */
	public static final String HOSPITAL_STATE_HIDDEN = "-1";
	public static final String HOSPITAL_STATE_SHOW = "1";

	/**
	 * 产品分类-导航是否显示Y/N
	 */
	public static final String PRODUCTCATEGORY_NAVDISPLAY_YES = "Y";
	public static final String PRODUCTCATEGORY_NAVDISPLAY_NO = "N";

	/**
	 * 产品分类-是否推荐 Y/N
	 */
	public static final String PRODUCTCATEGORY_ISRECOMMEND_YES = "Y";
	public static final String PRODUCTCATEGORY_ISRECOMMEND_NO = "N";

	/**
	 * 产品状态：-1新建 1审核通过 -2审核不通过 2上线 -3下线
	 */
	public static final String PRODUCR_STATE_OFFLINE = "-3";
	public static final String PRODUCR_STATE_NOTPASS = "-2";
	public static final String PRODUCR_STATE_NEW = "-1";
	public static final String PRODUCR_STATE_AUDITPASS = "1";
	public static final String PRODUCR_STATE_ONLINE = "2";

	/**
	 * 产品 是否是热品
	 */
	public static final String PRODUCR_ISHOT_YES = "Y";
	public static final String PRODUCR_ISHOT_NO = "N";

	/**
	 * 产品 是否是新品 Y/N
	 */
	public static final String PRODUCR_ISNEW_YES = "Y";
	public static final String PRODUCR_ISNEW_NO = "N";

	/**
	 * 产品 是否推荐 Y/N
	 */
	public static final String PRODUCR_ISRECOMMEND_YES = "Y";
	public static final String PRODUCR_ISRECOMMEND_NO = "N";

	/**
	 * 产品关键字状态
	 */
	public static final String KEYWORD_STATE_NEGATIVE = "-1";
	public static final String KEYWORD_STATE_POSITIVE = "1";

	/**
	 * 产品关键字是否导航栏显示
	 */
	public static final String KEYWORD_NAV_DISPLAY_YES = "Y";
	public static final String KEYWORD_NAV_DISPLAY_NO = "N";

	/**
	 * 关键字类型 1.热词，2病症 3，社区技能
	 */
	public static final String KEYWORD_TYPE_HOTWORD = "1";
	public static final String KEYWORD_TYPE_DISEASE = "2";
	public static final String KEYWORD_TYPE_COMMUNITYSKILL = "3";

	/**
	 * 产品广告 -1：隐藏 1：显示
	 */
	public static final String AD_STATE_NEGATIVE = "-1";
	public static final String AD_STATE_POSITIVE = "1";

	/**
	 * 专利请求状态 -3:数据已存在
	 */
	public static final String PATENT_DATA_EXITS = "-3";

	/**
	 * 用户收藏类型 1商品、2店铺、3求购
	 */
	public static final String USER_COLLECT_TYPE_PRODUCT = "1";
	public static final String USER_COLLECT_TYPE_STORE = "2";
	public static final String USER_COLLECT_TYPE_POST = "3";

	/**
	 * 收藏状态 Y:是 N:否
	 */
	public static final String ISCOLLECTED_STATE_YES = "Y";
	public static final String ISCOLLECTED_STATE_NO = "N";

	/**
	 * 指令类型 1.总部指令 2团队指令 3sos指令
	 */
	public static final String INSTRUCT_TYPE_HEADORDER = "1";
	public static final String INSTRUCT_TYPE_TEAMORDER = "2";
	public static final String INSTRUCT_TYPE_SOSORDER = "3";

	/**
	 * 收取指令用户 -1新建 1已读 2已处理
	 */
	public static final String INSTRUCT_USER_STATE_NEW = "-1";
	public static final String INSTRUCT_USER_STATE_READ = "1";
	public static final String INSTRUCT_USER_STATE_DEALED = "2";

	/**
	 * 收取指令用户类型 1.子女或者老人 2.系统管理员 3.社区用户
	 */
	public static final String INSTRUCT_USER_TYPE_USER = "1";
	public static final String INSTRUCT_USER_TYPE_SYSTEMUSER = "2";
	public static final String INSTRUCT_USER_TYPE_COMMUNITYUSER = "3";

	/**
	 * 用户状态(是否会员) Y:是 N:否
	 */
	public static final String ISMEMBER_STATE_YES = "Y";
	public static final String ISMEMBER_STATE_NO = "N";

	/**
	 * 默认非会员等级(普通用户)
	 */
	public static final Integer ISMEMBER_LEVEL_NO = -1;

	/**
	 * 老人行为子女是否可见 Y:是 N:否
	 */
	public static final String ISBEHAVIOR_RECORD_VISIABLE_YES = "Y";
	public static final String ISBEHAVIOR_RECORD_VISIABLE_NO = "N";

	/**
	 * 老人消息推送子女是否可见 Y:是 N:否
	 */
	public static final String ISPUSH_MESSAGE_VISIABLE_YES = "Y";
	public static final String ISPUSH_MESSAGE_VISIABLE_NO = "N";

	/**
	 * 会员状态：-1:新建 1:通过
	 */
	public static final String MEMBERAPPLY_STATE_REVIEW = "-1";
	public static final String MEMBERAPPLY_STATE_AUDITPASS = "1";

	/**
	 * 关联关系状态 -1：待确认 1:已确认 -2：拒绝(删除)
	 */
	public static final String RELATION_STATE_APPLYING = "-1";
	public static final String RELATION_STATE_CONFIRMED = "1";
	public static final String RELATION_STATE_REFUSED = "-2";

	/**
	 * 供应商类型 1.商品 (2陪诊 3护理 4康复 5名医坐堂 6专家预约 7,养老院 8.康复院 9家政)-服务 10旅游，11活动
	 */
	public static final String SUPPLIER_TYPE_PRODUCT = "1";
	public static final String SUPPLIER_TYPE_CLINIC = "2";
	public static final String SUPPLIER_TYPE_CARE = "3";
	public static final String SUPPLIER_TYPE_REHABILITATION = "4";
	public static final String SUPPLIER_TYPE_DISCUSSION = "5";
	public static final String SUPPLIER_TYPE_RESERVATION = "6";
	public static final String SUPPLIER_TYPE_NURSING = "7";
	public static final String SUPPLIER_TYPE_REHABILITATION_HOSPITAL = "8";
	public static final String SUPPLIER_TYPE_HOUSEKEEPING = "9";
	public static final String SUPPLIER_TYPE_TOURISM = "10";
	public static final String SUPPLIER_TYPE_ACTIVITY = "11";

	/**
	 * 供应商状态 1:上线 -1:下线
	 */
	public static final String SUPPLIER_STATE_OFFLINE = "-1";
	public static final String SUPPLIER_STATE_ONLINE = "1";

	/**
	 * 供应商审核状态 -1：待审核 1：审核通过 -2：审核不通过
	 */
	public static final String SUPPLIER_STATE_NOTPASS = "-2";
	public static final String SUPPLIER_STATE_NEW = "-1";
	public static final String SUPPLIER_STATE_AUDITPASS = "1";

	/**
	 * 浏览类型1.商品订单 (2陪诊 3护理 4康复 5名医坐堂 6专家预约 7.养老院 8.康复院 9家政)-服务 10旅游，11活动
	 */
	public static final String USERBROWSE_TYPE_PRODUCT = "1";
	public static final String USERBROWSE_TYPE_CLINIC = "2";
	public static final String USERBROWSE_TYPE_CARE = "3";
	public static final String USERBROWSE_TYPE_REHABILITATION = "4";
	public static final String USERBROWSE_TYPE_DISCUSSION = "5";
	public static final String USERBROWSE_TYPE_RESERVATION = "6";
	public static final String USERBROWSE_TYPE_NURSING = "7";
	public static final String USERBROWSE_TYPE_REHABILITATION_HOSPITAL = "8";
	public static final String USERBROWSE_TYPE_HOUSEKEEPING = "9";
	public static final String USERBROWSE_TYPE_TOURISM = "10";
	public static final String USERBROWSE_TYPE_ACTIVITY = "11";

	/**
	 * 生活信息类型 type 1:热门推荐 2:会员专享 3:生活讯息 4:2和3的集合
	 */
	public static final String INFO_NEWS_TYPE_HOT = "1";
	public static final String INFO_NEWS_TYPE_VIP = "2";
	public static final String INFO_NEWS_TYPE_MESSAGE = "3";
	public static final String INFO_NEWS_TYPE_GATHER = "4";

	/**
	 * 生活信息状态 state -2:无效 -1: 下线 1: 上线
	 */
	public static final String INFO_NEWS_STATE_INVALID = "-2";
	public static final String INFO_NEWS_STATE_OFFLINE = "-1";
	public static final String INFO_NEWS_STATE_ONLINE = "1";

	/**
	 * 注册类型 1:个人 2:企业
	 */
	public static final String IDENTIFY_TYPE_PERSON = "1";
	public static final String IDENTIFY_TYPE_COMPANY = "2";

	/**
	 * 用户专属医生关系 -1:历史医生 1:当前医生
	 */
	public static final String EXCLUSIVEDOCTOR_STATE_OLD = "-1";
	public static final String EXCLUSIVEDOCTOR_STATE_NEW = "1";

	/**
	 * 用户地址是否默认 Y:默认地址 N：非默认地址
	 */
	public static final String USERADDRESS_DEFAULT = "Y";
	public static final String USERADDRESS_NODEFAULT = "N";

	/**
	 * 首页banner 1:老人端首页(资讯) 2:老人端生活信息(资讯) 3:子女端社交首页(包括旅游信息和兴趣活动) 4:子女端医疗服务(服务)
	 * 5:人生记录
	 */
	public static final String BANNER_TYPE_OLD_HOME = "1";
	public static final String BANNER_TYPE_OLD_INFO = "2";
	public static final String BANNER_TYPE_CHILDREN_HOME = "3";
	public static final String BANNER_TYPE_CHILDREN_SERVER = "4";
	public static final String BANNER_TYPE_LIFE_RECORD = "5";
	public static final String BANNER_TYPE_CHILDREN_PUSH = "6";

	/**
	 * 专家预约设置 预约时间类型 1-上午 2-下午
	 */
	public static final String PROFESSOR_DATETYPE_AM = "1";
	public static final String PROFESSOR_DATETYPE_PM = "2";

	/**
	 * 用户提醒类型：1：老人提醒 2：子女提醒 3：社区用户提醒 4：商户提醒
	 */
	public static final String REMIND_USER_TYPE_OLD = "1";
	public static final String REMIND_USER_TYPE_CHILD = "2";
	public static final String REMIND_USER_TYPE_COMMUNITY = "3";
	public static final String REMIND_USER_TYPE_SUPPLIER = "4";

	/**
	 * 消息推送类型：1：SOS 2：提醒 3：指令 4：系统 5：其他
	 */
	public static final String MESSAGE_PUSH_TYPE_SOS = "1";
	public static final String MESSAGE_PUSH_TYPE_REMIND = "2";
	public static final String MESSAGE_PUSH_TYPE_INSTRUCT = "3";
	public static final String MESSAGE_PUSH_TYPE_SYSTEM = "4";
	public static final String MESSAGE_PUSH_TYPE_OTHER = "5";

	/**
	 * 用户轨迹类型：1：老人 2：子女 3：社区用户 4：供应商用户
	 */
	public static final String LATLNG_USER_TYPE_OLD = "1";
	public static final String LATLNG_USER_TYPE_CHILD = "2";
	public static final String LATLNG_USER_TYPE_COMMUNITY = "3";
	public static final String LATLNG_USER_TYPE_SUPPLIER = "4";

	/**
	 * 预约专家是否支付 ispay
	 */
	public static final String PROFESSOR_TIMESET_ISPAY_YES = "Y";
	public static final String PROFESSOR_TIMESET_ISPAY_NO = "N";

	/**
	 * 预约专家预约状态 ispay -2:未设置 -1:全天有空 1:上午有空 2:下午有空 3:全天没空
	 */
	public static final String PROFESSOR_TIMESET_DAYSTATE_NOSET = "-2";
	public static final String PROFESSOR_TIMESET_DAYSTATE_ALLFREE = "-1";
	public static final String PROFESSOR_TIMESET_DAYSTATE_AM = "1";
	public static final String PROFESSOR_TIMESET_DAYSTATE_PM = "2";
	public static final String PROFESSOR_TIMESET_DAYSTATE_NOTIME = "3";

	/**
	 * 会员申请/人生轨迹申请状态 -1：待处理 1：已处理
	 */
	public static final String USER_APPLY_STATE_NEW = "-1";
	public static final String USER_APPLY_STATE_DONE = "1";

	/**
	 * 申请类型 1:会员申请 2：人生轨迹申请
	 */
	public static final String USER_APPLY_TYPE_MEMBER = "1";
	public static final String USER_APPLY_TYPE_LIFEPATH = "2";

	public static final String GETUI_PULLTYPE = "olderWarn";
	
	/**
	 * 广告类型 1:产品 2:养老院 3:康复医院 4:专家管理 5:专属医生 6:陪诊服务 7:上门护理 8:上门康复 9:家政 10:旅游 11:文章 12:名医坐堂
	 */
	public static final String AD_TYPE_PRODUCT = "1";
	public static final String AD_TYPE_NURSING = "2";
	public static final String AD_TYPE_REHABILITATION_HOSPITAL = "3";
	public static final String AD_TYPE_PROFESSOR = "4";
	public static final String AD_TYPE_EXCLUSIVEDOCTOR = "5";
	public static final String AD_TYPE_CLINIC = "6";
	public static final String AD_TYPE_CARE = "7";
	public static final String AD_TYPE_REHABILITATION = "8";
	public static final String AD_TYPE_HOUSEKEEPING = "9";
	public static final String AD_TYPE_TOURISM = "10";
	public static final String AD_TYPE_ARTCLE = "11";
	public static final String AD_TYPE_ACTIVITY_PROFESSOR = "12";

	/**
	 * 健康专业报告 类型：1-随访记录 2-体检记录 3-住院病历 4-专属医生
	 */
	public static final String HEALTH_REPORT_TYPE_FOLLOWUP = "1";
	public static final String HEALTH_REPORT_TYPE_EXAM = "2";
	public static final String HEALTH_REPORT_TYPE_ADMISSION = "3";
	public static final String HEALTH_REPORT_TYPE_EXCLUSIVE = "4";

	/**
	 * 健康数据统计 类型:1-血糖 2-血压 3-心率 4-BMI
	 */
	public static final String HEALTH_STATISTICS_TYPE_BLOOD_SUGAR = "1";
	public static final String HEALTH_STATISTICS_TYPE_BLOOD_PRESSURE = "2";
	public static final String HEALTH_STATISTICS_TYPE_HEART_RATE = "3";
	public static final String HEALTH_STATISTICS_TYPE_BMI = "4";
	
	/**
	 * 图片上传相关
	 */
	public static final String IMGIP = "http://119.23.56.10:9082";
	public static final String IMGPATH = "/usr/local/file/mhsh/";

	/**
	 * 状态 -1不显示 1显示
	 */
	public static final String STATE_HIDDEN = "-1";
	public static final String STATE_SHOW = "1";
	
	/**
	 * 短信平台相关
	 */
	public static final String SMS_URL = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	public static final String SMS_ACCOUNT = "C14277180";
	public static final String SMS_PASSWORD = "b2b85b609ec5620ee8ca4cea38ab1a62";
	public static final String SMS_REDIS_ALIVE = "600";
	
	/**
	 * 支付宝-银行卡信息查询
	 */
	public static final String BANK_ASCRIPTION = "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=%s&cardBinCheck=true";
	public static final String BANK_LOGO = "https://apimg.alipay.com/combo.png?d=cashier&t=%s";
	
	/**
	 *系统参数配置相关name
	 */
	//订单
	public static final String DICT_NAME_ORDER_RATE = "dict.name.order.rate";//利率name
	public static final String DICT_NAME_ORDER_BACK_CARD = "dict.name.order.back.card";//还款开户行账号name
	public static final String DICT_NAME_ORDER_BACK_BANK = "dict.name.order.back.bank";//还款开户行name
	public static final String DICT_NAME_ORDER_BACK_ACCOUNT = "dict.name.order.back.account";//还款开户账户name
	public static final String DICT_NAME_ORDER_BTC_RMB = "dict.name.order.btc.rmb";//比特币人民币汇率
	public static final String DICT_NAME_ORDER_ADDBTC_COEFFICIENT = "dict.name.order.addbtc.coefficient";//押比特币系数
	
	
}
