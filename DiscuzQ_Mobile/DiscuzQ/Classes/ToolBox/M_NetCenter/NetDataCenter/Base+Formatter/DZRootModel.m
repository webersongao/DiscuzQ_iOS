//
//  DZRootModel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZRootModel.h"

@implementation DZStyle

/// 存放一些基本的布局 和 格式化数据参数
+(DZStyle *)inner_dataStyle:(DZRootModel *)dataModel{
    return nil;
}

@end




@implementation DZRootModel


-(void)updateStyleWithClass:(Class)styleClass{
    _style = [[styleClass new] inner_dataStyle:self];
}




@end
