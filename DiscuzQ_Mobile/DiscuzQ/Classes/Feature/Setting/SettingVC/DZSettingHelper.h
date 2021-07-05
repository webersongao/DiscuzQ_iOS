//
//  DZSettingHelper.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/27.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZSettingHelper : NSObject

+(instancetype)shared;

- (void)localUserALoginout;


-(void)didTappedTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
