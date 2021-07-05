//
//  DZUserListView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"
#import "DZUserItemModel.h"
#import "DZUserHeader.h"

@interface DZUserListView : DZBaseTableView

@property(nonatomic,strong) DZUserHeader *headView;
@property (nonatomic, copy) void(^touchAction)(cellAction action) ;  //!< 属性注释


-(void)updateLocalList:(NSArray <DZUserItemModel *>*)dataArray;

@end

