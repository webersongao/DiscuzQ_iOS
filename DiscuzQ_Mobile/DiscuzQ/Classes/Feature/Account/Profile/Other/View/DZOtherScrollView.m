//
//  DZOtherScrollView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZOtherScrollView.h"
#import "DZUserTabController.h"
#import "DZOtherUserHeader.h"

@interface DZOtherScrollView ()

@property (nonatomic, copy) NSString *user_id;  //!< 属性注释
@property (nonatomic, strong) DZOtherUserHeader *headerView;
@property (nonatomic, strong) DZUserTabController *tabListCtrl;

@end

@implementation DZOtherScrollView

- (instancetype)initWithFrame:(CGRect)frame userId:(NSString *)userId
{
    self = [super initWithFrame:frame];
    if (self) {
        self.user_id = userId;
        [self config_OtherScrollView];
        self.backgroundColor = KWhite_Color;
    }
    return self;
}

-(void)config_OtherScrollView{
    
    self.bounces = NO;
    [self addSubview:self.headerView];
    [self addSubview:self.tabListCtrl.view];
    self.showsVerticalScrollIndicator = NO;
    self.contentSize = CGSizeMake(self.width, KView_OutNavi_Bounds.size.height + KOtherHeaderH - kToolBarHeight + 5.f);
}


-(void)updateUserHeader:(DZQDataUser *)dataUser{
    DZQUserRelationV1 *relation = (DZQUserRelationV1 *)dataUser.relationships;
    NSString *groupStr = dataUser.attributes.showGroups ? relation.groups.firstObject.attributes.name : @"身份保密";
    [self.headerView updateInfoHeader:dataUser.attributes grade:groupStr];
}

-(void)updateOtherUserListTabView{
    [self.tabListCtrl updateFilstUserTabControllerView];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


-(DZOtherUserHeader *)headerView{
    if (!_headerView) {
        _headerView = [[DZOtherUserHeader alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KOtherHeaderH)];
    }
    return _headerView;
}

-(DZUserTabController *)tabListCtrl{
    if (!_tabListCtrl) {
        _tabListCtrl = [[DZUserTabController alloc] initTabFrame:CGRectMake(0, KOtherHeaderH, KScreenWidth, KView_OutNavi_Bounds.size.height) userId:self.user_id];
    }
    return _tabListCtrl;
}

@end
