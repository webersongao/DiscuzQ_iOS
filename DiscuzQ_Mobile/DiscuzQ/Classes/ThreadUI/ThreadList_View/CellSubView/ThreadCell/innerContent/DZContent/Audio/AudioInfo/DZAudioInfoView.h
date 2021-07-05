//
//  DZAudioInfoView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZAudioInfoView : UIView

@property (nonatomic, copy) backVideoBlock playInfoBlock;

-(void)update_AudioInfoCoverView:(DZQDataThread *)dataModel;


@end

NS_ASSUME_NONNULL_END
