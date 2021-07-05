//
//  DZHomeCellCenter.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZHomeCellCenter.h"

#import "DZThreadStickyCell.h"
#import "DZThreadNormalCell.h"
#import "DZThreadArticleCell.h"
#import "DZThreadPictureCell.h"
#import "DZThreadVideoCell.h"
#import "DZThreadAudioCell.h"
#import "DZThreadGoodsCell.h"
#import "DZThreadQuestionCell.h"


@implementation DZHomeCellCenter

//类型：-1 置顶帖 0 普通 1 长文 2 视频 3 图片 4 语音 5 问答帖 6 商品帖
+(Class)cellClassWithType:(NSInteger)threadType{
    switch (threadType) {
        case -1:
        {
            return [DZThreadStickyCell class];
        }
            break;
        case 0:
        {
            return [DZThreadNormalCell class];
        }
            break;
        case 1:
        {
            return [DZThreadArticleCell class];
        }
            break;
        case 2:
        {
            return [DZThreadVideoCell class];
        }
            break;
        case 3:
        {
            return [DZThreadPictureCell class];
        }
            break;
        case 4:
        {
            return [DZThreadAudioCell class];
        }
            break;
        case 5:
        {
            return [DZThreadQuestionCell class];
        }
            break;
        case 6:
        {
            return [DZThreadGoodsCell class];
        }
            break;
            
        default:
            break;
    }
    return [DZThreadListCell class];
}

@end
