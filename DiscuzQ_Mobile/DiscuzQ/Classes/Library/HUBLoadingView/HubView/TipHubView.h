//
//  TipHubView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#ifndef __TIP_HUB_VIEW_H
#define __TIP_HUB_VIEW_H

#import <UIKit/UIKit.h>

#define TEXT_HUB_MARGIN_W 15
#define TEXT_HUB_MARGIN_H 15

#define TEXT_HUB_MAX_W (208 - TEXT_HUB_MARGIN_W*2)//240
#define TEXT_HUB_MIN_W 82
#define TEXT_HUB_MIN_H (46 - TEXT_HUB_MARGIN_H*2)//55

typedef NS_ENUM(NSInteger, TipHubView_Show_Type)
{
	TipHubView_Show_Type_Begin = -1,
	
	TipHubView_Show_Type_Mid,//居中显示
	TipHubView_Show_Type_Bottom,//底部显示
    TipHubView_Show_Type_Bubble,// 气泡显示
    TipHubView_Show_Type_Mid_Other_BG,   // 居中显示有其他颜色背景的
    TipHubView_Show_Type_Mid_KEYBOARD,   // 居中显示在键盘前面
	
	TipHubView_Show_Type_End
};

typedef NS_ENUM(NSInteger, TipHubViewAnimationType)
{
	TipHubViewAnimationType_none,
	TipHubViewAnimationType_frame,
	TipHubViewAnimationType_alpha
};

@interface TipHubView : UIView
{
	UILabel *m_textLabel;
	UIView*	m_inView;
	
	TipHubViewAnimationType m_endAnimationType;
	float m_duration;
	int m_type;
	BOOL m_bInKeyWindow;
    
    CGRect m_initRect;
}
@property(nonatomic, assign)BOOL bInKeyWindow;
@property (assign, nonatomic)TipHubViewAnimationType endAnimationType;
@property (assign, nonatomic)float duration;
- (void)closeTipHubView;
- (void)setShowText:(NSString *)text;
- (void)setText:(NSString *)text;
- (void)setInView:(UIView*)inView;
- (void)setInitRect:(CGRect)rect;
- (void)setShowType:(int)type;
@end

@interface BottomTipHubView : TipHubView
{
    UIImageView* m_bottom_tip_bg;
}

@end


typedef enum {
    PointDirectionAny = 0,
	PointDirectionUp,
	PointDirectionDown,
} PointDirection;

@interface BubbleTipHubView : TipHubView
@property (nonatomic, assign)    PointDirection   preferredPointDirection;
@end

@interface MidBgTipHubView : TipHubView
{
    UIImageView* m_tip_bg;
}
@end


#endif
