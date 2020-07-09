//
//  DZDiscoverListView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZVideoTableView.h"
#import "DZThreadListCell.h"

@interface DZDiscoverListView : DZVideoTableView

- (instancetype)initWithListFrame:(CGRect)frame;

-(void)updateDiscoverListView:(NSArray<DZQDataThread *> *)array;

@end


