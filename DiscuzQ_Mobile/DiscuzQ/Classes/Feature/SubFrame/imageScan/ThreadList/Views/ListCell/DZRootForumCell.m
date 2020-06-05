//
//  DZRootForumCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/23.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZRootForumCell.h"
#import "ForumNodeModel.h"

@interface DZRootForumCell()

@property (nonatomic, strong) UIView *sepLine;

@end

@implementation DZRootForumCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    }
    return self;
}


- (void)setupViews {
    self.backgroundColor = [UIColor whiteColor];
    //    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.button];
    
    [self.contentView addSubview:self.textLab];
    [self.contentView addSubview:self.sepLine];
}


/**
 * 设置可折叠的cell数据
 */
- (void)setNode:(ForumNodeModel *)node {
    
    NSString *openStr;
    if (node.nodeLevel == 0) {
        self.accessoryType = UITableViewCellAccessoryNone;
        if (node.isExpanded) {
            openStr = @"dz_open";
        } else {
            openStr = @"dz_close";
        }
    }
    [self.button setImage:[UIImage imageTintColorWithName:openStr superView:self.button] forState:UIControlStateNormal];
    
    self.textLab.frame = CGRectMake(15, 15,KScreenWidth - 85, 30);
    _node = node;
    self.button.frame = CGRectMake(KScreenWidth - 30 - 10, 15, 30, 30);
    self.textLab.text = node.name;
    self.sepLine.frame = CGRectMake(15, 59.5, KScreenWidth - 15, 0.5);
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textLab.frame = CGRectMake(15, (CGRectGetHeight(self.frame) - 30) / 2,KScreenWidth - 85, 30);
    self.button.frame = CGRectMake(KScreenWidth - 30 - 10, (CGRectGetHeight(self.frame) - 30) / 2, 30, 30);
    self.sepLine.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, KScreenWidth , 0.5);
}


- (UIView *)sepLine {
    if (_sepLine == nil) {
        _sepLine = [[UIView alloc] init];
        _sepLine.backgroundColor = KLine_Color;
    }
    return _sepLine;
}

- (UILabel *)textLab {
    if (_textLab == nil) {
        _textLab = [[UILabel alloc] init];
        _textLab.font = KFont(15);
        _textLab.textColor = K_Color_Theme;
    }
    return _textLab;
}

- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.userInteractionEnabled = NO;
        [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageTintColorWithName:@"dz_close" superView:_button] forState:UIControlStateNormal];
    }
    return _button;
}


@end
