//
//  DZQDataLogic+Convert_V3.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/23.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDataLogic+Convert_V3.h"
#import "DZQOriginResV3.h"

@implementation DZQDataLogic (Convert_V3)

-(DZQResV3 *)revert_innerV3ResConvertWithJSON:(id)json dataClass:(Class)dataClass{
    
    DZQOriginResV3 *resV3Model = [DZQOriginResV3 resV3BaseModelWithJSON:json];
    
    // 3、将格式化后的复合型字典 转化为 嵌套model
    DZQResV3 *resModel = [DZQResV3 revert_V3ConvertWithOriRes:resV3Model oriJSON:json modelClass:dataClass];
    
    return resModel;
}

@end
