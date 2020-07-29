//
//  DZThreadStickView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/7.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadStickView.h"
#import "DZThreadStick.h"

@interface DZThreadStickView ()

@property (nonatomic, strong) DZThreadStick *stickView;  //!< 用户信息

@end

@implementation DZThreadStickView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self comfigStickView];
        self.backgroundColor = KDebug_Color;
    }
    return self;
}

-(void)comfigStickView{
    
    [self addSubview:self.stickView];
    
}


- (void)updateThreadStickView:(DZQDataThread *)dataModel{
    
    DZThreadListStyle *listStyle = (DZThreadListStyle *)dataModel.styleModel;
    
    [self layoutThreadSCell:listStyle];
    [self.stickView updateStickBar:listStyle];
    
}

-(void)layoutThreadSCell:(DZThreadListStyle *)layout{
    
    self.stickView.frame = CGRectMake(0, 0, layout.kf_HeadSize.width, layout.kf_HeadSize.height);
    
}

-(DZThreadStick *)stickView{
    if (!_stickView) {
        _stickView = [[DZThreadStick alloc] initWithFrame:CGRectZero];
    }
    return _stickView;
}


@end
