//
//  DZHtmlItem.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZHtmlUtils.h"

#define k_One_fontSize 14.0

#define k_Two_detailSize 16.0  // emoji表情高度


//@protocol DZHtmlItemDelegate <NSObject>
//
//@optional
//-(void)refreshThreadCurrentHtmlView;
//
//@end




@interface DZHtmlItem : NSObject

@property(nonatomic,assign) CGRect frame; //  文字内容
@property(nonatomic,assign) CGRect maxRect; // 内容最大rect
@property(nonatomic,copy) NSString *screen_html; // 最终展示在屏幕上的html
@property (nonatomic, strong) NSAttributedString *attributedString;  //!< 主题内容的字符串显示
//@property (nonatomic, assign) id<DZHtmlItemDelegate> htmlDelagate;  //!< 属性注释


+(instancetype)canculateHtmlStyle:(NSString *)origin_html maxRect:(CGRect)maxRect;


@end


