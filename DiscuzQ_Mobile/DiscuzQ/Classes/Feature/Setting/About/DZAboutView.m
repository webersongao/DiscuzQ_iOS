//
//  DZAboutView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/12/5.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZAboutView.h"
#import "DZDevice.h"

@interface DZAboutView()

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UILabel *appNameLabel;
@property (nonatomic, strong) UILabel *versiontypeLabel;
@property (nonatomic, strong) UILabel *companyLabel;
@property (nonatomic, strong) UILabel *incLabel;

@end

@implementation DZAboutView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self p_setupViews];
        self.backgroundColor = KWhite_Color;
    }
    
    return self;
}

- (void)p_setupViews {
    
    [self addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.logoView];
    [self.bgImageView addSubview:self.appNameLabel];
    [self.bgImageView addSubview:self.versiontypeLabel];
    [self.bgImageView addSubview:self.incLabel];
    [self.bgImageView addSubview:self.companyLabel];
    
}



-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dz_about_back"]];
        _bgImageView.frame = self.bounds;
    }
    return _bgImageView;
}

-(UIImageView *)logoView{
    if (!_logoView) {
        _logoView = [[UIImageView alloc] initWithImage:KImageNamed(DZQ_Square_icon)];
        _logoView.frame = CGRectMake((self.bgImageView.width-100)/2.0, 80, 100, 100);
        _logoView.layer.masksToBounds = YES;
        _logoView.layer.cornerRadius = 10;
    }
    return _logoView;
}

-(UILabel *)appNameLabel{
    if (!_appNameLabel) {
        _appNameLabel = [[UILabel alloc] init];
        _appNameLabel.font = [UIFont boldSystemFontOfSize:31.0];
        _appNameLabel.text = DZ_APP_Name;
        _appNameLabel.textColor = KBlack_Color;
        _appNameLabel.textAlignment = NSTextAlignmentCenter;
        _appNameLabel.frame = CGRectMake(0, self.logoView.bottom+30, self.bgImageView.width, 40);
    }
    return _appNameLabel;
}

-(UILabel *)versiontypeLabel{
    if (!_versiontypeLabel) {
        _versiontypeLabel = [[UILabel alloc] init];
        _versiontypeLabel.font = [UIFont systemFontOfSize:14.0];
        _versiontypeLabel.textColor = [UIColor lightGrayColor];
        _versiontypeLabel.textAlignment = NSTextAlignmentCenter;
        _versiontypeLabel.frame = CGRectMake(self.appNameLabel.left, self.appNameLabel.bottom + 10, self.appNameLabel.width, 15);
        NSString *currentversion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        _versiontypeLabel.text = [NSString stringWithFormat:@"iOS V %@",currentversion];
    }
    return _versiontypeLabel;
}


-(UILabel *)incLabel{
    if (!_incLabel) {
        _incLabel = [[UILabel alloc] init];
        _incLabel.text = DZ_CopyRight;
        _incLabel.font = [UIFont systemFontOfSize:12.0];
        _incLabel.textColor = [UIColor lightGrayColor];
        _incLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat incTopY = self.height -20 - self.appNameLabel.height;
        _incLabel.frame = CGRectMake(self.appNameLabel.left, incTopY, self.appNameLabel.width, self.appNameLabel.height);
    }
    return _incLabel;
}


-(UILabel *)companyLabel{
    if (!_companyLabel) {
        _companyLabel = [[UILabel alloc] init];
        _companyLabel.font = [UIFont systemFontOfSize:16.0];
        _companyLabel.textColor = [UIColor darkGrayColor];
        _companyLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat companyTopY = self.incLabel.top - kMargin20;
        _companyLabel.frame = CGRectMake(self.appNameLabel.left, companyTopY, self.appNameLabel.width, kMargin20);
        _companyLabel.text = DZ_company_Name;
    }
    return _companyLabel;
}

@end
