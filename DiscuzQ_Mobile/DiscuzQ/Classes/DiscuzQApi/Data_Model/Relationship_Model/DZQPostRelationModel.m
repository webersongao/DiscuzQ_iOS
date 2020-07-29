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
             @"replyUser" : [DZQDataUser class],
             @"likedUsers" : [DZQDataUser class],
             @"images" : [DZQDataAttachment class],
             @"attachments" : [DZQDataAttachment class]
    };
}

+ (instancetype)relationModelWithDictionary:(NSDictionary *)dictionary{
    
    DZQPostRelationModel *localModel = [DZQPostRelationModel yy_modelWithDictionary:dictionary];
    
    return localModel;
    
}

@end
