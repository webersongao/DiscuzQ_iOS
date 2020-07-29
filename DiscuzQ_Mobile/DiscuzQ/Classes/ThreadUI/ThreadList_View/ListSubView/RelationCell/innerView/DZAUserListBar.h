//
//  DZAUserListBar.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/24.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZAUserListBar : UIView

-(void)updateAUserListBar:(NSArray<DZQDataUser *> *)userList name:(NSString *)nameString;


@end

