//
//  AllOneButtonCell.h
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/1.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZBaseTableViewCell.h"

typedef void(^BtnActionBlock)(UIButton *sender);

@interface AllOneButtonCell : DZBaseTableViewCell

@property (nonatomic, strong) UIButton *ActionBtn;

@property (nonatomic, copy) BtnActionBlock actionBlock;

@end
