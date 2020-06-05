//
//  DZNotiItem.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/11.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNotiItem.h"

@implementation DZNotiItem

- (instancetype)initWithNotiType:(NSString *)NotiType count:(NSInteger)count{
    
    self = [super init];
    if (self) {
        self.count = count;
        self.NotiType = NotiType;
        self.noti_Name = [self nameWithType:NotiType];
        self.noti_icon = [self iconWithType:NotiType];
    }
    return self;
}


-(NSString *)nameWithType:(NSString *)NotiType{
    
    NSString *nameStr = nil;
    if ([NotiType isEqualToString:DZMList_System]) {
        nameStr = @"系统通知";
    }else if ([NotiType isEqualToString:DZMList_reply]){
        nameStr = @"回复我的";
    }else if ([NotiType isEqualToString:DZMList_like]){
        nameStr = @"点赞我的";
    }else if ([NotiType isEqualToString:DZMList_reward]){
        nameStr = @"打赏我的";
    }else if ([NotiType isEqualToString:DZMList_relate]){
        nameStr = @"@我的";
    }else if ([NotiType isEqualToString:DZMList_withdrawal]){
        nameStr = @"提现通知";
    }
    
    return nameStr;
}

-(NSString *)iconWithType:(NSString *)NotiType{
    
    NSString *iconStr = nil;
    if ([NotiType isEqualToString:DZMList_System]) {
        iconStr = DZQ_icon;
    }else if ([NotiType isEqualToString:DZMList_reply]){
        iconStr = DZQ_icon;
    }else if ([NotiType isEqualToString:DZMList_like]){
        iconStr = DZQ_icon;
    }else if ([NotiType isEqualToString:DZMList_reward]){
        iconStr = DZQ_icon;
    }else if ([NotiType isEqualToString:DZMList_relate]){
        iconStr = DZQ_icon;
    }else if ([NotiType isEqualToString:DZMList_withdrawal]){
        iconStr = DZQ_icon;
    }
    
    return iconStr;
}

@end
