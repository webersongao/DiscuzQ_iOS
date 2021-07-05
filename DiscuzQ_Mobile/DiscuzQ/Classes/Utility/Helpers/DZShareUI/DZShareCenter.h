//
//  DZShareCenter.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/27.
//

#import <Foundation/Foundation.h>
#import "DZSDKCenter.h"
#import "DZShareModel.h"

typedef NS_ENUM(NSInteger, DQShareType)
{
    DQShareNone = 0,
    DQShareWeiXinFriend = 1,  //微信好友
    DQShareWeiXinSocial = 2,  //微信朋友圈
    DQShareQQFriend = 3,  //QQ 好友
    DQShareQQSocial = 4,  // QQ空间
    DQShareWeibo = 5,  // 微博
    DQShareLink = 6,  // 分享链接
};

@interface DZShareCenter : NSObject

/**
 直接掉起 分享
 */
+(void)shareActionWithModel:(DZShareModel *)model;
/**
 直接掉起 分享 帖子主题
 */
+(void)shareActionWithThreadModel:(DZQDataThread *)dataThread;

/**
 (内部私用) 分享点击方法

 @param model 原始数据
 @param shareType 分享渠道
 */
+ (void)rightButtonActionWithType:(DQShareType)shareType model:(DZShareModel *)model;




@end
