//
//  DZQChatWidgetView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatWidgetView.h"

@interface DZQChatWidgetView ()
{
    NSArray * m_titles,*m_images;
    NSInteger m_count;
    NSInteger m_number;
}
@property(nonatomic,strong)UIPageControl *pageControll;

@end


@implementation DZQChatWidgetView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = KLightGray_Color;
        m_count = 8;
        //添加功能只需要在标题和图片数组里面直接添加就行
        m_titles = @[@"照片",@"视频",@"位置"];
        m_images = @[@"zhaopian",@"shipin",@"weizhi"];
        m_number = m_titles.count/m_count+1;
        [self addSubview:self.innerScrollView];
        [self addSubview:self.pageControll];
        [self layoutAllWidgetSubviews];
    }
    return self;
}


//多功能点击10+
-(void)footerGestureClick:(UITapGestureRecognizer *)sender{
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(DZQChatWidgetViewBtnClick:)]){
        [self.delegate DZQChatWidgetViewBtnClick:sender.view.tag];
    }
}



// ===========  初始化 =============

-(UIScrollView *)innerScrollView{
    if (!_innerScrollView) {
        _innerScrollView = [UIScrollView new];
        _innerScrollView.frame = self.bounds;
        _innerScrollView.centerY = self.height * 0.5;
        _innerScrollView.backgroundColor = KLightGray_Color;
        _innerScrollView.pagingEnabled = YES;
        _innerScrollView.delegate = self;
        _innerScrollView.maximumZoomScale = 2.0;
        _innerScrollView.minimumZoomScale = 0.5;
        _innerScrollView.canCancelContentTouches = NO;
        _innerScrollView.delaysContentTouches = YES;
        _innerScrollView.showsVerticalScrollIndicator = FALSE;
        _innerScrollView.showsHorizontalScrollIndicator = FALSE;
        _innerScrollView.backgroundColor = [UIColor clearColor];
        _innerScrollView.contentSize = CGSizeMake(kScreenWidth *m_number, self.height);
    }
    return _innerScrollView;
}


-(UIPageControl *)pageControll{
    if (!_pageControll) {
        _pageControll = [[UIPageControl alloc] init];
        _pageControll.bounds = CGRectMake(0, 0, 160, 30);
        _pageControll.centerX  = kScreenWidth*0.5;
        _pageControll.top = kScreenHeight - 50;
        _pageControll.numberOfPages = m_number;
        _pageControll.currentPage = 0;
        _pageControll.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageControll.pageIndicatorTintColor = KLightGray_Color;
        _pageControll.backgroundColor = [UIColor clearColor];
    }
    return _pageControll;
}

-(void)layoutAllWidgetSubviews{
    
    for(NSInteger i=0;i<m_number;++i){
        
        UIView *backView = [UIView new];
        backView.bounds = CGRectMake(0, 0, self.width-40, self.height-55);
        backView.centerX = self.width*0.5 + i*self.width;
        backView.top = 20;
        [self.innerScrollView addSubview:backView];
        
        for(NSInteger j= (i * m_count);j<(i+1)*m_count && j<m_titles.count;++j){
            
            UIView *btnView = [UIView new];
            btnView.bounds = CGRectMake(0, 0, backView.width/4, backView.height*0.5);
            btnView.tag = 10+j;
            btnView.left = j%4 * btnView.width;
            btnView.top = j/4*btnView.height;
            [backView addSubview:btnView];
            btnView.backgroundColor = KLightGray_Color;
            if(btnView.top>btnView.height)btnView.top = 0;
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.bounds = CGRectMake(0, 0, 50, 50);
            btn.top = 15;
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.centerX = btnView.width*0.5;
            [btnView addSubview:btn];
            [btn setImage:[UIImage imageNamed:m_images[j]] forState:UIControlStateNormal];
            btn.userInteractionEnabled = YES;
            
            UILabel *lab = [UILabel new];
            lab.bounds = CGRectMake(0, 0, 80, 20);
            lab.text = m_titles[j];
            lab.font = [UIFont systemFontOfSize:12];
            lab.textColor = [UIColor grayColor];
            lab.textAlignment = NSTextAlignmentCenter;
            [lab sizeToFit];
            lab.centerX = btnView.width*0.5;
            lab.top = btn.bottom + 15;
            [btnView addSubview:lab];
            lab.userInteractionEnabled = YES;
    
            UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(footerGestureClick:)];
            [btnView addGestureRecognizer:gesture];
        }
    }
    
    
}



@end
