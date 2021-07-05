//
//  DZGestureLockerView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/26.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

//手势密码
#import <UIKit/UIKit.h>

/**
 小型九宫格圆点显示
 */
@interface DZLockerView : UIView

//圆点数组
@property (strong, nonatomic) NSArray *rounds;

@end

//3*3的密码视图
#define Number   3

@protocol DZGestureLockerViewDelegate <NSObject>

- (void)DZGestureLockerViewDidSetFinished:(NSArray *)array;
@end

@interface DZGestureLockerView : UIView

@property(nonatomic,assign)id<DZGestureLockerViewDelegate>delegate;


//圆点数组
@property (strong, nonatomic) NSMutableArray* buttons;
//最后一个点 用于连接
@property (assign, nonatomic) CGPoint curlastPoint;


@end





