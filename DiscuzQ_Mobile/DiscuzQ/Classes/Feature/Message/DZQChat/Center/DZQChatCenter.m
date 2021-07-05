//
//  DZQChatCenter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatCenter.h"
#import "DZQChatMsgLayout.h"
#import "DZQChatLocationController.h"
#import "DZQChatMapController.h"

@implementation DZQChatCenter


+(void)pushToChatMapController:(DZQChatMsgLayout *)layout{
 
    DZQChatMapController *mapVC = [[DZQChatMapController alloc] initWithMsgLayout:layout];
    [[DZMobileCtrl sharedCtrl] PushToController:mapVC];
    
}

+(void)pushToChatLocationCtrl:(backDictionaryBlock)block{

    DZQChatLocationController *localVC = [DZQChatLocationController new];
    localVC.locationBlock = ^(NSDictionary *locationDic, NSError *error) {
        if (block) {
            block(locationDic);
        }
    };
    [[DZMobileCtrl sharedCtrl] PushToController:localVC];
    
}

@end
