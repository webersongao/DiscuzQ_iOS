//
//  TextIconModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/19.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "TextIconModel.h"

@implementation TextIconModel

- (NSString *)description {
    return [NSString stringWithFormat:@"text==> %@,iconName==> %@,detail==> %@",_text,_iconName,_detail];
}

- (instancetype)initWithText:(NSString *)text iconName:(NSString *)iconName andDetail:(NSString *)detail action:(DZCellAction)action {
    if (self = [super init]) {
        _text = text;
        _detail = detail;
        _cellAction = action;
        _iconName = iconName;
    }
    return self;
}

+ (instancetype)initWithText:(NSString *)text iconName:(NSString *)iconName andDetail:(NSString *)detail action:(DZCellAction)action {
    TextIconModel *model = [[TextIconModel alloc] initWithText:text iconName:iconName andDetail:checkNull(detail) action:action];
    return model;
}

@end
