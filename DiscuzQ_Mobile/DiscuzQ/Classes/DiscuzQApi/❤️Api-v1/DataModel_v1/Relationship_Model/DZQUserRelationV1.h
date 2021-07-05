//
//  DZQUserRelationV1.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQSuperModel.h"
#import "DZQGroupV1.h"

@interface DZQUserRelationV1 : DZQSuperRelation

@property (nonatomic, strong) NSArray<DZQDataGroup *> *groups;  //!<  用户所在群组


@end


