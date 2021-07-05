//
//  DZQChatMapCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatBaseCell.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DZQChatMapCell : DZQChatBaseCell<MKMapViewDelegate,CLLocationManagerDelegate>

//顶部地理位置
@property(nonatomic,strong)UIView *mTopView;
@property(nonatomic,strong)UILabel *mTitleLab;
@property(nonatomic,strong)UILabel *mDetaiLLab;

//分割线
@property(nonatomic,strong)UIView  *mLine;

//底部地图 定位
@property(nonatomic,strong)MKMapView *mMapView;
@property(nonatomic,strong)CLLocationManager *locationManager;


//覆盖按钮
@property(nonatomic,strong)UIButton *mMapButton;

@end



