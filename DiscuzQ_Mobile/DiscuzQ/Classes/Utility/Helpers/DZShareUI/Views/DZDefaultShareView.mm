//
//  DZDefaultShareView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2016/12/21.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import "DZDefaultShareView.h"
#import "DZShareCenter.h"
#import "DZShareItemButton.h"


//分享白色背景 高
#define share_back_H         (161 + KTabbar_Gap)
//item高
#define share_itemH       62 // 高度
//item宽
#define share_itemW        (KScreenWidth-(4*share_itemSpace)-(share_itemLeftMargin *2))/5  //宽度
//item X
#define share_itemY            25 + share_itemH //X值
//左间距
#define share_itemLeftMargin   1  //12.5
//间距
#define share_itemSpace        1   // 问 UI 如果都是 微信朋友圈 5个字 ，文字之间 间距该是多少 5

static DZDefaultShareView *shareView = nil;

@interface DZDefaultShareView ()

@property (nonatomic, strong) NSArray *DataArray;  //!< 属性注释
@property (nonatomic, strong) DZShareModel *shareModel;  //!< <#属性注释#>
@property (nonatomic, strong) NSMutableArray *sharedButtonArray;  //!< 属性注释

@end

@implementation DZDefaultShareView

/**
 *  原生调起 分享页面
 */
+ (void)showDefaultShareViewFromModel:(DZShareModel *)model{
    
    [[self alloc] initshareViewFromNative:model];
}

//初始化
- (void)initshareViewFromNative:(DZShareModel *)model{
    
    if (!shareView) {
        shareView = [[DZDefaultShareView alloc] init];
    }
    
    self.shareModel = model;
    [self initData];
    [self initDefaultShareUI];
    
}

- (void)initData{
    
    self.DataArray = @[@{@"title":@"微信好友",@"image":@"share_logo1",@"pressImage":@"share_logo1_press"}
                    ,@{@"title":@"微信朋友圈",@"image":@"share_logo2",@"pressImage":@"share_logo2_press"}
                    ,@{@"title":@"QQ好友",@"image":@"share_logo3",@"pressImage":@"share_logo3_press"}
                    ,@{@"title":@"QQ空间",@"image":@"share_logo4",@"pressImage":@"share_logo4_press"}
                    ,@{@"title":@"新浪微博",@"image":@"share_logo5",@"pressImage":@"share_logo5_press"}];

self.sharedButtonArray = [[NSMutableArray alloc]initWithCapacity:5];
}

/**
 *  初始化视图
 */
- (void)initDefaultShareUI{
    
    CGRect shareBgRect = CGRectMake(0, KScreenHeight, KScreenWidth, share_back_H);
    CGRect finaRect = shareBgRect;
    finaRect.origin.y = KScreenHeight-share_back_H;
    
    /********************** 添加底层bgView *********************/
    UIWindow *window  = [UIApplication sharedApplication].keyWindow;
    
    UIView *backBlackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    backBlackView.backgroundColor = KColor(@"0x000000", 0.4);
    backBlackView.tag = 12889034;
    [window addSubview:backBlackView];
    
    UITapGestureRecognizer *tapclearGesture = [[UITapGestureRecognizer alloc] initWithTarget:shareView action:@selector(dismissShareView)];
    [backBlackView addGestureRecognizer:tapclearGesture];
    
    /****************** 添加分享shareBGView ****************/
    UIView *shareBGView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight-share_back_H, KScreenWidth, share_back_H)];
    shareBGView.userInteractionEnabled = YES;
    shareBGView.tag = 12889035;
    shareBGView.backgroundColor = [KWhite_Color colorWithAlphaComponent:1];
    [backBlackView addSubview:shareBGView];
    
    /************* 添加 Button item ****************/
    for (int i = 0; i<self.DataArray.count; i++) {
        
        NSDictionary *itemDict = self.DataArray[i];
        
        CGFloat itemY = share_itemY;
        CGFloat itemX = share_itemLeftMargin+(share_itemW+share_itemSpace)*i;
        
        NSInteger imageTag = i+1;
        DZShareItemButton * button = [[DZShareItemButton alloc]initWithFrame:CGRectMake(itemX, itemY, share_itemW, share_itemH) ImageTag:imageTag title:[itemDict objectForKey:@"title"] titleFont:12 titleColor:KColor(@"0x333333", 1.0)];
        [button setImage:[UIImage imageNamed:[itemDict objectForKey:@"image"]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[itemDict objectForKey:@"pressImage"]] forState:UIControlStateHighlighted];
        
        [button addTarget:shareView action:@selector(shareTypeClickIndex:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [shareBGView addSubview:button];
        
        [self.sharedButtonArray addObject:button];
        
    }
    
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, share_back_H - 48-KTabbar_Gap, KScreenWidth, 0.5)];
    lineView.backgroundColor = KGroupLine_Color;
    [shareBGView addSubview:lineView];
    
    /******************** 取消 ************************/
    
    UIButton *shareLinkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shareLinkButton.frame = CGRectMake(0, share_back_H-49-KTabbar_Gap, shareBGView.width, 49);
    [shareLinkButton setImage:[UIImage imageNamed:@"share_icon_link"] forState:UIControlStateNormal];
    [shareLinkButton setTitle:@"复制链接" forState:UIControlStateNormal];
    shareLinkButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [shareLinkButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    
    [shareLinkButton setTitleColor:KColor(@"0x888888", 1.0) forState:UIControlStateNormal];
    [shareLinkButton addTarget:shareView action:@selector(shareLinkButtonDismissShareView:) forControlEvents:UIControlEventTouchUpInside];
    [shareBGView addSubview:shareLinkButton];
    
    /****************** 动画 **********************/
    shareBGView.alpha = 0;
    backBlackView.alpha = 0;
    
    [UIView animateWithDuration:0.35 animations:^{
        backBlackView.backgroundColor = [KBlack_Color colorWithAlphaComponent:0.5];
        shareBGView.frame = finaRect;
        shareBGView.alpha = 0.99;
        backBlackView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    
    for (DZShareItemButton *button in self.sharedButtonArray) {
        NSInteger idx = [self.sharedButtonArray indexOfObject:button];
        
        [UIView animateWithDuration:0.9+idx*0.1 delay:0 usingSpringWithDamping:0.52 initialSpringVelocity:1.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            CGRect buttonFrame = [button frame];
            buttonFrame.origin.y -= share_itemH;
            button.frame = buttonFrame;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
}


// 分享按钮 点击方法
- (void)shareTypeClickIndex:(UIButton *)btn{
    
    [DZShareCenter shareButtonActionWithType:(DQShareType)btn.tag model:self.shareModel];
    
    // 消除分享View
    [self dismissShareView];
}

// 复制链接 按钮
-(void)shareLinkButtonDismissShareView:(UIButton *)btn{
    
    [DZShareCenter shareButtonActionWithType:DQShareLink model:self.shareModel];
    
    [self dismissShareView];
}

- (void)dismissShareView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *blackContainerView = [window viewWithTag:12889034];
    UIView *blackView = [window viewWithTag:12889035];
    
    [UIView animateWithDuration:0.3 animations:^{
        blackContainerView.alpha = 0;
        blackView.top = KScreenHeight;
    } completion:^(BOOL finished) {
        [blackView removeFromSuperview];
        [blackContainerView removeFromSuperview];
    }];
}







@end
