//
//  DZOtherScrollView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZScrollView.h"

@interface DZOtherScrollView : DZScrollView

-(void)updateOtherUserListTabView;

-(void)updateUserHeader:(DZQDataUser *)dataUser;

- (instancetype)initWithFrame:(CGRect)frame userId:(NSString *)userId;




@end

