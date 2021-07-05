//
//  TipHubViewManager.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "TipHubViewManager.h"
#import "TaskTipHubView.h"

static TipHubView* s_TipHubView = nil;

@implementation TipHubViewManager

+ (void)closeTipHubView
{
    [s_TipHubView removeFromSuperview];

}

+ (TipHubView *)staticTipHubView
{
    return s_TipHubView;
}

+ (void)setStaticTipHubView:(TipHubView *)view
{
    s_TipHubView = view;
}

+ (void)showNextHubView
{
    if (s_TipHubView)
    {
        return;
    }
    if ([[DZMobileCtrl sharedCtrl].tipHubViewArr count] == 0)
    {
        return;
    }
    NSDictionary* dic = [[DZMobileCtrl sharedCtrl].tipHubViewArr objectAtIndex:0];
    
    NSString* text = [dic objectForKey:@"text"];
    float time = [[dic objectForKey:@"time"] floatValue];
    int type = [[dic objectForKey:@"type"] intValue];
    TipHubViewAnimationType starttype = (TipHubViewAnimationType)[[dic objectForKey:@"startType"] intValue];
    TipHubViewAnimationType endtype = (TipHubViewAnimationType)[[dic objectForKey:@"endType"] intValue];
    
    UIView* inView = nil;
    CGRect rc = inView.frame;
    
    if(type == TipHubView_Show_Type_Bubble)
    {
        CGRect viewRc = [[dic objectForKey:@"viewRect"] CGRectValue];
        if(!CGRectEqualToRect(viewRc, CGRectZero))
        {
            rc = viewRc;
        }
    }
    
    [TipHubViewManager showTipHubViewWithText2:text
                                        inView:inView
                                      hideTime:time
                                      showType:type
                                     starttype:starttype
                                       endtype:endtype
                                          rect:rc];
}


