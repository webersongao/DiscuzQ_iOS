//
//  DZHtmlUtils.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZHtmlButton.h"
#import <DTCoreText.h>

@interface DZHtmlUtils : NSObject

+(CGFloat)singleHtmlLineHeight;

//Html->富文本NSAttributedString
+ (NSAttributedString *)getAttributedStringWithHtml:(NSString *)htmlString;

//使用HtmlString,和最大左右间距，计算视图的高度
+ (CGSize)getAttributedTextHeightHtml:(NSString *)htmlString withMaxRect:(CGRect)VMaxRect;

@end


