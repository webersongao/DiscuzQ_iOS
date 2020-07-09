//
//  DZBaseCollectionCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZBaseCollectionCell.h"

@implementation DZBaseCollectionCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = KDebug_Color;
    }
    return self;
}

+ (CGSize)defaultCellSize{
    return CGSizeMake(kCellWidth, kCellHeight);
}

@end
