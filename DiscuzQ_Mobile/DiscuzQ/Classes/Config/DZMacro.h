//
//  DZMacro.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/6.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#ifndef DZMacro_h
#define DZMacro_h

#import "PRLayouter.h"
#import "DZQDelegate.h"

#pragma mark - app名称

#define KNowYear [[NSDate date] stringFromDateFormat:@"yyyy"]

#define KWEAKSELF __weak typeof(self) weakSelf = self;
#define STRONGSELF __strong typeof(weakSelf) strongSelf = weakSelf;

#define KScreenBounds [[UIScreen mainScreen] bounds]
#define KWidthScale(value)  ((value)*(KScreenWidth/375.0))
#define KHeightScale(value) ((value)*(KScreenHeight/667.0))
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#define kMargin5   5.0
#define kMargin10   10.0
#define kMargin13   13.0
#define kMargin15   15.0
#define kMargin20   20.0
#define kMargin25   25.0
#define kMargin30   30.0
#define kMargin35   35.0
#define kMargin40   40.0
#define kMargin45   45.0
#define kMargin50   50.0
#define kMargin59   59.0
#define kMargin60   60.0
#define K_input_Height 50  /// 输入框高度
#define kMiniBarHeight   35.0 /// 35.0
#define kToolBarHeight   44.0
#define KCenterBarHeight 49.0  // 常用 状态条 工具条 高度
#define kCellHeight_50   50.0
#define kCellHeight_54   54.0
#define kCellHeight_55   55.0
#define kCellHeight_60   60.0
#define kCellHeight_65   65.0
#define kCellHeight_70   70.0
#define kCellHeight_80   80.0

#define kHeaderHeight_80    80.0
#define kHeaderHeight_100   100.0
#define kHeaderHeight_120   120.0

/**
 * iPhone X Screen Insets
 */
#define IS_iPhoneX [PRLayouter is_iPhoneX]
#define IS_Iphone4S  (KScreenHeight == 480 ? YES : NO)
#define IS_Iphone5S (KScreenHeight==568)
#define IS_Iphone6 (KScreenHeight==667)
#define IS_IphonePlus (KScreenHeight==736)
#define IS_IphoneXMax (KScreenHeight==896)
// nav
#define KStatusBarHeight [PRLayouter statusBarHeight]  //  竖屏 状态条 X: 44 N: 20
#define KNavigation_Bar_Height [PRLayouter navigation_Bar_Height_Portrait] // X: 横竖屏44 N: 横竖屏44
#define KNavi_ContainStatusBar_Height [PRLayouter navigation_Bar_ContainStatusBar_Height] // X: 竖屏88 横屏64 N: 横竖屏64
#define KNavigation_Bar_Gap  [PRLayouter navigation_Bar_Gap_2X] // X: 竖屏24
#define KContent_OringY (KNavi_ContainStatusBar_Height + 1)// vc里面内容Y坐标
#define KView_OutNavi_Bounds   CGRectMake(0,KNavi_ContainStatusBar_Height,KScreenWidth,KScreenHeight-KNavi_ContainStatusBar_Height)
#define KView_OutTab_Bounds   CGRectMake(0,0,KScreenWidth,KScreenHeight-KTabbar_Height)
#define KView_OutNaviTab_Bounds   CGRectMake(0,KNavi_ContainStatusBar_Height,KScreenWidth,KScreenHeight-KTabbar_Height-KNavi_ContainStatusBar_Height)


// tab
#define KTabbar_Height  [PRLayouter tabbar_Height] // X: 竖屏83 横屏70
#define KTabbar_Gap  [PRLayouter tabbar_Gap_2X] // X: 竖屏34 横屏21
#define KTabbar_Gap_top  KScreenHeight - [PRLayouter tabbar_Gap_2X] //
#define KTabbar_Height_top  KScreenHeight - [PRLayouter tabbar_Height] //
#define KBottom_Height_X [PRLayouter bottom_Height_X] // X: 49+21

#define KImageNamed(NamePointer) [UIImage imageNamed:(NamePointer)]
#define KNibName(name)   [UINib nibWithNibName:(name) bundle:[NSBundle mainBundle]]
#define KURLString(urlString) [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlString]]


//G－C－D
#define KBack_ThreadBlock(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define KMain_ThreadBlock(block) dispatch_async(dispatch_get_main_queue(),block)

#ifdef DEBUG
#define KSLog(...)   NSLog(__VA_ARGS__)
#else
#define KSLog( s, ... )
#endif

///  常用方法
#define KSelect(condition, vTrue, vFalse)            ((condition) ? (vTrue) : (vFalse))
#define KBetween(value, minValue, maxValue)          ((value) > (minValue) && (value) < (maxValue))
#define KBetween_with(value, minValue, maxValue)     ((value) >= (minValue) && (value) <= (maxValue))


