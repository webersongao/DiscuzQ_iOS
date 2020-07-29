//
//  DZNetCenter+Site.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/15.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZNetCenter+Site.h"

@implementation DZNetCenter (Site)


/// 全部 Emoji表情[列表]
-(void)dzx_allEmojiListWithCompletion:(void (^)(NSArray<DZQDataEmoji *> *resModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_allEmojiListWithSuccess:^(DZQResModel * resModel, BOOL success) {
        if (completion) {
            NSArray *dataArray = resModel.dataBody;
            completion(dataArray,success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}


/// 获取 分类列表
-(void)dzx_categoryListWithCompletion:(void (^)(NSArray<DZQDataCate *> *varModel, BOOL success))completion{
    
    [[DZQNetTool shared] dz_categoryListWithSuccess:^(DZQResModel * resModel, BOOL success) {
        NSMutableArray *cateArray = [NSMutableArray array];
        
        for (DZQBodyModel *body in resModel.dataBody) {
            DZQDataCate *cateModel = [[DZQDataCate alloc] init];
            cateModel.type = body.type;
            cateModel.type_id = body.type_id;
            cateModel.attributes = (DZQCateModel *)body.attributes;
            [cateArray addObject:cateModel];
        }
        if (completion) {
            completion([cateArray copy],resModel.success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
}

//// 获取站点基本信息
-(void)dzx_siteinfoWithUrlTag:(NSInteger)urlTag completion:(void (^)(DZQForumModel *siteModel, BOOL success))completion{
   
    [[DZQNetTool shared] dz_siteinfoWithUrlTag:1125 success:^(DZQResModel * data, BOOL success) {
        if (completion) {
            DZQForumModel *siteModel = (DZQForumModel *)data.dataBody.firstObject.attributes;
            completion(siteModel,success);
        }
    } failure:^(NSError *error) {
        if (completion) {
            completion(nil,NO);
        }
    }];
    
}

@end
