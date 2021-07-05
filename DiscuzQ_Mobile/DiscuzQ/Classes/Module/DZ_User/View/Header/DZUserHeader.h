//
//  DZUserHeader.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZUserItemModel.h"

@interface DZUserHeader : UIView


// 更新数据
-(void)updateUserListHeader:(DZQUserV1 *)userModel relate:(DZQUserRelationV1 *)relate;

@property (nonatomic, copy) void(^headerAction)(cellAction action) ;  //!< 属性注释

@end


