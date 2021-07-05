//
//  DZSettingListCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZSettingListCell.h"

@implementation DZSettingListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config_SettingListCell];
    }
    return self;
}


- (void)config_SettingListCell {
    
    self.textLabel.font = KFont(14);
    self.detailTextLabel.font = KFont(12);
    self.backgroundColor = KDebug_Color;
    self.textLabel.textColor = KTitle_Color;
    self.detailTextLabel.textColor = KContent_Color;
    
}


-(void)updateCell:(NSString *)title detail:(NSString *)detail indexPath:(NSIndexPath *)indexPath{
    
    self.textLabel.text = title;
    self.detailTextLabel.text = detail;
}

@end
