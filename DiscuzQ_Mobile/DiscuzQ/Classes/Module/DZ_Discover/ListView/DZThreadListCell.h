//
//  DZThreadListCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/19.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"
#import "DZThreadListModel+Display.h"
#import "DZThreadBaseView.h"
#import "DZThreadListStyle.h"

@interface DZThreadListCell : DZBaseTableViewCell

-(DZQDataThread *)cellModel;
-(DZThreadBaseView *)cellView;

- (void)updateThreadListCell:(DZQDataThread *)Model;


@end


