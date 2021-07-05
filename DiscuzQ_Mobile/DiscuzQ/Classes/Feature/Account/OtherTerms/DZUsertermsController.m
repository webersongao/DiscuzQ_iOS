//
//  DZUsertermsController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 17/3/8.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//  用户协议 服务条款

#import "DZUsertermsController.h"

@interface DZUsertermsController ()

@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation DZUsertermsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config_UsertermsView];
    self.title = checkTwoStr(DZ_APP_Name, @"-服务条款");
}


-(void)config_UsertermsView{
   self.scrollview = [[UIScrollView alloc] initWithFrame:KView_OutNavi_Bounds];
    [self.view addSubview:self.scrollview];
    [self dz_bringNavigationBarToFront];
    [self.scrollview addSubview:self.contentLabel];
    self.scrollview.backgroundColor = KWhite_Color;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    CGSize termSize = [self.contentLabel.text sizeWithFont:KFont(14) maxSize:CGSizeMake(KScreenWidth - kMargin30, CGFLOAT_MAX)];
    self.contentLabel.frame = CGRectMake(kMargin15, kMargin15, termSize.width, termSize.height);
    self.scrollview.contentSize = CGSizeMake(KScreenWidth, CGRectGetMaxY(self.contentLabel.frame) + KTabbar_Height);
}


-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = KFont(14);
        NSString *fileName = DZ_bbs_rule;
        _contentLabel.textColor = KContent_Color;
        NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
        _contentLabel.text = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    }
    return _contentLabel;
}






@end






