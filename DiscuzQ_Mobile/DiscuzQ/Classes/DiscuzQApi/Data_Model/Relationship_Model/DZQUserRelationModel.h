//
//  DZQUserRelationModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQGroupModel.h"

@interface DZQUserRelationModel : DZQSuperRelation

@property (nonatomic, strong) DZQDataGroup *groups;  //!<  用户所在群组


@end
