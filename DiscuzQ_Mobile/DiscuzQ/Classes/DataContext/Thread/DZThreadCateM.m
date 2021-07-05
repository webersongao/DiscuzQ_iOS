//
//  DZThreadCateM.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/13.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadCateM.h"
#import "DataBaseHeader.h"

@implementation DZThreadCateM


+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"pid":@"inner_id",
        @"categorydesc":@"cate_description",
        @"childSearchIds":@[@"searchIds",@"searchIds"],
        @"childCategorys":@"children",
        @"threadCount":@"thread_count",
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"childCategorys" : [DZThreadCateM class]};
}

-(void)setChildSearchIds:(NSArray<NSString *> *)childSearchIds{
    NSMutableArray *innerArra = [NSMutableArray array];
    for (id innerObj in childSearchIds) {
        NSString * Inner = [innerObj StringValue];
        if (Inner && Inner.length) {
            [innerArra addObject:Inner];
        }
    }
    _childSearchIds = innerArra.copy;
}

#pragma mark   /********************* 数据库继承方法 *************************/

- (NSArray *)primaryKey
{
    NSString *idStr = checkNull(self.pid);
    return @[FieldName(idStr)];
}

- (NSString *)tableName
{
    return @"DQ_ThreadCateTable";
}

+(NSDictionary<NSString *,Class> *)blobFields{
    return @{ @"childSearchIds" : [NSArray class],@"childCategorys" : [NSArray class]};
}

- (void)startUpdateProperties
{
    NSArray *updateProperties = @[@"pid",@"name",@"icon",@"parentid"];
    [super startUpdateProperties:updateProperties];
}

// 排除不处理的字段
-(NSArray *)excludedFields
{
    return @[];
}

@end
