//
//  TaskTipHubView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "TipHubView.h"

@interface TaskTipHubView : UIView

@property (nonatomic, copy)   NSString* text;
@property (nonatomic, assign) TipHubView_Show_Type type;
@property (nonatomic, assign) float duration;
- (void)showTipHubView;
- (void)closeTipHubView;
@end
