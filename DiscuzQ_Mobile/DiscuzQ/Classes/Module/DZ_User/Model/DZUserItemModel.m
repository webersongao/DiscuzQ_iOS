//
//  DZUserItemModel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserItemModel.h"

@implementation DZUserItemModel

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle action:(cellAction)action indicator:(BOOL)indicator
{
    self = [super init];
    if (self) {
        _iconName = icon;
        _titleStr = title;
        _detailStr = subTitle;
        _action = action;
        _isIndicator = indicator;
    }
    return self;
}

+(NSArray <DZUserItemModel *>*)localListData{
    
    DZUserItemModel *item1 = [[DZUserItemModel alloc] initWithIcon:DZQ_icon title:@"草稿箱" subTitle:@"" action:cell_draft indicator:YES];
//    DZUserItemModel *item2 = [[DZUserItemModel alloc] initWithIcon:DZQ_icon title:@"夜间模式" subTitle:@"" action:cell_colorMode indicator:YES];
//    DZUserItemModel *item3 = [[DZUserItemModel alloc] initWithIcon:DZQ_icon title:@"我的钱包" subTitle:@"" action:cell_wallet indicator:YES];
    DZUserItemModel *item4 = [[DZUserItemModel alloc] initWithIcon:DZQ_icon title:@"我的收藏" subTitle:@"" action:cell_favorite indicator:YES];
    DZUserItemModel *item5 = [[DZUserItemModel alloc] initWithIcon:DZQ_icon title:@"我的邀请码" subTitle:@"邀请好友给奖励" action:cell_invate indicator:YES];
    
    NSArray *itemArray = @[item1,item4,item5];
    
    return itemArray;
}


@end
