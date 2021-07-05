//
//  DZVideoThreadContentView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/20.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ThreadContentViewDelegate <NSObject>

@optional
- (void)threadListContentView:(UIScrollView *)ScrollView scrollDidScroll:(CGFloat)offsetY;

@end

@interface DZVideoThreadContentView : UIView

@property (nonatomic, assign) BOOL ListScrollEnabled;  //!< 属性注释
@property (nonatomic, assign) CGPoint offSet;  //!< 属性注释
@property (nonatomic, weak) id<ThreadContentViewDelegate> listDelgate;  //!< 属性注释


@end


