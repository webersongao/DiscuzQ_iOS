//
//  DZThreadDetailHeader.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDDetailStyle.h"
#import "DZThreadContent.h"

NS_ASSUME_NONNULL_BEGIN


@interface DZThreadDetailHeader : UIView

@property (nonatomic, copy) backVideoBlock playVideoBlock;

-(void)updateDetailHead:(DZQDataThread *)dataModel layout:(DZDHeadStyle *)layout;



@end

NS_ASSUME_NONNULL_END
