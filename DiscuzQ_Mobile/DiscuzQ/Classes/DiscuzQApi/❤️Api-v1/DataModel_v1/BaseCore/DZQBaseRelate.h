//
//  DZQBaseRelate.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/19.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZQBaseDaModel : NSObject

@property (nonatomic, copy) NSString *type;  //!< 属性注释
@property (nonatomic, copy) NSString *inner_id;  //!< 属性注释

@end

@interface DZQBaseRelate : NSObject

@property (nonatomic, strong) NSArray<DZQBaseDaModel *> *data;  //!< 属性注释

+(instancetype)relateModelWithJSON:(id)json;


@end
