//
//  DZQMediaVideoCell.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/19.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "DZQMediaGroupItem.h"

/**
 当前视频界面的播放状态和控件需要展示的状态

 - DZQVideoLayerValue1: 未播放静止（播放按钮）
 - DZQVideoLayerValue2: 未播放静止+点击了空白处（所有控件）
 - DZQVideoLayerValue3: 播放中
 - DZQVideoLayerValue4: 播放中+点击了空白处（所有控件）
 - DZQVideoLayerValue5: 播放暂停中（所有控件）
 - DZQVideoLayerValue6: 播放暂停+点击空白处
 - DZQVideoLayerValue7: 播放完毕 （播放按钮）
 - DZQVideoLayerValue8: 播放完毕+点击空白处（所有控件）
 */
typedef NS_ENUM(NSInteger, DZQVideoLayerStatus) {
    DZQVideoLayerValue1 = 1,
    DZQVideoLayerValue2,
    DZQVideoLayerValue3,
    DZQVideoLayerValue4,
    DZQVideoLayerValue5,
    DZQVideoLayerValue6,
    DZQVideoLayerValue7,
    DZQVideoLayerValue8,
};


/**
 视频的图层 100%透明  可以展示帧图片  展示所有控件 添加点击事件
 */
@protocol DZQVideoImageLayerDelegate <NSObject>

//点击图片
//-(void)DZQVideoImageLayerGesture:(UITapGestureRecognizer *)gesture;

//点击按钮
-(void)DZQVideoImageLayerButtonClick:(UIButton *)sender item:(DZQMediaGroupItem *)item;

//拖动进度条
-(void)DZQVideoImageLayerSliderEventValueChanged:(UISlider *)slider item:(DZQMediaGroupItem *)item;

@end

@interface DZQVideoImageLayer : UIImageView

-(instancetype)initWithItem:(DZQMediaGroupItem *)item;

@property(nonatomic,assign)id<DZQVideoImageLayerDelegate>delegate;

//根据屏幕旋转刷新控件的位置
-(void)setNewFrameWithDeviceoRientation;

//展示单位
@property(nonatomic,strong)DZQMediaGroupItem *item;

//播放状态
@property(nonatomic,assign)DZQVideoLayerStatus status;

//左上角返回按钮
@property(nonatomic,strong)UIButton *mBackButton;
//视频中间播放暂停按钮
@property(nonatomic,strong)UIButton *playCenterButton;
//左下角播放暂停按钮
@property(nonatomic,strong)UIButton *playLeftButton;

//播放的当前时间
@property(nonatomic,strong)UILabel *currenTimeLab;
//播放的总时长
@property(nonatomic,strong)UILabel *totalTimeLab;
//播放进度条
@property(nonatomic,strong)UISlider *playSlider;

//当前播放时间
@property(nonatomic,assign)NSTimeInterval currentTime;
//总时间
@property(nonatomic,assign)NSTimeInterval totalTime;

//根据时间设置显示和进度条状态
-(void)setPeriodicTimeAndProgress;


@end




/**
 短视频播放
 */
@protocol DZQMediaVideoCellDelegate <NSObject>

//点击返回控件
-(void)DZQMediaVideoCellImageButtonClick:(UIButton *)sender item:(DZQMediaGroupItem *)item;

@end

@interface DZQMediaVideoCell : UIView<DZQVideoImageLayerDelegate>

-(instancetype)initWithItem:(DZQMediaGroupItem *)item;

@property(nonatomic,assign)id<DZQMediaVideoCellDelegate>videoViewDelegate;

//当前是视图展示状态
@property(nonatomic,assign)DZQImageShowType showType;

//播放状态
@property(nonatomic,assign)DZQVideoLayerStatus status;

//设置frame
@property(nonatomic,assign)CGRect videoViewFrame;
//展示单位
@property(nonatomic,strong)DZQMediaGroupItem *item;
//展示图层
@property(nonatomic,strong)DZQVideoImageLayer   *mVideoImagelayer;

//最新的视频
@property(nonatomic,strong)AVPlayer      *player;
@property(nonatomic,strong)AVPlayerLayer *playerLayer;


@end



