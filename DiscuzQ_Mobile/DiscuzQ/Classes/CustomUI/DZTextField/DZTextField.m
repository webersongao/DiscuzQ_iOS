//
//  DZTextField.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/9/17.
//  Copyright © 2016年 WebersonGao. All rights reserved.
// 这个textfiled高度55

#import "DZTextField.h"
#import "UITextField+Common.h"

@interface DZTextField()

@property (nonatomic,weak) UIView * leftview;
@property (nonatomic,strong) UILabel *lineLabel;  // 占位符
@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UITextField *inputField;

@end

@implementation DZTextField

- (instancetype)initWithFrame:(CGRect)frame Left:(UIImage *)leftImg placeholder:(NSString *)placeholder
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KWhite_Color;
        [self p_setDZTextField:leftImg placeholder:placeholder];
    }
    return self;
}

-(id)inputDelegate{
    return self.inputField.delegate;
}

-(NSString *)inputString{
    return self.inputField.text;
}

-(void)setInputDelegate:(id)inputDelegate{
    self.inputField.delegate = inputDelegate;
}


-(void)updateInputtag:(NSInteger)tag secureTextEntry:(BOOL)secureTextEntry{
    self.inputField.tag = tag;
    self.inputField.secureTextEntry = secureTextEntry;
}

- (void)updateTextIcon:(UIImage *)leftImg placeholder:(NSString *)placeholder{
    self.imgView.image = leftImg;
    [self.inputField placeHolder:placeholder color:KGray_Color font:KFont(12.0)];
}


- (void)p_setDZTextField:(UIImage *)leftImg placeholder:(NSString *)placeholder{
    
    self.imgView.image = leftImg;
    [self addSubview:self.inputField];
    [self addSubview:self.lineLabel];
    [self.inputField placeHolder:placeholder color:KGray_Color font:KFont(12.0)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AccountTextChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

-(void)AccountTextChanged:(NSNotification *)noti{
    
}


-(UITextField *)inputField{
    if (!_inputField) {
        _inputField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0.5, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 1)];
        _inputField.leftView = self.imgView;
        _inputField.leftViewMode = UITextFieldViewModeAlways;
        _inputField.font = KFont(14);
        _inputField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _inputField;
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _imgView.alpha = 0.8;
    }
    return _imgView;
}


-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 1, self.width, 0.5)];
        _lineLabel.backgroundColor = KLine_Color;
    }
    return _lineLabel;
}


@end
