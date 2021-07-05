//
//  DZQHeaderView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZQHeaderView : UIView

@property(nonatomic,strong) UIButton *avatarView;
-(void)updateHeader:(DZQUserV1 *)userModel group:(DZQGroupV1 *)group;



@end

NS_ASSUME_NONNULL_END
