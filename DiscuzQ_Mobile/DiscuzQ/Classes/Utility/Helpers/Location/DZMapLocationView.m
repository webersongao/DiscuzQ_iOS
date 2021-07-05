//
//  DZMapLocationView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZMapLocationView.h"

@interface DZMapLocationView ()<CLLocationManagerDelegate,MKMapViewDelegate>

@end

@implementation DZMapLocationView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.mapView];
    }
    return self;
}


- (void)startMapUpdatingLocation{
    [self.locationManager startUpdatingLocation];
}

- (void)stopMapUpdatingLocation{
    
    [self.locationManager stopUpdatingLocation];
}

- (void)updateViewCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated{
    [self.mapView setCenterCoordinate:coordinate animated:animated];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    [self stopMapUpdatingLocation];
    //获取最新位置
    CLLocation *location = [locations lastObject];
    
    //根据最新位置,进行地理反编码
    CLGeocoder *gecoder = [CLGeocoder new];
    
    DZQWEAKSELF
    [gecoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        // 用户 位置信息
        if ([weakQSelf.mapDelegate respondsToSelector:@selector(mapUpdateLocation:mark:location:error:)]) {
            [weakQSelf.mapDelegate mapUpdateLocation:weakQSelf mark:[placemarks lastObject] location:location error:error];
        }
    }];
}



-(MKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[MKMapView alloc]initWithFrame:self.bounds];
        _mapView.delegate = self;
        _mapView.showsUserLocation = YES;
        _mapView.mapType = MKMapTypeStandard;
        _mapView.userTrackingMode = MKUserTrackingModeFollow;
    }
    return _mapView;
}


-(CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        [_locationManager requestWhenInUseAuthorization];
        [_locationManager requestAlwaysAuthorization];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 10.0;
        _locationManager.delegate = self;
    }
    return _locationManager;
}




@end
