//
//  UserVarModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/2.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "UserVarModel.h"


@implementation UserResModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Variables" : [UserVarModel class]};
}

@end

@implementation UserVarModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"space" : [SpaceModel class]};
}


@end



//@implementation DZExtItemModel
//
//@end
