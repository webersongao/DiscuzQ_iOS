//
//  DZBaseVarModel.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/7/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "GlobalModel.h"
#import "DZNoticeModel.h"

@interface DZBaseVarModel : GlobalModel

@property (nonatomic, copy) NSString *member_email;
@property (nonatomic, copy) NSString *member_credits;
@property (nonatomic, copy) NSString *setting_bbclosed;

@property (nonatomic, strong) DZNoticeModel *notice;


@end




