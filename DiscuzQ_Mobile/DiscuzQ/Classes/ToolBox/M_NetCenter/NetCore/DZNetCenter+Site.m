//
//  DZNetCenter+Site.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+Site.h"
#import "DZNetCenter+API_V1_0.h"
#import "DZNetCenter+API_V3_0.h"
#import "DZNetFormatter+Adapter.h"

@implementation DZNetCenter (Site)

/// 全部 Emoji表情[列表]
-(void)dzx_allEmojiListWithCompletion:(void (^)(NSArray<DZQDataEmoji *> *resModel, BOOL success))completion{
    
    if (self.sdkVersion == 3.0) {
        
    }else{
        [self dzApiv1_allEmojiListWithCompletion:^(NSArray<DZQDataEmoji *> * _Nonnull varModel, BOOL success) {
            if (completion) {
                completion(varModel,success);
            }
        }];
    }
}


/// 获取 分类列表
-(void)dzx_categoryListWithCompletion:(void (^)(NSArray<DZThreadCateM *> *cateArray, BOOL success))completion{
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak DZNetCenter *weakMself = self;
    void (^successCallBack)(NSArray *cateArr, BOOL) = ^(NSArray *cateArray, BOOL success) {
        __block NSArray<DZThreadCateM *> *cateMArrray = nil;
        formatterCenter_async_task(^{
            cateMArrray = [weakMself.formatter category_ConvertWithObj:cateArray];
        }, ^{
            if (completion) {
                completion(cateMArrray,success);
            }
        });
    };
    
    if (self.sdkVersion == 3.0) {
        [self dzApiv3_categoryListWithCompletion:successCallBack];
    }else{
        [self dzApiv1_categoryListWithCompletion:successCallBack];
    }
}

//// 获取站点基本信息
-(void)dzx_siteforumInfoWithCompletion:(void (^)(DZSiteM *siteModel, BOOL success))completion{
    
    //创建block请求成功回调,是为了留下一个统一一个回调处理的地方
    __weak DZNetCenter *weakMself = self;
    void (^successCallBack)(id resModel, BOOL) = ^(id resModel, BOOL success) {
       __block DZSiteM *siteModel = nil;
        formatterCenter_async_task(^{
            siteModel = [weakMself.formatter forum_ConvertWithObj:resModel];
        }, ^{
            if (completion) {
                completion(siteModel,success);
            }
        });
    };
    
    if (self.sdkVersion == 3.0) {
        [self dzApiv3_siteforumInfoWithCompletion:successCallBack];
    }else{
        [self dzApiv1_siteforumInfoWithCompletion:successCallBack];
    }
    
}

@end
