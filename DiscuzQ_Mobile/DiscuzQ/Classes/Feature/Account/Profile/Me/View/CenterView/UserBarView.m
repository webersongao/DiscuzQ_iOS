//
//  UserBarView.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "UserBarView.h"
#import "TextIconModel.h"

@implementation UserBarView // 高85

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCommit];
    }
    return self;
}

- (NSMutableArray<TextIconModel *> *)iconTextArr {
    if (!_iconTextArr) {
        _iconTextArr = [NSMutableArray array];
    }
    return _iconTextArr;
}

- (void)initCommit {
    self.backgroundColor = [UIColor whiteColor];
    
    NSArray *arr = @[@"主题",@"关注",@"粉丝数",@"我的收藏"];
    
    CGFloat item_width = (KScreenWidth - 24) / 4;
    for (int i = 0; i < 4; i ++) {
        
        TextIconModel *model = [TextIconModel initWithText:arr[i] iconName:[NSString stringWithFormat:@"ucbar_%d",i] andDetail:nil action:cell_None];
        [self.iconTextArr addObject:model];
        
        DZVerticalButton *item = [[DZVerticalButton alloc] initWithFrame:CGRectMake(12 + i * item_width, 12, item_width, CGRectGetHeight(self.frame))];
        item.tag = i;
        item.textLabel.text = model.text;
        item.iconV.image = [UIImage imageNamed:model.iconName];
        [item addTarget:self action:@selector(itemAction:)];
        [self addSubview:item];
    }
}

- (void)itemAction:(DZVerticalButton *)sender {
    if (self.toolItemClickBlock) {
        self.toolItemClickBlock(sender, sender.tag, self.iconTextArr[sender.tag].text);
    }
}

@end
