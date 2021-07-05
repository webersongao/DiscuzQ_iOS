//
//  DZThreadEditAreaView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadEditAreaView : DZScrollView

@property (nonatomic, copy, readonly) NSString *titleStr;  //!< 属性注释
@property (nonatomic, copy, readonly) NSString *contentStr;  //!< 属性注释


-(void)updateEditerAreaView:(DZThreadDraftM *)threadDraft;

@end

NS_ASSUME_NONNULL_END
