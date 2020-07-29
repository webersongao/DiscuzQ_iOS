//
//  DZHtmlItem.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZHtmlUtils.h"

#define dz_ParaId_key           @"paraId"
#define dz_HtmlUrl_key          @"htmlSpanUrl://"

@protocol DZHtmlItemDelegate <NSObject>

@optional

-(void)refreshThreadCurrentHtmlView:(NSString *)htmlString;

@end




@interface DZHtmlItem : NSObject

@property(nonatomic,assign) CGRect frame; //  文字内容
@property(nonatomic,assign) CGRect maxRect; // 内容最大rect
@property(nonatomic,copy) NSString *screen_html; // 最终展示在屏幕上的html

@property (nonatomic, strong) NSAttributedString *attributedString;  //!< 主题内容的字符串显示
@property (nonatomic, weak) id<DZHtmlItemDelegate> htmlDelagate;  //!< 属性注释


+(instancetype)canculateHtmlStyle:(NSString *)origin_html maxRect:(CGRect)maxRect;


@end


