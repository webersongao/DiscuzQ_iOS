//
//  DZQChatMapController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/11/19.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatMapController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "DZQChatMsgLayout.h"

@interface DZQChatMapController ()<CLLocationManagerDelegate,MKMapViewDelegate>

// 纬度 经度
@property(nonatomic,assign)CGFloat latitude;
@property(nonatomic,assign)CGFloat longitude;
@property(nonatomic,strong)MKMapView *innerMapView;
//定位
@property(nonatomic,strong)CLLocationManager *locationManager;


@end

@implementation DZQChatMapController

- (instancetype)initWithMsgLayout:(DZQChatMsgLayout *)layout
{
    self = [super init];
    if (self) {
        self.latitude = layout.message.latitude;
        self.longitude = layout.message.longitude;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"位置";
    [self.view addSubview:self.innerMapView];
    
    CLLocationCoordinate2D coord = (CLLocationCoordinate2D){_latitude, _longitude};
    [self.innerMapView setCenterCoordinate:coord animated:YES];
    
    
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKPinAnnotationView *pinView = nil;
    
    static NSString *defaultPinID = @"com.invasivecode.pin";
    pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
    if ( pinView == nil ) {
        pinView = [[MKPinAnnotationView alloc]  initWithAnnotation:annotation reuseIdentifier:defaultPinID];
    }
    pinView.pinTintColor = [UIColor redColor];
    pinView.canShowCallout = YES;
    pinView.animatesDrop = YES;
    [mapView.userLocation setTitle:@"欧陆经典"];
    [mapView.userLocation setSubtitle:@"vsp"];
    return pinView;
}


-(MKMapView *)innerMapView{
    if (!_innerMapView) {
        _innerMapView = [[MKMapView alloc]initWithFrame:KView_OutNavi_Bounds];
        _innerMapView.delegate = self;
        _innerMapView.showsUserLocation = YES;
        _innerMapView.mapType = MKMapTypeStandard;
        _innerMapView.userTrackingMode = MKUserTrackingModeFollow;
    }
    return _innerMapView;
}

@end
