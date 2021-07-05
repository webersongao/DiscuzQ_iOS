//
//  DZDatePickerController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/26.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 时间选择器
 */

#define SS_DZDatePickerViewW   kScreenWidth-30
#define SS_DZDatePickerViewH   320

@protocol DZDatePickerViewDelegate <NSObject>

-(void)DZDatePickerViewBtnClick:(NSInteger)index date:(NSString *)date;

@end


@interface DZDatePickerView : UIView

@property(nonatomic,assign)id<DZDatePickerViewDelegate>delegate;

//标题
@property(nonatomic,strong)UILabel *mTitleLab;
//取消
@property(nonatomic,strong)UIButton *mBackBtn;
//确认
@property(nonatomic,strong)UIButton *mOKBtn;

//时间选择器
@property (nonatomic, strong)UIDatePicker *datePicker;
@property (nonatomic, strong)NSString *timeString;

@end





/**
 时间选择器的控制器
 */
typedef void (^DatePickerBlock)(NSString *date);

@interface DZDatePickerController : UIViewController

@property(nonatomic,copy)DatePickerBlock datePickerBlock;

@property(nonatomic,strong)DZDatePickerView *datePickerView;
@property(nonatomic,strong)UIView *backView;
-(void)setPickerViewAnimation;

@end







