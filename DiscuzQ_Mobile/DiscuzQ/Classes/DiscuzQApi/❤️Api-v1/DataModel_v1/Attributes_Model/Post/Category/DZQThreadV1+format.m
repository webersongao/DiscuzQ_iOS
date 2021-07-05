//
//  DZQThreadV1+format.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQThreadV1+format.h"

@implementation DZQThreadV1 (format)

@end

@implementation DZQDataThread (format)

-(NSString *)shareTitle{
    NSString *titleStr = self.attributes.postContent;
    if (self.attributes.type == 1) {
        return self.attributes.title;
    }
    return [NSString stringWithFormat:@"【%@】%@",DZ_APP_Name,titleStr];
}

-(NSString *)shareContent{
    NSString *contentStr = self.attributes.postContent;
    if (contentStr.length < 140) {
        return contentStr;
    }else{
        return [NSString stringWithFormat:@"%@....",[contentStr substringToIndex:135]];
    }
}

-(NSString *)shareImagePath{
    NSString *iconPath = self.relationships.firstPost.relationships.images.firstObject.attributes.thumbUrl;
    return iconPath.length ? iconPath : DZ_Navi_icon;
}

-(NSString *)shareUrlString{
    return [NSString stringWithFormat:@"%@/thread/%@?%@",DZQ_BASEURL,self.inner_id,DZQ_from_TAG];
}

@end
