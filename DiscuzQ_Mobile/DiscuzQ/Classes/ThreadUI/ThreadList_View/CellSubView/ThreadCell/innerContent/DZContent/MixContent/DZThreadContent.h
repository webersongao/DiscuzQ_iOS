//
//  DZThreadContent.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/1/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZThreadVideo.h"
#import "DZThreadNormal.h"

@class DZThreadContent;
@protocol threadContentDelegate <NSObject>

@optional
// 视频播放
-(void)threadContent:(DZMediaPlayView *)playButton playAction:(DZQDataVideo *)dataVideo;

@end


@interface DZThreadContent : UIView

@property (nonatomic,weak) id<threadContentDelegate> actionDelegate;  //!< 时间

- (void)updateThreadContent:(DZQDataThread *)Model contentStyle:(DZDHeadStyle *)contentStyle;

@end


