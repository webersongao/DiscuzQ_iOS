//
//  DZMSgNotiBaseController.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZMSgNotiBaseController : DZBaseViewController

-(void)loadLocalDialogOrMsgListData;


-(void)reloadNotiAndMsgDataWhenChange;

- (instancetype)initWithSubFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
