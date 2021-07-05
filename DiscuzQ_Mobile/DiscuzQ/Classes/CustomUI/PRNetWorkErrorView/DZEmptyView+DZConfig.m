//
//  DZEmptyView+DZConfig.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZEmptyView+DZConfig.h"

@implementation DZEmptyView (DZConfig)


// 构造方法 - 创建emptyView

+ (instancetype)emptyViewWithMode:(DZEmptyMode)emptyMode{
    
    NSString *imgePath = @"";
    NSString *titleStr = @"";
    NSString *detailStr = @"";
    
    switch (emptyMode) {
        case DZEmptyModeNoNet:
        {/// 无网
            imgePath = @"err_net";
            titleStr = @"咦？没网啦~检查下设置吧";
        }
            break;
        case DZEmptyModeNoData:
        {/// 无数据
            imgePath = @"err_noData";
            titleStr = @"暂无数据";
        }
            break;
        case DZEmptyModeNoComment:
        {/// 无 回复
            imgePath = @"err_message";
            titleStr = @"木有评论,赶紧去抢个沙发吧";
        }
            break;
        case DZEmptyModeSystemError:
        {/// 系统错误
            imgePath = @"err_system";
            titleStr = @"-->系统错误<--";
        }
            break;
        default:
        {/// 默认
            imgePath = @"err_default";
//            titleStr = @"无数据";
        }
            break;
    }
    
    return [DZEmptyView emptyViewWithImageStr:imgePath titleStr:titleStr detailStr:detailStr];
    
}

                             
@end
