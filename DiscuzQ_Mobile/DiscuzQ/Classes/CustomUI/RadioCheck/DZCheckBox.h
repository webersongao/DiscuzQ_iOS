//
//  EICheckBox.h
//  EInsure
//
//  Created by ivan on 13-7-9.
//  Copyright (c) 2013年 ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DZCheckBoxDelegate;

@interface DZCheckBox : UIButton {
    BOOL _checked;
    id _userInfo;
}

@property(nonatomic, assign)id<DZCheckBoxDelegate> delegate;
@property(nonatomic, assign)BOOL checked;
@property(nonatomic, retain)id userInfo;

- (id)initWithTitle:(NSString *)title delegate:(id)delegate;

@end

@protocol DZCheckBoxDelegate <NSObject>

@optional

- (void)didSelectedCheckBox:(DZCheckBox *)checkbox checked:(BOOL)checked;

@end
