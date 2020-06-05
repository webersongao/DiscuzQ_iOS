//
//  MyThreadVarModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "GlobalModel.h"
#import "DZBaseThread.h"


@interface ThreeadItemModel : DZBaseThread

@property (nonatomic, copy) NSString *lastposterenc;  //!< 属性注释
@property (nonatomic, copy) NSString *multipage;  //!< 属性注释
@property (nonatomic, copy) NSString *recommendicon;  //!< 属性注释
@property (nonatomic, copy) NSString *heatlevel;  //!< 属性注释
@property (nonatomic, copy) NSString *src_new;  //!< new字段
@property (nonatomic, copy) NSString *src_id;  //!< id 字段
@property (nonatomic, copy) NSString *moved;  //!< 属性注释
@property (nonatomic, copy) NSString *icontid;  //!< 属性注释
@property (nonatomic, copy) NSString *folder;  //!< 属性注释
@property (nonatomic, copy) NSString *weeknew;  //!< 属性注释
@property (nonatomic, copy) NSString *istoday;  //!< 属性注释
@property (nonatomic, copy) NSString *dbdateline;  //!< 属性注释
@property (nonatomic, copy) NSString *dblastpost;  //!< 属性注释
@property (nonatomic, copy) NSString *rushreply;  //!< 属性注释

@end



@interface MyThreadVarModel : GlobalModel

@property (nonatomic, strong) NSArray<ThreeadItemModel *> *data;  //!< 属性注释
@property (nonatomic, assign) NSInteger perpage;  //!< 属性注释

@end
