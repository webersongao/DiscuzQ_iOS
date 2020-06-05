//
//  DZQPostRelationModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/29.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQPostRelationModel.h"


@implementation DZQPostRelationModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"user" : [DZQDataUser class],
             @"thread" : [DZQDataThread class],
             @"likedUsers" : [DZQDataUser class],
             @"mentionUsers" : [DZQDataUser class],
             @"images" : [DZQDataAttachment class],
             @"attachments" : [DZQDataAttachment class]
    };
}





@end
