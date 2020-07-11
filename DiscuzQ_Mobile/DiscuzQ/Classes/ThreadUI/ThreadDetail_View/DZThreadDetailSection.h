//
//  DZThreadDetailSection.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/6/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZDDetailStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadDetailSection : UITableViewHeaderFooterView



-(void)updateSectionView:(DZQDataThread *)dataModel sectionLayout:(DZDSectionStyle *)layout;




@end

NS_ASSUME_NONNULL_END
