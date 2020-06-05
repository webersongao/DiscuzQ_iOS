//
//  DZVideoThreadContentView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/20.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZVideoThreadContentView.h"
#import "DZVideoSquareController.h"

@interface DZVideoThreadContentView ()

@property (nonatomic, strong) DZVideoSquareController *contentVC;

@end

@implementation DZVideoThreadContentView

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


-(DZVideoSquareController *)contentVC{
    if (!_contentVC) {
        _contentVC = [[DZVideoSquareController alloc] init];
    }
    return _contentVC;
}







@end


