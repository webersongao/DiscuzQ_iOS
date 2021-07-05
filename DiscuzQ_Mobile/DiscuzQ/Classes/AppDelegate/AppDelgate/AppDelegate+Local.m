//
//  DZQDelegate+Local.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "AppDelegate+Local.h"
#import "UIAlertController+Extension.h"

@interface DZQDelegate()

@property (nonatomic, strong) CLLocationManager *localManager;

@end

@implementation DZQDelegate (Local)

- (void)useLocal {
    self.localManager = [[CLLocationManager alloc] init];
    self.localManager.delegate = self;
    self.localManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.localManager.distanceFilter = 1000;
    [self.localManager requestWhenInUseAuthorization];
    [self.localManager startUpdatingLocation];
}

static const char *CLLocation_manager = "CLLocation_manager";
- (CLLocationManager *)localManager {
    return  objc_getAssociatedObject(self, CLLocation_manager);
}
- (void)setLocalManager:(CLLocationManager *)localManager {
    objc_setAssociatedObject(self, CLLocation_manager, localManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // CLLocationDegrees lat = locations.lastObject.coordinate.latitude;
    // CLLocationDegrees longt = locations.lastObject.coordinate.longitude;
    [self.localManager stopUpdatingLocation];
    [self resevseGeocode:locations.lastObject];
    
}

- (void)resevseGeocode:(CLLocation *)location {
    CLGeocoder *revBeo = [[CLGeocoder alloc] init];
    [revBeo reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        KSLog(@"%@",placemarks[0].addressDictionary);
        NSMutableString *str = [[NSMutableString alloc] init];
        for (NSString *key in placemarks[0].addressDictionary) {
            if ([key isEqualToString:@"FormattedAddressLines"]) {
                if ([DataCheck isValidArray:[placemarks[0].addressDictionary objectForKey:key]]) {
                    str = [str stringByAppendingFormat:@"%@：%@\n",key,[placemarks[0].addressDictionary objectForKey:key][0]].mutableCopy;
                }
            } else {
                str = [str stringByAppendingFormat:@"%@：%@\n",key,[placemarks[0].addressDictionary objectForKey:key]].mutableCopy;
            }
        }
        [UIAlertController alertTitle:nil message:str.copy controller:self.window.rootViewController doneText:@"确定" cancelText:nil doneHandle:^{
            KSLog(@"当前用户所在的位置是 %@ ",str);
        } cancelHandle:nil];
        KSLog(@"%@",placemarks[0].name);  // 上地三街9号B-401号
        KSLog(@"%@",placemarks[0].thoroughfare); // 上地三街
        KSLog(@"%@",placemarks[0].subLocality); // 海淀区
        KSLog(@"%@",placemarks[0].administrativeArea); // 北京市 (州，省份)
        KSLog(@"%@",placemarks[0].subAdministrativeArea);
        KSLog(@"%@",placemarks[0].ocean);
        KSLog(@"%@",placemarks[0].locality);  // 北京市
    }];
}

@end
