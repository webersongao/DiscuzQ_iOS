//
//  DZThreadTypeModel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/2/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZThreadTypeModel.h"

@implementation DZThreadTypeModel

+ (instancetype)ModelWithName:(NSString *)name typeid:(NSString *)idStr{
    
    DZThreadTypeModel *model = [[DZThreadTypeModel alloc] init];
    model.nameStr = name;
    model.typeId = idStr;
    return model;
}

+(NSArray <DZThreadTypeModel *> *)defaultTypeList{
   
    DZThreadTypeModel *model00 = [DZThreadTypeModel ModelWithName:@"全部" typeid:@""];
    DZThreadTypeModel *model01 = [DZThreadTypeModel ModelWithName:@"普通" typeid:@"0"];
    DZThreadTypeModel *model02 = [DZThreadTypeModel ModelWithName:@"长文" typeid:@"1"];
    DZThreadTypeModel *model03 = [DZThreadTypeModel ModelWithName:@"视频" typeid:@"2"];
    DZThreadTypeModel *model04 = [DZThreadTypeModel ModelWithName:@"图片" typeid:@"3"];
    DZThreadTypeModel *model05 = [DZThreadTypeModel ModelWithName:@"语音" typeid:@"4"];
    DZThreadTypeModel *model06 = [DZThreadTypeModel ModelWithName:@"问答帖" typeid:@"5"];
    DZThreadTypeModel *model07 = [DZThreadTypeModel ModelWithName:@"商品帖" typeid:@"6"];
    
    return @[model00,model01,model02,model03,model04,model05,model06,model07];
    
}

@end
