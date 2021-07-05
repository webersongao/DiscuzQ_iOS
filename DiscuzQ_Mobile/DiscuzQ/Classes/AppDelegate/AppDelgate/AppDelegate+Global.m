//
//  DZQDelegate+Global.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/21.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "AppDelegate+Global.h"
#import "DZGlobalHelper.h"

@implementation DZQDelegate (Global)


-(void)Global_loadForumGlobalInfofromServer{
    
    [[DZGlobalHelper shared] Global_RequestForumGlobalConfigfromServer];
}




@end
