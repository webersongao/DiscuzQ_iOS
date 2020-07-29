//
//  DropDownView.h
//  DiscuzQ
//
//  Created by WebersonGao on 17/5/27.
//  Copyright (c) 2015年 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DropDownView;

@protocol DropDownViewDelegate <NSObject>
@optional
-(void)postBtnClick:(UIButton *)btn;
- (void)postThreadClick:(NSString *)title;

@end

@interface DropDownView : UIView

@property (nonatomic ,weak) id <DropDownViewDelegate> delegate;
@property (nonatomic ,copy) NSString * fourdID;
-(id)initWithFrame:(CGRect)frame postType:(NSString*)type allowPostSpecial:(NSString *)allowpostspecial allowsPecialOnly:(NSString *)allowspecialonly;

- (id)initWithFrame:(CGRect)frame activityType:(NSMutableArray *)arr;

@end
