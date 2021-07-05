//
//  DZNotiDetailCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/5/4.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import "DZNotiDetailCell.h"
#import "DZHtmlLabel.h"
#import "DZBaseUserInfoBar.h"

@interface DZNotiDetailCell ()

@property (nonatomic, strong) DZHtmlLabel * contenLabel;
@property (nonatomic, strong) DZBaseUserInfoBar * userBar;

@end

@implementation DZNotiDetailCell


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
    self.backgroundColor = KWhite_Color;
    [self.contentView addSubview:self.userBar];
    [self.contentView addSubview:self.contenLabel];
}

-(void)updateMsgDetailCell:(DZQDataNoti *)NotiModel {
    
    DZNotiDetailStyle *notiStyle = (DZNotiDetailStyle *)NotiModel.styleModel;
    [self updateDetailCellLayout:notiStyle];
    
    [self.contenLabel updateContent_Html:notiStyle.kf_contentItem];
    
    [self.userBar updateUserBar:notiStyle.frame_Noti_user.nameAttributedString avatar:NotiModel.attributes.user_avatar time:notiStyle.kf_timeString real:NO style:notiStyle.frame_Noti_user];
}


-(void)updateDetailCellLayout:(DZNotiDetailStyle *)style{
    
    self.userBar.frame = style.kf_titleFrame;
    self.contenLabel.frame = style.kf_contentFrame;
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
