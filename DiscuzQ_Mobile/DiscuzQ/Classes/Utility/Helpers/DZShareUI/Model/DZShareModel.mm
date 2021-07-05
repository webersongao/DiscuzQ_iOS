//
//  DZShareModel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2016/12/22.
//
//

#import "DZShareModel.h"
#import "DZQThreadV1+format.h"
@implementation DZShareModel


+ (instancetype)shareWithThread:(DZQDataThread *)thread
{
    DZShareModel *share = [[DZShareModel alloc] init];
    share.title = thread.shareTitle;;
    share.iconPath = thread.shareImagePath;
    share.descString = thread.shareContent;
    share.urlString = thread.shareUrlString;
    
    return share;
}



@end


