//
//  PRNaviTabManager.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/6/12.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    kSegNormal = 0,
    kSegStore = 1,
} SegTabType;

static float kNaviMargin  = 12.5;    // 导航条文字间距
static float kNaviLeftRightMargin  = 15.f;    // 导航条文字间距

static float kStoreIconHeight  = 28.f;    // 书城图片title占位图高度
static NSString *kStoreTitleSeparator  = @"\r";    // 书城文字title分隔符
static NSString *kStoreIconPrefix  = @"StoreIconPre_";    // 书城图片title分隔符前缀
static NSString *kStoreIconSeparator  = @"<0Separator0>";    // 书城图片title间隔符

@class PRTriangleCaptionBtn;
@interface PRNaviTabManager : NSObject

+(instancetype)shared;

+(PRTriangleCaptionBtn *)configSegmentButton:(NSString *)oriTitleString;

-(NSDictionary *)calculateTitleWidthinfo:(NSMutableArray *)TitleArray cache:(BOOL)cache Completion:(void(^)(NSDictionary *widthDict))completion;

@end

