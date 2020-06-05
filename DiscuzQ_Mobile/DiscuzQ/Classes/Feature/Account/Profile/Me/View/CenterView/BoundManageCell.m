//
//  BoundManageCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2017/7/13.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "BoundManageCell.h"
#import "DZHorizontalButton.h"
#import "BindVarModel.h"

@implementation BoundManageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self p_setupView];
    }
    return self;
}

- (void)p_setupView {
    self.nameV = [[DZHorizontalButton alloc] init];
    [self.contentView addSubview:self.nameV];
    
    self.detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.detailBtn.cs_acceptEventInterval = 1;
    self.detailBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    self.detailBtn.titleLabel.font = KFont(14);
    
    [self.detailBtn setTitleColor:K_Color_Theme forState:UIControlStateNormal];
    [self.detailBtn setTitleColor:KBlack_Color forState:UIControlStateSelected];
    [self.detailBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 40, 0, -40)];
    [self.contentView addSubview:self.detailBtn];
    [self.detailBtn setTitle:@"绑定" forState:UIControlStateNormal];
    [self.detailBtn setTitle:@"解绑" forState:UIControlStateSelected];
}

- (void)updateCellData:(BindUser *)model {
    if (model.name != nil) {
        self.nameV.iconV.image = [UIImage imageNamed:model.icon];
        NSString *name = model.name;
        self.detailBtn.selected = YES;
        if ([model.status isEqualToString:@"1"]) {
            name = [name stringByAppendingString:@"(已绑定)"];
        } else {
            self.detailBtn.selected = NO;
            name = [name stringByAppendingString:@"(未绑定)"];
            if ([model.type isEqualToString:@"minapp"]) {
                [self.detailBtn setTitleColor:KGray_Color forState:UIControlStateNormal];
            }
        }
        NSMutableAttributedString *attName = [[NSMutableAttributedString alloc] initWithString:checkNull(name)];
        NSRange brange = {name.length - 5, 5};
        [attName addAttribute:NSFontAttributeName value:KFont(12) range:brange];
        [attName addAttribute:NSForegroundColorAttributeName value:K_Color_Message range:brange];
        self.nameV.textLabel.attributedText = attName;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.nameV.frame = CGRectMake(15, 11, 200, CGRectGetHeight(self.frame) - 20);
    self.detailBtn.frame = CGRectMake(KScreenWidth - 120 - 10, CGRectGetMinY(self.nameV.frame), 120, CGRectGetHeight(self.nameV.frame));
}

@end
