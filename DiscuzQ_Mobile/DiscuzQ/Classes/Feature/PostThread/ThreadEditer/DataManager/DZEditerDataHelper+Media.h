//
//  DZEditerDataHelper+Media.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZEditerDataHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZEditerDataHelper (Media)

-(void)media_PickerMutipleImage:(void (^)(NSArray<UIImage *> *imageArr, BOOL isOrigin))backImgBlock;


@end

NS_ASSUME_NONNULL_END
