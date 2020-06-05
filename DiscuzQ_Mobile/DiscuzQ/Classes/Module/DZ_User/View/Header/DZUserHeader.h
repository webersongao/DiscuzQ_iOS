//
//  DZUserHeader.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZUserItemModel.h"

@interface DZUserHeader : UIView


// 更新数据
-(void)updateUserListHeader:(DZQUserModel *)userModel relate:(DZQProfileRelationModel *)relate;

@property (nonatomic, copy) void(^headerAction)(cellAction action) ;  //!< 属性注释

@end


