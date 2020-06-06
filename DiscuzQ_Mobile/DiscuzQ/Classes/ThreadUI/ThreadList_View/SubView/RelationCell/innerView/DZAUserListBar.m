//
//  DZAUserListBar.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZAUserListBar.h"
#import "DZAUserListView.h"

@interface DZAUserListBar ()

@property (nonatomic, strong) DZLabel *nameLabel;  //!< 昵称
@property (nonatomic, strong) DZAUserListView *UserList;  //!< 昵称

@end

@implementation DZAUserListBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self cofig_userlistBar];
    }
    return self;
}

-(void)cofig_userlistBar{
    
    [self addSubview:self.UserList];
    [self addSubview:self.nameLabel];
}

-(void)updateAUserListBar:(NSArray<DZQDataUser *> *)userList name:(NSString *)nameString{
    
    self.nameLabel.text = nameString;
    [self.UserList updateUserListView:userList];
    
    [self.nameLabel sizeToFit];
    self.nameLabel.hidden = userList.count ? NO : YES;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.nameLabel.left = kMargin15;
    self.nameLabel.centerY = self.height/2.f;
    self.UserList.frame = CGRectMake(self.nameLabel.right + kMargin10, 0, self.width-CGRectGetMaxX(self.nameLabel.frame)-kMargin25, self.height);
}

-(DZLabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [DZLabel dz_labelWithFrame:CGRectZero title:@"" titleColor:KGreen_Color fontSize:12.f];
        _nameLabel.textAlignment = NSTextAlignmentRight;
    }
    return _nameLabel;
}


-(DZAUserListView *)UserList{
    if (!_UserList) {
        _UserList = [[DZAUserListView alloc] initWithFrame:CGRectZero collectionViewLayout:[DZLayoutTool userListLayout]];
    }
    return _UserList;
}


@end
