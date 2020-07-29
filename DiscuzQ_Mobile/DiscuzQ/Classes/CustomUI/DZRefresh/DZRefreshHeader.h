//
//  PRRefreshHeader.h
//  DiscuzQ
//
//  Created by Perfect on 2018/3/30.
//

#import "MJRefreshGifHeader.h"

typedef NS_ENUM(NSUInteger, DZRefreshHeaderMode) {
    DZRefreshHeaderModeDefault = 0, // 默认样式（书城那种）
    DZRefreshHeaderModeSimple, // 简单样式（只有个抖猫头像）
};

@interface DZRefreshHeader : MJRefreshGifHeader


- (void)checkRestartLoadingAnimation;
+ (instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action mode:(DZRefreshHeaderMode)mode;

@end
