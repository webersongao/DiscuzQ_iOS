//
//  DZQTextField.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/17.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQTextField.h"

@interface DZQTextField ()

@property (nonatomic, strong) NSString *placeholderStr;
@property (nonatomic, strong) UILabel *placeHolderLabel;
@property (nonatomic, strong) UIColor *placeholderColor;

@end

@implementation DZQTextField

- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame]) )
    {
        [self config_EditTextFieldBarStyle];
        self.backgroundColor = KWhite_Color;
    }
    return self;
}

- (void)config_EditTextFieldBarStyle {
    
    self.placeholderStr = @"";
    self.placeholderColor = KLightGray_Color;
    [self addSubview:self.placeHolderLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}


- (void)placeQHolder:(NSString *)placeHolder color:(UIColor * __nullable)color font:(UIFont * __nullable)font{
    _placeholderStr = placeHolder;
    _placeHolderLabel.font = font;
    _placeHolderLabel.text = placeHolder;
    _placeHolderLabel.textColor = _placeholderColor = color;
}

- (void)textFieldChanged:(NSNotification *)notification
{
    if([[self placeholderStr] length] == 0)
    {
        return;
    }
    
    if([[self text] length] == 0)
    {
        [[self viewWithTag:10801] setAlpha:1];
    }
    else
    {
        [[self viewWithTag:10801] setAlpha:0];
    }
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textFieldChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if( [[self placeholderStr] length] > 0 )
    {
        self.placeHolderLabel.text = self.placeholderStr;
        [self.placeHolderLabel sizeToFit];
        self.placeHolderLabel.textColor = self.placeholderColor;
        [self sendSubviewToBack:self.placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholderStr] length] > 0 )
    {
        [[self viewWithTag:10801] setAlpha:1];
    }
    
    self.placeHolderLabel.centerY = self.height/2.0;
    
    [super drawRect:rect];
}

- (void)updatePlaceHolderLabelToCenter {
    if (_placeHolderLabel) {
        _placeHolderLabel.width = self.width - 16;
        _placeHolderLabel.center = CGPointMake(_placeHolderLabel.center.x, self.height/2);
    }
}
-(UILabel *)placeHolderLabel{
    if (!_placeHolderLabel) {
        CGRect rc = CGRectMake(8,8,self.bounds.size.width - 16,self.bounds.size.height);
        _placeHolderLabel = [[UILabel alloc] initWithFrame:rc];
        _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _placeHolderLabel.numberOfLines = 0;
        _placeHolderLabel.font = self.font;
        _placeHolderLabel.backgroundColor = [UIColor clearColor];
        _placeHolderLabel.textColor = self.placeholderColor;
        _placeHolderLabel.alpha = 0;
        _placeHolderLabel.tag = 10801;
    }
    return _placeHolderLabel;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
