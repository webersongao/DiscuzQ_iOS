//
//  DZTopicHeaderView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZTopicHeaderView : UIView

@property (nonatomic, assign) BOOL isReady; // 是否数据显示完毕

-(void)updateTopicDetailHeader:(DZQDataTopic *)dataTopic;

-(void)configTAction:(id)target skip:(SEL)skipAction filter:(SEL)filterAction;

@end

NS_ASSUME_NONNULL_END
