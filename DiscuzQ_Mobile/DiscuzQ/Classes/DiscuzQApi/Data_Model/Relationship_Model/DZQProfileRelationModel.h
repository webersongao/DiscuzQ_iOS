//
//  DZQProfileRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/19.
//  Copyright © 2020 WebersonGao. All rights reserved.
//  用户个人资料 

#import "DZQSuperModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZQProfileRelationModel : DZQSuperRelation

@property (nonatomic, strong) NSArray<DZQDataGroup *> *groups;  //!< 属性注释

@end

NS_ASSUME_NONNULL_END
