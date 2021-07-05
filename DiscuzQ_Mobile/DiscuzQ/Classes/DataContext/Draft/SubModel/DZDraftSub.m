//
//  DZDraftSub.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/28.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDraftSub.h"

@interface DZThreadDraftMCate ()

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, assign) NSInteger inner_id;  //!< 属性注释

@end

@implementation DZThreadDraftMCate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _inner_id = 0;
        _type = @"categories";
    }
    return self;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

+(instancetype)defaultCategory{
    DZThreadDraftMCate *cate = [DZThreadDraftMCate new];
    NSString *categoryId = [DZMobileCtrl sharedCtrl].instance.cateModelArray.firstObject.pid;
    if (categoryId.length) {
        cate.inner_id = categoryId.integerValue;
    }else{
        cate = nil;
        KSLog(@"WBS 分类数据为空");
    }
    return cate;
}
// 转换成 主题发送参数字典
-(NSDictionary *)cateModelToDictionary{
    
    NSMutableDictionary *cateDict = [NSMutableDictionary dictionary];
    [cateDict setValue:@(self.inner_id) forKey:@"id"];
    [cateDict setValue:checkNull(self.type) forKey:@"type"];
    
    return [NSDictionary dictionaryWithObject:cateDict forKey:@"data"];
}


@end


@implementation DZThreadDraftMAttach

- (instancetype)init
{
    self = [super init];
    if (self) {
        _type = @"attachments";
    }
    return self;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"inner_id":@"id"};
}

// 转换成 主题发送参数字典
-(NSDictionary *)attachModelToDictionary{
   
    NSMutableDictionary *attachDict = [NSMutableDictionary dictionary];
    [attachDict setValue:@(self.inner_id) forKey:@"id"];
    [attachDict setValue:checkNull(self.type) forKey:@"type"];
    
    return [NSDictionary dictionaryWithObject:attachDict forKey:@"data"];
}

@end


@implementation DZThreadDraftMQues

// 转换成 主题发送参数字典
-(NSDictionary *)quesModelToDictionary{
    
    NSData *jsonData = [self DZQ_ModelToJSONData];
    NSDictionary *quesDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    quesDict = quesDict.allKeys.count ? quesDict : @{};
    
    return [NSDictionary dictionaryWithObject:quesDict forKey:@"data"];
}


@end
