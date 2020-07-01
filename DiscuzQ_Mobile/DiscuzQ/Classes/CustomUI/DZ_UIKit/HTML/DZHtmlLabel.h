//
//  DZHtmlLabel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <DTCoreText/DTCoreText.h>
#import "DZHtmlUtils.h"
#import "DZHtmlItem.h"

@interface DZHtmlLabel : DTAttributedLabel

-(void)updateContent_Html:(DZHtmlItem *)htmlItem;


@end

