//
//  ForumBaseNode.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/27.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZBaseForumModel.h"

@interface ForumBaseNode : NSObject

@property (nonatomic, copy) NSString *fidStr;  //!< 属性注释
@property (nonatomic, copy) NSString *nameStr;  //!< 属性注释
@property (nonatomic, strong) NSArray<ForumBaseNode *> *subNodeList;  //!< 属性注释





@end


