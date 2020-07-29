//
//  DZUIUserModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUIUserModel.h"

@implementation DZUIUserModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.user_Time = @"";
        self.user_isReal = NO;
        self.user_thread_isEssence = NO;
    }
    return self;
}

+(instancetype)convertThreadModel:(DZQDataThread *)dataModel{
    
    DZUIUserModel *model = [[DZUIUserModel alloc] init];
    
    DZQThreadRelationModel *relateModel = dataModel.relationships;
    
    model.user_Name = relateModel.user.attributes.username;
    model.user_Grade = @"";
    model.user_Time = relateModel.firstPost.attributes.createdAt;
    
    model.user_isReal = relateModel.user.attributes.isReal;
    model.user_isFollow = relateModel.user.attributes.follow;
    model.user_thread_isEssence = dataModel.attributes.isEssence;
    
    model.user_avatar = relateModel.user.attributes.avatarUrl;
     
    
    return model;
}


+(instancetype)convertFollowModel:(DZQDataFollow *)dataModel isFrom:(BOOL)isFrom{
    
    DZUIUserModel *model = [[DZUIUserModel alloc] init];
    
    DZQFollowRelationModel *relateModel = dataModel.relationships;
    
    DZQDataUser *oriUserModel = isFrom ? relateModel.fromUser : relateModel.toUser;
    
    model.user_Name = oriUserModel.attributes.username;
    model.user_Grade = oriUserModel.relationships.groups.attributes.name;
    model.user_Time = @"";
    model.user_avatar = oriUserModel.attributes.avatarUrl;
    
    model.user_isFollow = oriUserModel.attributes.follow;
    model.user_isReal = oriUserModel.attributes.isReal;
    model.user_thread_isEssence = NO;
    
    return model;
}


@end
