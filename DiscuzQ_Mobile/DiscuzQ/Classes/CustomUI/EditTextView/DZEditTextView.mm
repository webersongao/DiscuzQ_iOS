//
//  DZEditTextView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/12/1.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZEditTextView.h"

@interface DZEditTextView ()

@property (nonatomic, assign) editBarStyle barStyle;  //!< 属性注释

@property (nonatomic, strong) NSString *placeholderStr;
@property (nonatomic, strong) UILabel *placeHolderLabel;
@property (nonatomic, strong) UIColor *placeholderColor;

@end

@implementation DZEditTextView

- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame]) )
    {
        [self config_EditTextView:edit_None];
        self.backgroundColor = KWhite_Color;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame barStyle:(editBarStyle)barStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config_EditTextView:barStyle];
        self.backgroundColor = KWhite_Color;
    }
    return self;
}


- (void)config_EditTextView:(editBarStyle)barStyle {
    
    self.barStyle = barStyle;
    self.placeholderStr = @"";
    self.placeholderColor = KLightGray_Color;
    [self addSubview:self.placeHolderLabel];
    
    UIToolbar *keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(doneClicked:)];
    UIBarButtonItem *fix = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:fix,doneButton, nil]];
    self.inputAccessoryView = keyboardDoneButtonView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textEditViewChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)doneClicked:(UIBarButtonItem *)sender {
    [self resignFirstResponder];
}

- (void)placeTextHolder:(NSString *)placeHolder color:(UIColor * __nullable)color font:(UIFont * __nullable)font{
    _placeholderStr = placeHolder;
    _placeHolderLabel.text = placeHolder;
    _placeHolderLabel.textColor = color;
    _placeHolderLabel.font = font;
}

- (void)textEditViewChanged:(NSNotification *)notification
{
    if([[self placeholderStr] length] == 0)
    {
        return;
    }
    
    if([[self text] length] == 0)
    {
        [[self viewWithTag:1001] setAlpha:1];
    }
    else
    {
        [[self viewWithTag:1001] setAlpha:0];
    }
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textEditViewChanged:nil];
}

- (void)drawRect:(CGRect)rect
{
    if( [[self placeholderStr] length] > 0 )
    {
        self.placeHolderLabel.text = self.placeholderStr;
        [self.placeHolderLabel sizeToFit];
        [self sendSubviewToBack:self.placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholderStr] length] > 0 )
    {
        [[self viewWithTag:1001] setAlpha:1];
    }
    
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
        _placeHolderLabel.tag = 1001;
    }
    return _placeHolderLabel;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
