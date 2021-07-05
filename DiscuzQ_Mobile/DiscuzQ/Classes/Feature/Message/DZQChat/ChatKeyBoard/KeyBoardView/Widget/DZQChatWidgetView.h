//
//  DZQChatWidgetView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

// 多功能视图
@protocol DZQChatWidgetViewDelegate <NSObject>

-(void)DZQChatWidgetViewBtnClick:(NSInteger)index;

@end


@interface DZQChatWidgetView : UIView<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView  *innerScrollView;
@property(nonatomic,assign)id<DZQChatWidgetViewDelegate>delegate;

@end
