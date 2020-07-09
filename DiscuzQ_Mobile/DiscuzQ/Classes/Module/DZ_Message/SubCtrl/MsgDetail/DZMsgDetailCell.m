//
//  DZMsgDetailCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/4.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZMsgDetailCell.h"
#import "DZHtmlLabel.h"
#import "DZBaseUserInfoBar.h"

@interface DZMsgDetailCell ()

@property (nonatomic, strong) DZHtmlLabel * contenLabel;
@property (nonatomic, strong) DZBaseUserInfoBar * userBar;

@end

@implementation DZMsgDetailCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_DetailCell];
    }
    return self;
}

-(void)config_DetailCell {

    self.userBar.isSepLine = YES;
    [self.contentView addSubview:self.userBar];
    [self.contentView addSubview:self.contenLabel];
}

-(void)updateMsgDetailCell:(DZQDataNoti *)NotiModel {
    
    DZNotiListStyle *notiStyle = (DZNotiListStyle *)NotiModel.styleModel;
    [self updateDetailCellLayout:notiStyle];
    
    [self.contenLabel updateContent_Html:notiStyle.kf_twoItem];
    
    [self.userBar updateUserBar:notiStyle.frame_Noti_user.nameAttributedString avatar:NotiModel.attributes.user_avatar time:notiStyle.kf_timeString real:NO style:notiStyle.frame_Noti_user];
}


-(void)updateDetailCellLayout:(DZNotiListStyle *)style{
    
    self.userBar.frame = style.kf_oneFrame;
    self.contenLabel.frame = style.kf_twoFrame;
}

-(DZBaseUserInfoBar *)userBar{
    if (!_userBar) {
        _userBar = [[DZBaseUserInfoBar alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kToolBarHeight)];
    }
    return _userBar;
}


-(DZHtmlLabel *)contenLabel{
    if (!_contenLabel) {
        _contenLabel = [[DZHtmlLabel alloc] initWithFrame:CGRectZero];
    }
    return _contenLabel;
}

@end
