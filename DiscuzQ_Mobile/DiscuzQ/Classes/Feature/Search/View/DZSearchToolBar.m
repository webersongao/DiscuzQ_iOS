//
//  DZSearchToolBar.m
//  DiscuzQ
//
//  Created by piter on 2018/1/22.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZSearchToolBar.h"

@implementation DZSearchToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    [self addSubview:self.rightBtn];
    [self addSubview:self.searchBar];
    
}

-(DZSearchBar *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[DZSearchBar alloc] initWithFrame:CGRectMake(5, 1, CGRectGetWidth(self.frame) - kCellHeight_65, CGRectGetHeight(self.frame) - 2)];
    }
    return _searchBar;
}

- (UIButton *)rightBtn {
    if (_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(CGRectGetWidth(self.frame) - 60, 0, 60, CGRectGetHeight(self.frame));
        [_rightBtn setTitleColor:K_Color_MainTitle forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_rightBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_rightBtn setTitle:@"取消" forState:UIControlStateSelected];
    }
    return _rightBtn;
}



@end
