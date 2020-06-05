//
//  DZBaseForumModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseForumModel.h"

@implementation DZBaseForumModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"forum_desc" : @"description",
             @"favorited" : @"favorite",
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"sublist" : [DZBaseForumModel class]
    };
}

-(void)setName:(NSString *)name{
    _name = [[name transformationStr] flattenHTMLTrimWhiteSpace:YES];
}

-(void)setPosts:(NSString *)posts{
    _posts = [posts onePointCountWithNumstring];
}

-(void)setTodayposts:(NSString *)todayposts{
    _todayposts = [todayposts onePointCountWithNumstring];
}

-(void)setThreads:(NSString *)threads{
    _threads = [threads onePointCountWithNumstring];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"fid:%@，版块名：%@",_fid,_name];
}


@end
