//
//  DZTextField.m
//  DiscuzQ
//
//  Created by WebersonGao on 16/9/17.
//  Copyright © 2016年 WebersonGao. All rights reserved.
// 这个textfiled高度55

#import "DZTextField.h"

@interface DZTextField()

@property (nonatomic,strong) UIView * leftview;
@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) UIImageView *imgView;
@end

@implementation DZTextField

- (instancetype)initWithLeft:(UIImage *)leftImg
{
    self = [super init];
    if (self) {
        [self p_setDZTextField:leftImg];
    }
    return self;
}

- (void)p_setDZTextField:(UIImage *)leftImg {
    
    self.backgroundColor = [UIColor whiteColor];
    //用户名
    _inputField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 1)];
    _inputField.placeholder = @"请输入用户名";
    _inputField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_inputField];
    
    _leftview =[[UIView alloc] initWithFrame:CGRectMake(8, 0, 35, 20)];
    _imgView = [[UIImageView alloc] initWithImage:(leftImg ? leftImg : KImageNamed(@"new_head_dark"))];
    
    [_leftview addSubview:_imgView];
    _inputField.leftView = _leftview;
    _imgView.hidden = _imgView.image ? NO : YES;
    _inputField.leftViewMode = UITextFieldViewModeAlways;
    _inputField.font = KFont(14);//14
    ;
    
   _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame) - 1, CGRectGetWidth(self.frame), 1)];
    _lineLabel.backgroundColor = KLine_Color;
    [self addSubview:_lineLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _inputField.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 1);
    _leftview.frame = CGRectMake(0, 0, 35, 24);
    _imgView.frame = CGRectMake(0, 0, CGRectGetHeight(self.leftview.frame), CGRectGetHeight(self.leftview.frame));
    _lineLabel.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 1, CGRectGetWidth(self.frame), 1);
    
}

@end
