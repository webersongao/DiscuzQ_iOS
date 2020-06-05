//
//  FriendVarModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "FriendVarModel.h"

@implementation DZFriendModel

@end

@implementation FriendVarModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [DZFriendModel class]};
}

@end

