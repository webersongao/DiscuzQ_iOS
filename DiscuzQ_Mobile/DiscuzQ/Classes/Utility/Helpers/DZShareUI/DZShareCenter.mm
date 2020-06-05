//
//  DZShareCenter.m
//  DiscuzQ
//
//  Created by WebersonGao on 2018/9/27.
//

#import "DZShareCenter.h"
#import "DZDefaultShareView.h"

@implementation DZShareCenter

/**
 直接掉起 分享
 */
+(void)shareActionWithModel:(DZShareModel *)model{
    
    [DZDefaultShareView showDefaultShareViewFromModel:model];
}

/**
 (内部私用) 分享点击方法
 
 @param model 原始数据
 @param shareType 分享渠道
 */
+ (void)shareButtonActionWithType:(DQShareType)shareType model:(DZShareModel *)model{
    
    switch (shareType) {
        case DQShareQQFriend:
        {
            [[self class] shareToQQFriendClick:model];
        }
            break;
        case DQShareQQSocial:
        {
            [[self class] shareToQQZoneClick:model];
        }
            break;
        case DQShareWeiXinFriend:
        {
            [[self class] shareToWeixinFriendClick:model];
        }
            break;
        case DQShareWeiXinSocial:
        {
            [[self class] shareToWeixinTimelineClick:model];
        }
            break;
        case DQShareWeibo:
        {
            [[self class] shareToWeiboClickWithNative:model];
        }
            break;
        case DQShareLink:
        {
            [[self class] shareToThreadOrOtherLinkUrl:model];
        }
            break;
            
        default:
            break;
    }
    
}






/* ******************  分享按钮点击  ******************** */
/// 分享微信好友
+(void)shareToWeixinFriendClick:(DZShareModel *)model{
    
    
}

//分享微信朋友圈
+(void)shareToWeixinTimelineClick:(DZShareModel *)model{
    
}

//分享QQ好友
+(void)shareToQQFriendClick:(DZShareModel *)model{
    
}

//分享QQ空间
+(void)shareToQQZoneClick:(DZShareModel *)model{
    
}

//分享到微博
+(void)shareToWeiboClickWithNative:(DZShareModel *)model{
    
}

// 分享 链接
+(void)shareToThreadOrOtherLinkUrl:(DZShareModel *)model{
    
    NSString *shareToUrl = checkNull(model.url);
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    
    [pasteBoard setString:shareToUrl];
    
    if (pasteBoard.string.length < 1) {
        [DZMobileCtrl showAlertError:@"复制失败"];
    }else{
        [DZMobileCtrl showAlertSuccess:@"复制成功"];
    }
}





@end
