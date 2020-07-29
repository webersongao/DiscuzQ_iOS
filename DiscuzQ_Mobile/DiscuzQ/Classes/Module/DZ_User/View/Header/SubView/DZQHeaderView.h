//
//  DZQHeaderView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZQHeaderView : UIView

@property(nonatomic,strong) UIButton *avatarView;
-(void)updateHeader:(DZQUserModel *)userModel group:(DZQGroupModel *)group;



@end

NS_ASSUME_NONNULL_END
