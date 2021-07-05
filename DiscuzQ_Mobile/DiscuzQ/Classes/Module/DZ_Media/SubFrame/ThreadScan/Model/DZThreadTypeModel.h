//
//  DZThreadTypeModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/2/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZThreadTypeModel : NSObject

@property (nonatomic, copy) NSString *typeId;  //!< 属性注释
@property (nonatomic, copy) NSString *nameStr;  //!< 属性注释

+(NSArray <DZThreadTypeModel *> *)defaultTypeList;

+ (instancetype)ModelWithName:(NSString *)name typeid:(NSString *)idStr;


@end

NS_ASSUME_NONNULL_END
