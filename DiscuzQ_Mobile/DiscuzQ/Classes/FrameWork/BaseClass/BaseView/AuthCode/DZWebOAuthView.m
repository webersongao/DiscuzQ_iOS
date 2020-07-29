//
//  DZWebOAuthView.m
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/6.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZWebOAuthView.h"
#import "DZWebView.h"

@interface DZWebOAuthView()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) DZWebView *codeWebview;

@end

@implementation DZWebOAuthView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self config_authWebViews];
    }
    return self;
}

- (void)config_authWebViews {
    
    [self addSubview:self.textField];
    [self addSubview:self.codeWebview];
    self.backgroundColor = KWhite_Color;
}

-(void)loadRequestWithCodeUrl:(NSString *)urlString{
    [self.codeWebview dz_loadBaseWebUrl:urlString back:nil];
}
- (void)tapRefreshCodeGesAction {
    self.refreshAuthCodeBlock?self.refreshAuthCodeBlock():nil;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textField.frame = CGRectMake(0, kMargin10, self.width*0.65, self.height - kMargin10);
    self.codeWebview.frame = CGRectMake(self.width * 0.7 , kMargin10, self.width * 0.3, self.height - kMargin10);
}

-(UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, kMargin10, KScreenWidth * 0.48, 0)];
        _textField.placeholder = @"请输入验证码";
        _textField.font = KFont(14);
        [_textField setTranslatesAutoresizingMaskIntoConstraints:NO];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _textField;
}

-(DZWebView *)codeWebview{
    if (!_codeWebview) {
        _codeWebview = [[DZWebView alloc] initDeviceModeWithFrame:CGRectMake(0, kMargin10, KScreenWidth * 0.3, 0)];
        _codeWebview.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_codeWebview setTranslatesAutoresizingMaskIntoConstraints:NO];
        _codeWebview.scrollView.scrollEnabled = NO;
        _codeWebview.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRefreshCodeGesAction)];
        tapges.delegate = self;
        [_codeWebview addGestureRecognizer:tapges];
    }
    return _codeWebview;
}

@end
