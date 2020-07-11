//
//  DZUserPayListView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/9.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionView.h"
#import "DZDDetailStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZUserPayListView : DZBaseCollectionView

-(void)updatePayUserList:(NSArray <DZQDataUser *>*)userArray payLayout:(DZDPayStyle *)layout;

@end

NS_ASSUME_NONNULL_END