+ (void)showTipHubViewWithText2:(NSString*)text inView:(UIView*)inView hideTime:(float)time showType:(int)type starttype:(TipHubViewAnimationType)starttype endtype:(TipHubViewAnimationType)endtype rect:(CGRect)viewRc
{
    //提示语有换行 \n 去掉换行  直接一行显示 一行 防止高度不准确
    text = [text stringByReplacingOccurrencesOfString: @"\r" withString:@""];
    text = [text stringByReplacingOccurrencesOfString: @"\n" withString:@""];
    
    [[DZMobileCtrl sharedCtrl] showHub:NO];
    {
        BOOL bInKeyWindow = NO;
        //		if (!inView)    // 现在默认添加的keywindow 防止shadowalert 挡住了提示框 //阅读界面的提示框如果有问题的话再修改这里
        {
            inView = [UIApplication sharedApplication].keyWindow;
            bInKeyWindow = YES;
        }
        if (inView)
        {
            CGRect rcMain = viewRc;//inView.frame;
            CGSize tipSize = [text customSizeWithFont:[UIFont systemFontOfSize:12]];
            switch (type) {
                case TipHubView_Show_Type_Bottom:
                {
                    //7.0修改 弹窗宽度不再固定 根据文字的宽度改变
//                    s_TipHubView = [[BottomTipHubView alloc] initWithFrame:CGRectMake(rcMain.origin.x + rcMain.size.width/2 - TEXT_HUB_MAX_W/2 , rcMain.origin.y + rcMain.size.height/2 - TEXT_HUB_MARGIN_H/2, TEXT_HUB_MAX_W, TEXT_HUB_MARGIN_H)];
                    s_TipHubView = [[BottomTipHubView alloc] initWithFrame:CGRectMake(rcMain.origin.x + rcMain.size.width/2 - TEXT_HUB_MAX_W/2 , rcMain.origin.y + rcMain.size.height/2 - TEXT_HUB_MARGIN_H/2, tipSize.width, TEXT_HUB_MARGIN_H)];
                }
                    break;
                case TipHubView_Show_Type_Bubble:
                {
                    s_TipHubView = [[BubbleTipHubView alloc] initWithFrame:CGRectMake(rcMain.origin.x + rcMain.size.width/2 - TEXT_HUB_MAX_W/2 , rcMain.origin.y + rcMain.size.height/2 - TEXT_HUB_MARGIN_H/2, TEXT_HUB_MAX_W, TEXT_HUB_MARGIN_H)];
                }
                    break;
                case TipHubView_Show_Type_Mid_Other_BG:
                {
                    s_TipHubView = [[MidBgTipHubView alloc] initWithFrame:CGRectMake(rcMain.origin.x + rcMain.size.width/2 - TEXT_HUB_MAX_W/2 , rcMain.origin.y + rcMain.size.height/2 - TEXT_HUB_MARGIN_H/2, TEXT_HUB_MAX_W, TEXT_HUB_MARGIN_H)];
                }
                    break;
                case TipHubView_Show_Type_Mid_KEYBOARD:
                {
                    s_TipHubView = [[TipHubView alloc] initWithFrame:CGRectMake(rcMain.origin.x + rcMain.size.width/2 - TEXT_HUB_MAX_W/2 , rcMain.origin.y + rcMain.size.height/2 - TEXT_HUB_MARGIN_H/2 - 100, TEXT_HUB_MAX_W, TEXT_HUB_MARGIN_H)];
                    s_TipHubView.backgroundColor = [TipHubViewManager getTipBgColor];
                }
                    break;
                default:
                {
                    s_TipHubView = [[TipHubView alloc] initWithFrame:CGRectMake(rcMain.origin.x + rcMain.size.width/2 - TEXT_HUB_MAX_W/2 , rcMain.origin.y + rcMain.size.height/2 - TEXT_HUB_MARGIN_H/2, TEXT_HUB_MAX_W, TEXT_HUB_MARGIN_H)];
                    s_TipHubView.backgroundColor = [TipHubViewManager getTipBgColor];
                }
                    break;
            }
            
            
            // toast统一加圆角
            s_TipHubView.layer.cornerRadius = 4;
            s_TipHubView.layer.masksToBounds = YES;
            
            
            if ([s_TipHubView isKindOfClass:[TipHubView class]])
            {
                [s_TipHubView setInView:inView];
                [s_TipHubView setInitRect:viewRc];
                [s_TipHubView setShowType:type];
                s_TipHubView.bInKeyWindow = bInKeyWindow;
                [s_TipHubView setText:text];
                s_TipHubView.duration = time;
                s_TipHubView.endAnimationType = endtype;
            }
            else if ([s_TipHubView isKindOfClass:[TaskTipHubView class]])
            {
                [s_TipHubView setText:text];
                [s_TipHubView setShowType:type];
                s_TipHubView.duration = time;
            }
            
            [inView addSubview:(UIView *)s_TipHubView];

            if ([s_TipHubView respondsToSelector:@selector(showTipHubView)])
            {
                [s_TipHubView performSelector:@selector(showTipHubView)];
            }
            
            if ([s_TipHubView respondsToSelector:@selector(closeTipHubView)])
            {
                [s_TipHubView performSelector:@selector(closeTipHubView) withObject:nil afterDelay:time];
            }
        }
    }
}
+ (void)showTipHubViewWithText:(NSString*)text inView:(UIView*)inView hideTime:(float)time showType:(int)type starttype:(TipHubViewAnimationType)starttype endtype:(TipHubViewAnimationType)endtype rect:(CGRect)viewRect
{
    if(!text || [text length] == 0)
    {
        return;
    }
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                 text,@"text",
                                 [NSNumber numberWithFloat:time],@"time",
                                 [NSNumber numberWithInt:type],@"type",
                                 [NSNumber numberWithInteger:starttype],@"startType",
                                 [NSNumber numberWithInteger:endtype],@"endType",
                                 [NSValue  valueWithCGRect:viewRect], @"viewRect",
                                 nil];
    
    
    if (s_TipHubView)
    {
        //正在显示
        if ([[DZMobileCtrl sharedCtrl].tipHubViewArr count])
        {
            NSDictionary* dic = [[DZMobileCtrl sharedCtrl].tipHubViewArr lastObject];
            NSString* text1 = [dic objectForKey:@"text"];
            if ([text isEqualToString:text1])
            {
                //和前一个提示内容相同则不加入
                return;
            }
        }
        
        [[DZMobileCtrl sharedCtrl].tipHubViewArr addObject:dic];
        return;
    }
    else
    {
        [[DZMobileCtrl sharedCtrl].tipHubViewArr addObject:dic];
    }
    
   	[TipHubViewManager showTipHubViewWithText2:text
                                        inView:inView
                                      hideTime:time
                                      showType:type
                                     starttype:starttype
                                       endtype:endtype
                                          rect:viewRect];
}
+ (void)showTipHubViewWithText:(NSString*)text inView:(UIView*)inView hideTime:(float)time showType:(int)type starttype:(TipHubViewAnimationType)starttype endtype:(TipHubViewAnimationType)endtype
{
    [TipHubViewManager showTipHubViewWithText:text inView:inView hideTime:time showType:type starttype:starttype endtype:endtype rect:inView.frame];
}

+ (UIColor*)getTipBgColor
{
    return KColor(K000000_Color, 0.8);
}

@end
