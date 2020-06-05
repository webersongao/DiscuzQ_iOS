//
//  TextIconModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    cell_None,
    cell_User,
    cell_Admin,
    cell_Footmark, // 足迹
    cell_Thread,
    cell_Bind,
    cell_ReSet,  // 重置密码
    cell_reply,
    cell_Logout,
    cell_addFriend
} DZCellAction;

@interface TextIconModel : NSObject

@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *iconName;
@property (nonatomic, assign, readonly) DZCellAction cellAction;  //!< 属性注释

+ (instancetype)initWithText:(NSString *)text iconName:(NSString *)iconName andDetail:(NSString *)detail action:(DZCellAction)action;

@end
