//
//  ForumModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/21.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "ForumModel.h"

@implementation ForumModel

-(void)setLastpost:(id)lastpost{
    if ([DataCheck isValidDict:lastpost]) {
        _lastpost = [[lastpost stringForKey:@"dateline"] transformationStr];
    } else {
        _lastpost = checkNull(lastpost);
    }
}



@end
