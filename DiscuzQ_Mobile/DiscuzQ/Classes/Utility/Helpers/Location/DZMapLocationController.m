//
//  DZMapLocationController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMapLocationController.h"
#import "DZMapLocationView.h"

@interface DZMapLocationController ()<DZMapLocationViewDelegate>

@property(nonatomic,strong)NSError *error;
@property (nonatomic, strong) UIButton *rightButton;  //!< 属性注释
@property(nonatomic,strong)NSDictionary *locationDic;
@property (nonatomic, strong) DZMapLocationView *locationView;  //!< 属性注释

@end

@implementation DZMapLocationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rightButton.enabled = NO;
    [self.view addSubview:self.locationView];
    [self.locationView.locationManager startUpdatingLocation];
}




-(void)mapUpdateLocation:(DZMapLocationView *)locationView mark:(CLPlacemark *)placeMark location:(CLLocation *)location error:(NSError *)error{
    
    //获取用户当前位置信息
    self.error = error;
    self.rightButton.enabled = YES;
    NSString *userLocationInfo = [placeMark name];
    self.locationDic = @{@"lat":@(location.coordinate.latitude),
                         @"lon":@(location.coordinate.longitude),
                         @"address":checkNull(userLocationInfo)};
    
    [self.locationView updateViewCoordinate:location.coordinate animated:YES];
}


//确定
-(void)rightBtnClick:(UIButton *)sender{
    if (self.locationBlock) {
        self.locationBlock(_locationDic,_error);
    }
    
    [[DZMobileCtrl sharedCtrl] PopToPreviousController:YES];
}

-(DZMapLocationView *)locationView{
    if (!_locationView) {
        _locationView = [[DZMapLocationView alloc] initWithFrame:KView_OutNavi_Bounds];
        _locationView.mapDelegate = self;
    }
    return _locationView;
}


-(UIButton *)rightButton{
    if (!_rightButton) {
        DZBarButtonItem *naviItem = [[DZBarButtonItem alloc] initTextBarButton:@"确定" touchH:@"确定" target:self action:@selector(rightBtnClick:)];
        _rightButton = [self dz_SetNaviOneButtonItem:naviItem Layout:NO];
    }
    return _rightButton;
}


@end
