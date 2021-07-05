//
//  DZQChatEmotionView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/9/25.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatEmotionView.h"
#import "DZQChatEmotionModel.h"

@interface DZQChatEmotionView ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,DZQChatEmotionFooterDelegate>

@property(nonatomic,strong)DZQChatEmotionCenter *emotion;
@property (nonatomic,strong)NSMutableArray *defaultEmoticons;
@property (nonatomic,strong)NSMutableArray *emoticonImages;

//每一页的表情数量
@property (nonatomic,assign)NSInteger number;
//底部pagecontroller显示的数量
@property (nonatomic,assign)NSInteger numberPage;
@property (nonatomic,assign)NSInteger numberPage1;
@property (nonatomic,assign)NSInteger numberPage2;


@property (nonatomic,strong)DZQChatEmotionLayout *layout;
@property (nonatomic,strong)UIPageControl *pageControl;

@end

@implementation DZQChatEmotionView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = KLightGray_Color;
        
        _number = DZQChatEmojiRow * DZQChatEmojiLine;
        _defaultEmoticons = [NSMutableArray array];
        _emoticonImages = [NSMutableArray array];
        
        
        _footer = [[DZQChatEmotionFooter alloc] initWithFrame:CGRectMake(0, self.height-DZQChatEmotionFooterH, kScreenWidth, DZQChatEmotionFooterH)];
        [self addSubview:_footer];
        _footer.delegate = self;
        
        
        self.layout = [[DZQChatEmotionLayout alloc] init];

        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.height-_footer.height-20) collectionViewLayout:self.layout];
        self.collectionView.backgroundColor = KLightGray_Color;
        self.collectionView.backgroundView.backgroundColor = KLightGray_Color;
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[DZQChatEmotionCell class] forCellWithReuseIdentifier:@"DZQChatEmotionCell"];

        [self addSubview:self.pageControl];


        //获取本地的表情和系统表情
        dispatch_async(dispatch_get_global_queue(0, 0), ^{

            self.emotion = [DZQChatEmotionCenter sharedCenter];
            [self.emotion initEmotionImages];
            [self.emotion initSystemEmotionImages];
            
            [self.emoticonImages addObjectsFromArray:self.emotion.images];
            self.defaultEmoticons = [self.emotion dealWithArray:self.emotion.images arr2:self.emotion.systemImages];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
                
                self.numberPage = self.defaultEmoticons.count/self.number;
                self.numberPage1 = self.numberPage * self.emotion.images.count/(self.emotion.images.count + self.emotion.systemImages.count);
                self.numberPage2 = self.numberPage-self.numberPage1;
                self.pageControl.numberOfPages = self.numberPage1;
                
            });
        });

    }
    
    return self;
    
}


- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.defaultEmoticons.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DZQChatEmotionCell *emoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DZQChatEmotionCell" forIndexPath:indexPath];
    [emoCell updateEmotionCell:self.defaultEmoticons[indexPath.row]];
    return emoCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *emojiString = self.defaultEmoticons[indexPath.row];
    if (_delegate && [_delegate respondsToSelector:@selector(DZQChatKeyBordSymbolCellClick:)]) {
        [_delegate DZQChatKeyBordSymbolCellClick:emojiString];
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView == self.collectionView) {
        if (scrollView.contentOffset.x >= kScreenWidth * _numberPage1){
            [self setSymbolValue2];
        } else {
            [self setSymbolValue1];
        }
    }
}


#pragma DZQChatEmotionFooterDelegate
//底部切换表情500+  发送200
-(void)DZQChatEmotionFooterBtnClick:(UIButton *)sender{
    if(sender.tag==500){
        [self.collectionView setContentOffset:CGPointMake(0, self.collectionView.contentOffset.y) animated:YES];
        [self setSymbolValue1];
        self.pageControl.currentPage = 0;
        
    }else if (sender.tag==501){
        [self.collectionView setContentOffset:CGPointMake(kScreenWidth * _numberPage1, self.collectionView.contentOffset.y) animated:YES];
        [self setSymbolValue2];
        
    }else{
        if(_delegate && [_delegate respondsToSelector:@selector(DZQChatEmotionViewBtnAction:)]){
            [_delegate DZQChatEmotionViewBtnAction:sender.tag];
        }
    }
}

//跳转到第一类表情
-(void)setSymbolValue1{
    self.pageControl.numberOfPages = _numberPage1;
    self.pageControl.currentPage = (self.collectionView.contentOffset.x / kScreenWidth);
    _footer.mButton1.selected = YES;
    _footer.mButton2.selected = NO;
}

//跳转到第二类表情
-(void)setSymbolValue2{
    self.pageControl.numberOfPages = _numberPage2;
    self.pageControl.currentPage = ((self.collectionView.contentOffset.x - _numberPage1*kScreenWidth) / kScreenWidth);
    _footer.mButton1.selected = NO;
    _footer.mButton2.selected = YES;
}


-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _collectionView.bottom, 0, 10)];
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.userInteractionEnabled = NO;
        _pageControl.centerX = kScreenWidth*0.5;
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor grayColor]];
        [_pageControl setPageIndicatorTintColor:makeColorRgb(200, 200, 200)];
    }
    return _pageControl;
}

@end
