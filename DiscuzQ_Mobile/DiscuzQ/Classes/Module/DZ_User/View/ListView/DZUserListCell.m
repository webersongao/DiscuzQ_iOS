//
//  DZUserListCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZUserListCell.h"
#import "DZHorizontalButton.h"
#import "DZUserItemModel.h"

@interface DZUserListCell ()

@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UISwitch *themeSwitch;
@property (nonatomic, strong) DZHorizontalButton *nameV;

@end

@implementation DZUserListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self p_setupCellView];
    }
    return self;
}

- (void)p_setupCellView {
    
    [self.contentView addSubview:self.nameV];
    [self.contentView addSubview:self.detailLabel];
}

- (void)updateUserListCenterCell:(DZUserItemModel *)model{
    
    self.detailLabel.text = model.detailStr;
    self.nameV.textLabel.text = model.titleStr;
    self.nameV.iconV.image = [UIImage imageNamed:model.iconName];
    
    if (model.action == cell_colorMode) {
        self.accessoryView = self.themeSwitch;
    }else{
        self.accessoryType = model.isIndicator ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    }
}



- (void)layoutSubviews {
    [super layoutSubviews];
    self.nameV.frame = CGRectMake(kMargin15, kMargin10, (self.width/2.f)-kMargin15, CGRectGetHeight(self.frame) - kMargin20);
    self.detailLabel.frame = CGRectMake(self.width/2.0, CGRectGetMinY(self.nameV.frame), (self.width/2.f)-kMargin35, CGRectGetHeight(self.nameV.frame));
}


-(void)themeSwitchModeAction:(UISwitch *)button{
    if (button.isOn) {
        KSLog(@"WBS 夜间模式 开启");
    }else{
        KSLog(@"WBS 夜间模式 关闭");
    }
    [[NSUserDefaults standardUserDefaults] setBool:button.isOn forKey:DZ_BoolThemeMode];
}


-(DZHorizontalButton *)nameV{
    if (!_nameV) {
        _nameV = [[DZHorizontalButton alloc] init];
    }
    return _nameV;
}

-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = KFont(12);
        _detailLabel.textColor = KGray_Color;
        _detailLabel.textAlignment = NSTextAlignmentRight;
    }
    return _detailLabel;
}

-(UISwitch *)themeSwitch{
    if (!_themeSwitch) {
        _themeSwitch = [[UISwitch alloc] init];
        [_themeSwitch addTarget:self action:@selector(themeSwitchModeAction:) forControlEvents:UIControlEventValueChanged];
        [_themeSwitch setOn:[[DZMobileCtrl sharedCtrl] isNightMode]];
    }
    return _themeSwitch;
}

@end
