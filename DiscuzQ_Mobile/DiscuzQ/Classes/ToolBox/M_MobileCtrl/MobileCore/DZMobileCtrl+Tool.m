//
//  DZMobileCtrl+Tool.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/25.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZMobileCtrl+Tool.h"

@implementation DZMobileCtrl (Tool)


+(void)postNotification:(NSString *)name obj:(id)obj userinfo:(NSDictionary *)info{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:info];
}

+(void)addObserver:(id)observer sel:(SEL)selName name:(NSString *)name{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selName name:name object:nil];
}

// 复制 文字到粘贴板
+(void)PasteLocalBoardWithString:(NSString *)strUrl{
    
    NSString *shareToUrl = checkNull(strUrl);
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    
    [pasteBoard setString:shareToUrl];
    
    if (pasteBoard.string.length < 1) {
        [DZMobileCtrl showAlertError:@"复制失败"];
    }else{
        [DZMobileCtrl showAlertSuccess:@"复制成功"];
    }
}

@end
