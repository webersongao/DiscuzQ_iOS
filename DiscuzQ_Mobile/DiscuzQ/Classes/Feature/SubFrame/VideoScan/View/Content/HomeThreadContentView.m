//
//  HomeThreadContentView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/20.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "HomeThreadContentView.h"
#import "DZHomeNewListCtroller.h"

@interface HomeThreadContentView ()

@property (nonatomic, strong) DZHomeNewListCtroller *contentVC;

@end

@implementation HomeThreadContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutThreadContentView];
        self.backgroundColor = KRandom_Color;
    }
    return self;
}


-(void)layoutThreadContentView{
    [self addSubview:self.contentVC.view];
}

-(void)setOffSetY:(CGPoint)offSet{
    _offSet = offSet;
//    self.contentVC.listOffSet = offSet;
}

-(void)setListScrollEnabled:(BOOL)ListScrollEnabled{
    _ListScrollEnabled = ListScrollEnabled;
//    self.contentVC.contentScrollEnabled = ListScrollEnabled;
}

#pragma mark   /********************* ThreadListContentDelegate *************************/

- (void)threadListContentView:(UIScrollView *)ScrollView scrollDidScroll:(CGFloat)offsetY{
    if (self.listDelgate && [self.listDelgate respondsToSelector:@selector(threadListContentView:scrollDidScroll:)]) {
        [self.listDelgate threadListContentView:ScrollView scrollDidScroll:offsetY];
    }
}


-(DZHomeNewListCtroller *)contentVC{
    if (_contentVC == nil) {
        _contentVC = [[DZHomeNewListCtroller alloc] init];
    }
    return _contentVC;
}







@end