// 国际化 字符创
#define _(x) [LocalStringUtil localString:x]
#define checkIntegerStr(__X__)  __X__ == 0 ? @"" : [NSString stringWithFormat:@"%ld",__X__]
#define checkInteger(__X__)     [NSString stringWithFormat:@"%ld",__X__]
#define checkFloat(__X__)       [NSString stringWithFormat:@"%.2f",__X__]
#define checkStr(__X__)             [NSString stringWithFormat:@"%@",__X__]
#define checkTwoStr(X,Y)        [NSString stringWithFormat:@"%@%@",X,Y]
#define checkNull(__X__)        (__X__) == nil || [(__X__) isEqual:[NSNull null]] ? @"" : [NSString stringWithFormat:@"%@", (__X__)]
#define kAPPDelegate    ((DZQDelegate *)[[UIApplication sharedApplication] delegate])

// 判断系统版本
#define  iOS10   ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0)
#define  iOS11   ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0)

#define phoneScale (int)[UIScreen mainScreen].scale
#pragma mark - 判断屏幕适配 ============================================
#define iPhone320 KScreenWidth == 320
#define iPhone375 KScreenWidth == 375
#define iPhone414 KScreenWidth == 414

#define StatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define SafeAreaTopHeight ((KScreenHeight >= 812.0) && [[UIDevice currentDevice].model isEqualToString:@"iPhone"] ? 88 : 64)
//#define SafeAreaBottomHeight ((KScreenHeight >= 812.0) && [[UIDevice currentDevice].model isEqualToString:@"iPhone"]  ? 30 : 0)
#define DZNetError(_domain, _code, _desc)   [NSError errorWithDomain:checkNull(_domain) code:(_code) userInfo:@{NSLocalizedFailureReasonErrorKey : (checkNull(_desc).length ? checkNull(_desc) : @"网络错误，请稍后再试")}]

typedef void(^backNoneBlock)(void);
typedef void(^backStateBlock)(id data,BOOL bSuccess);
typedef void(^backStringBlock)(NSString * String);
typedef void(^backArrayBlock)(NSArray * Array);
typedef void(^backSetBlock)(NSSet * setArr);
typedef void(^backIndexPathBlock)(NSIndexPath * indexPath);
typedef void(^backSizeBlock)(CGSize size);
typedef void(^backBoolBlock)(BOOL boolState);
typedef void(^completeBoolBlock)(BOOL bSuccess);
typedef void(^backButtonBlock)(UIButton * button);
typedef void(^backIntegerBlock)(NSInteger index);
typedef void(^backDictionaryBlock)(NSDictionary * Dictionary);
typedef void(^backArraySizeBlock)(NSArray * Array,int64_t allSize);

typedef void(^completeBlock)(id data,NSError *error);
typedef void(^ProgressBlock)(double Progress,NSError *error);


#pragma mark - 通知 ================================================

// tabbar个人中心选中
#define DZ_ConfigSelectedIndex_Notify   @"selec7tIndexNot8ify"
// 连续点击tabbar刷新
#define DZ_TabbarRefresh_Notify         @"TabbarButt3onClickDidRepeatNotification"
// 刷新个人中心资料
#define DZ_RefreshUserCenter_Notify     @"getUser6Ziliao"
#define DZ_UserSigOut_Notify            @"llogOUT4NOTIFY"
// 点中statusbar
#define DZ_StatusBarTap_Notify          @"statuBarTappedNotification"
// 防止首次加载APP的时候没有数据，划过导航页面的时候刷新一次
#define DZ_FirstLaunchApp_Notify        @"APPFIRSTLanch"

// 首次请求帖子列表的时候通知
#define DZ_ThreadListFirstReload_Notify @"THREADLIST3FISTREQUEST"
// 使用DZContainerController控件，请求的时候
#define DZ_ContainerRequest_Notify      @"DZCONTAsas24INERQUEST"

// 登录后刷新一些页面，获取cookie或者formhash
#define DZ_RefreshWeb_Notify            @"refreshL9ocalWeb"
#define DZ_LoginedRefreshInfo_Notify    @"LOGINEndRefreshGetInfo"
#define DZ_CollectionInfoRefresh_Notify @"COLLECTIO6NFORUMREFRESH"

#define DZ_DomainUrlChange_Notify       @"DomainN4ameChange"
#define DZ_UserLogin_Notify             @"user9LoginNotification"



/// 播放器view的tag，列表中UI控件唯一tag值
#define kPlayerViewTag      20070301
#define KShadowAlert_Tag    18111301 // 通用的 ShadowAletView 的弹窗默认tag














#endif /* DZMacro_h */
