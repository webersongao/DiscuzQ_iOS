//
//  DZQPostRelationV1.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQPostRelationV1.h"


@implementation DZQPostRelationV1

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class],
             @"thread" : [DZQDataThread class],
             @"replyUser" : [DZQDataUser class],
             @"likedUsers" : [DZQDataUser class],
             @"images" : [DZQDataAttachment class],
             @"attachments" : [DZQDataAttachment class]
    };
}


@end
