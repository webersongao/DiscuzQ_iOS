//
//  DZForumCateHeader.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/17.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CollectionForumBlock)(UIButton *sender);

@interface DZForumCateHeader : UIView

-(void)updateCateHeader:(DZQDataCate *)dataCate;

@end
