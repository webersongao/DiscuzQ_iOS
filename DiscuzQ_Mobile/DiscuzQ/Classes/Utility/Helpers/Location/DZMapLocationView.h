//
//  DZMapLocationView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/4.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@class DZMapLocationView;
@protocol DZMapLocationViewDelegate <NSObject>
@optional

-(void)mapUpdateLocation:(DZMapLocationView *)locationView mark:(CLPlacemark *)placeMark location:(CLLocation *)location error:(NSError *)error;

@end


@interface DZMapLocationView : UIView

//定位
@property(nonatomic,strong)MKMapView *mapView;
@property(nonatomic,strong)CLLocationManager *locationManager;
@property (nonatomic, weak) id<DZMapLocationViewDelegate> mapDelegate;

- (void)stopMapUpdatingLocation;

- (void)startMapUpdatingLocation;

- (void)updateViewCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated;




@end


