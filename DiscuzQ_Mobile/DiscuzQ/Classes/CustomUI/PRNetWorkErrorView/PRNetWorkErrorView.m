//
//  PRNetWorkErrorView.m
//  NetWorkError-demo
//
//  Created by Gao on 16/6/20.
//  Copyright © 2016年 Gao. All rights reserved.
//

#import "PRNetWorkErrorView.h"

NSString *const PRErrorViewDefaultNoNetTextString = @"咦？没网啦~检查下设置吧";
NSString *const PRErrorViewDefaultNoNetButtonTitle = @"重新加载";

NSString *const PRErrorViewDefaultNoDataTextString = @"暂无内容";

@interface PRNetWorkErrorView ()
@property (nonatomic, strong) UIView		*backgroundView;					// 背景View
@property (nonatomic, strong) UIImageView	*imageView;							// 图片
@property (nonatomic, strong) UILabel		*textLabel;							// 主标题
@property (nonatomic, strong) UILabel		*detailTextLabel;					// 副标题

@end


@implementation PRNetWorkErrorView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame viewType:(PRErrorViewType)type{
    
    if (self = [super initWithFrame:frame]) {
        _errorType = type;
        [self setupView];
    }
    [self updateImageViewForType:type];
    return self;
}

- (void)addErrorViewWithViewType:(PRErrorViewType)viewType
{
    [self addErrorViewWithViewType:viewType textString:nil];
}

- (void)addErrorViewWithViewType:(PRErrorViewType)viewType textString:(NSString *)texString
{
    _errorType = viewType;
    
    NSString *detailTextString = @"";
    NSString *buttonTitle = @"";
    NSString *titleString = checkNull(texString);
    
    if (viewType == PRErrorViewNoNet) {
        titleString = titleString.length ? titleString : PRErrorViewDefaultNoNetTextString;
        buttonTitle = PRErrorViewDefaultNoNetButtonTitle;
    } else if (viewType == PRErrorViewNoData) {
        titleString = titleString.length ? titleString : PRErrorViewDefaultNoDataTextString;
    }
    
    [self addErrorViewWithViewType:viewType textString:titleString detailTextSting:detailTextString buttonTitle:buttonTitle];
}

- (void)addErrorViewWithViewType:(PRErrorViewType)viewType textString:(NSString *)textString detailTextSting:(NSString *)detailTextSting buttonTitle:(NSString *)buttonTitle {
    
    [self addErrorViewWithViewType:viewType textString:textString detailTextSting:detailTextSting buttonTitle:buttonTitle imageName:nil];
}

- (void)addErrorViewWithViewType:(PRErrorViewType)viewType textString:(NSString *)textString detailTextSting:(NSString *)detailTextSting buttonTitle:(NSString *)buttonTitle imageName:(NSString *)imageName
{
    self.textString = textString;
    self.detailTextString = detailTextSting;
    self.buttonTitle = buttonTitle;
    if (imageName.length) {
        self.imageView.image = [UIImage imageNamed:imageName];
    } else {
        [self updateImageViewForType:viewType];
    }
    
    self.button.hidden = buttonTitle.length == 0;
}

- (void)updateImageViewForType:(PRErrorViewType)viewType
{
    switch (viewType) {
        case PRErrorViewNoNet:
            self.imageView.image = [UIImage imageNamed:@"err_net"];
            break;
        case PRErrorViewNoData:
            self.imageView.image = [UIImage imageNamed:@"err_default"];
            break;
        default:
            break;
    }
}

- (void)setupView {
    self.backgroundColor = KWhite_Color;
    
    // 1. 背景View
    self.backgroundView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        [self addSubview:view];
        view;
    });
    
    // 1. imageView
    self.imageView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 140, 140)];
        //		imageView.image = [UIImage imageNamed:@"image"];
        imageView.backgroundColor = [UIColor clearColor];
        [self.backgroundView addSubview:imageView];
        imageView;
    });
    
    // 2. textLabel
    self.textLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor color16WithHexString:@"#9A9AA7" alpha:1.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        [self.backgroundView addSubview:label];
        label;
    });
    
    // 3. detailTextLabel
    self.detailTextLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor color16WithHexString:@"#9A9AA7" alpha:1.0];
        [self.backgroundView addSubview:label];
        label;
    });
    
    // 4. button
    self.button = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
        button.layer.cornerRadius = 3;
        button.backgroundColor = [UIColor color16WithHexString:@"#33C3A5" alpha:1.0];
        button.titleLabel.font = KFontWeight(16, UIFontWeightMedium);
        [button setTitle:@"再试一次" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(tryAction) forControlEvents:UIControlEventTouchUpInside];
        [self.backgroundView addSubview:button];
        button;
    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 1.
    self.backgroundView.center = CGPointMake(KScreenWidth * 0.5,
                                             KScreenHeight * 0.5 - 50);
    
    // 2.
    CGPoint center = self.imageView.center;
    center.x = self.backgroundView.frame.size.width * 0.5;
    self.imageView.center = center;
    
    CGFloat backgroundViewH = self.backgroundView.frame.size.height;
    // 3.
    if (self.textString) {
        self.textLabel.center = CGPointMake(self.imageView.center.x,
                                            self.imageView.frame.size.height + 20
                                            + self.textLabel.frame.size.height * 0.5 - 2);
        backgroundViewH = CGRectGetMaxY(self.textLabel.frame);
    }
    
    if (self.textString && self.detailTextString) {
        CGFloat detailTextLabelY = CGRectGetMaxY(self.textLabel.frame);
        self.detailTextLabel.center = CGPointMake(self.imageView.center.x,
                                                  detailTextLabelY + 19
                                                  + self.detailTextLabel.frame.size.height * 0.5 - 2);
        backgroundViewH = CGRectGetMaxY(self.detailTextLabel.frame);
    } else {
        self.detailTextLabel.center = CGPointMake(self.imageView.center.x,
                                                  self.imageView.frame.size.height + 20
                                                  + self.detailTextLabel.frame.size.height * 0.5 - 2);
        backgroundViewH = CGRectGetMaxY(self.detailTextLabel.frame);
    }
    
    // 5.
    CGFloat buttonY = CGRectGetMaxY(self.detailTextLabel.frame);
    self.button.center = CGPointMake(self.backgroundView.width/2,
                                     buttonY + 50 - 2);
}

- (void)tryAction {
    if ([self.delegate respondsToSelector:@selector(tryAgainButtonDidClicked)]) {
        [self.delegate tryAgainButtonDidClicked];
        [self setNeedsLayout];
    }
}

-(void)checkTitleAndSubTitleToCenter{
    self.textLabel.centerX = self.imageView.centerX;
    self.detailTextLabel.centerX = self.imageView.centerX;
}

#pragma mark - Setter Methond
- (void)setTextString:(NSString *)textString {
    _textString = textString;
    self.textLabel.text = textString;
    [self.textLabel sizeToFit];
}

- (void)setDetailTextString:(NSString *)detailTextString {
    _detailTextString = detailTextString;
    self.detailTextLabel.text = detailTextString;
    [self.detailTextLabel sizeToFit];
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    [self.imageView setImage:[UIImage imageNamed:imageName]];
}

- (void)setHiddenButton:(BOOL)hiddenButton {
    _hiddenButton = hiddenButton;
    self.button.hidden = hiddenButton;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [self.button setTitle:buttonTitle forState:UIControlStateNormal];
}



@end
