//
//  DZThreadListCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
#import "DZThreadListModel+Display.h"
#import "DZThreadCellView.h"
#import "DZThreadListStyle.h"

@interface DZThreadListCell : DZBaseTableViewCell

-(DZQDataThread *)cellModel;
-(DZThreadCellView *)cellView;

- (void)updateThreadListCell:(DZQDataThread *)Model IndexPath:(NSIndexPath *)indexPath;


@end


