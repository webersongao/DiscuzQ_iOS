//
//  UserDataModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/8.
//  Copyright © 2019年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserVarModel.h"
#import "TextIconModel.h"

typedef NS_ENUM(NSUInteger, PKCenterType) {
    PKCenterTypeMy = 0,
    PKCenterTypeOther,
};

@interface UserDataModel : NSObject

@property (nonatomic, assign) BOOL isOther;
@property (nonatomic, strong) NSArray *ListArray;  //!< 属性注释
@property (nonatomic, strong,readonly) SpaceModel *spaceModel;  //!< 属性注释

- (instancetype)initWithType:(PKCenterType)type;

-(void)updateUserDataModel:(UserVarModel *)VarModel;

@end
