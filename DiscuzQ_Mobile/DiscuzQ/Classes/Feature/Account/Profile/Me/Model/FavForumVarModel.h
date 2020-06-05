//
//  FavForumVarModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "GlobalModel.h"

@interface DZFavForItem : NSObject


@end

@interface FavForumVarModel : GlobalModel

@property (nonatomic, strong) NSArray *list;  //!< 属性注释
@property (nonatomic, assign) NSInteger count;  //!< 属性注释
@property (nonatomic, assign) NSInteger perpage;  //!< 属性注释



@end




