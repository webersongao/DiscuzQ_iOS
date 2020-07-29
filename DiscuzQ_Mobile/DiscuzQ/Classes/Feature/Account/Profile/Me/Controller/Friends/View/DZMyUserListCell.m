//
//  DZMyUserListCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMyUserListCell.h"
#import "DZThreadHead.h"
#import "DZFollowCellStyle.h"

@interface DZMyUserListCell ()

@property (nonatomic, strong) DZThreadHead *userHead;  //!< 属性注释
@property (nonatomic, strong) DZQDataUser *innerModel;  //!< 属性注释

@end

@implementation DZMyUserListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initMyUserCell];
    }
    return self;
}

-(void)initMyUserCell{
    
    [self.contentView addSubview:self.userHead];
    [self.userHead configHeadAction:self avatar:@selector(userMyAvatarAction:) more:nil follow:@selector(userMyFollowAction:)];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.userHead.frame = self.bounds;
}


- (void)updateMyUserCell:(DZQDataFollow *)Model isFromUser:(BOOL)isFromUser {
    _innerModel = isFromUser ? Model.relationships.fromUser : Model.relationships.toUser;
    
    DZFollowCellStyle *style = (DZFollowCellStyle *)Model.styleModel;
    [self.userHead updateThreadUserBar:[DZUIUserModel convertFollowModel:Model isFrom:isFromUser] style:style.frame_Follow_user];

}


-(void)userMyAvatarAction:(UIButton *)button{
    [[DZMobileCtrl sharedCtrl] PushToOtherUserController:self.innerModel.attributes.user_id];
}

-(void)userMyFollowAction:(UIButton *)button{
    KSLog(@"WBS 取消 或者 关注 某用户 ===== ");
}


-(DZThreadHead *)userHead{
    if (!_userHead) {
        _userHead = [[DZThreadHead alloc] init];
    }
    return _userHead;
}



@end
