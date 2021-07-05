//
//  DZQMediaGroupView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/5.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQMediaGroupView.h"

//图片展开视图
@interface DZQMediaGroupView ()<UIScrollViewDelegate,DZQMediaImageCellDelegate,DZQMediaVideoCellDelegate>

@property(nonatomic,assign)CGFloat           height;
@property(nonatomic,assign)CGFloat           width;

//展示图数组
@property(nonatomic,strong)NSArray           *groupItems;
//当前展示的视图
@property(nonatomic,assign)NSInteger         currentIndex;
@property(nonatomic,assign)DZQMediaGroupItem  *currentItem;
@property(nonatomic,strong)UIImageView       *fromImgView;
//分页控制器
@property(nonatomic,assign)NSInteger         currentPage;
@property(nonatomic,strong)UIPageControl     *mPageController;
//第一张展示图
@property(nonatomic,strong)UIImageView       *fristImgView;

//半透明背景图
@property(nonatomic,strong)UIView            *backView;
//图片数组滚动视图
@property(nonatomic,strong)UIScrollView      *mScrollView;

//屏幕是否正在旋转 旋转过程中滚动视图不能进行位移
@property(nonatomic,assign)BOOL              deviceTransform;
//屏幕在一定情况下不需要处理旋转操作
@property(nonatomic,assign)UIDeviceOrientation  deviceOrientation;


@end

@implementation DZQMediaGroupView


-(instancetype)initWithGroupItems:(NSArray *)groupItems currentIndex:(NSInteger)currentIndex{
    if(self = [super init]){
        self.backgroundColor = [UIColor clearColor];
        self.frame = [UIScreen mainScreen].bounds;
        
        _groupItems = groupItems;
        _currentIndex = currentIndex;
        _currentPage = _currentIndex;
        _currentItem = _groupItems[_currentIndex];
        _deviceTransform = NO;
        _width = [UIScreen mainScreen].bounds.size.width;
        _height = [UIScreen mainScreen].bounds.size.height;
        _deviceOrientation = UIDeviceOrientationUnknown;
        
        
        //屏幕旋转监听
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
        
        
        _backView = [[UIView alloc]initWithFrame:self.bounds];
        _backView.backgroundColor = [UIColor blackColor];
        [self addSubview:_backView];
        _backView.alpha = 0.01;

        _mScrollView = UIScrollView.new;
        _mScrollView.frame = self.bounds;
        _mScrollView.delegate = self;
        _mScrollView.scrollsToTop = NO;
        _mScrollView.pagingEnabled = YES;
        _mScrollView.alwaysBounceHorizontal = _groupItems.count > 1;
        _mScrollView.showsHorizontalScrollIndicator = NO;
        _mScrollView.showsVerticalScrollIndicator = NO;
        _mScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _mScrollView.delaysContentTouches = NO;
        _mScrollView.canCancelContentTouches = YES;
        _mScrollView.backgroundColor = [UIColor clearColor];
        [self addSubview:_mScrollView];
        
        
        _mScrollView.contentSize = CGSizeMake(_mScrollView.width * self.groupItems.count, _mScrollView.height);
        _mScrollView.contentOffset = CGPointMake(_mScrollView.width * _currentIndex, 0);

        
        for(int i=0;i<_groupItems.count;++i){
            DZQMediaGroupItem *item = _groupItems[i];
            
            if(item.imageType == DZQImageGroupImage){
                DZQMediaImageCell *imageCell = [[DZQMediaImageCell alloc]initWithItem:item];
                imageCell.imageCelldelegate = self;
                [_mScrollView addSubview:imageCell];
                
                if(i==_currentIndex){
                    _fromImgView = item.fromImgView;
                    _fristImgView = item.fromImgView;
                    imageCell.imageCellFrame =  [_mScrollView convertRect:_fromImgView.frame fromView:_fromImgView.superview];
                    _fromImgView.hidden = YES;
                }else{
                    imageCell.imageCellFrame = CGRectMake(i*_mScrollView.width, 0, _mScrollView.width, _mScrollView.height);
                }
            }else if(item.imageType == DZQImageGroupGif){
                DZQMediaImageCell *imageCell = [[DZQMediaImageCell alloc]initWithItem:item];
                imageCell.imageCelldelegate = self;
                [_mScrollView addSubview:imageCell];
                
                if(i==_currentIndex){
                    _fromImgView = item.fromImgView;
                    _fristImgView = item.fromImgView;
                    imageCell.imageCellFrame =  [_mScrollView convertRect:_fromImgView.frame fromView:_fromImgView.superview];
                    _fromImgView.hidden = YES;
                }else{
                    imageCell.imageCellFrame = CGRectMake(i*_mScrollView.width, 0, _mScrollView.width, _mScrollView.height);
                }
            }else{
                DZQMediaVideoCell *videoView = [[DZQMediaVideoCell alloc]initWithItem:item];
                videoView.videoViewDelegate = self;
                [_mScrollView addSubview:videoView];
                videoView.showType = DZQImageShowValue1;
                
                if(i==_currentIndex){
                    _fromImgView = item.fromImgView;
                    _fristImgView = item.fromImgView;
                    videoView.videoViewFrame =  [_mScrollView convertRect:_fromImgView.frame fromView:_fromImgView.superview];
                    _fromImgView.hidden = YES;
                }else{
                    videoView.videoViewFrame = CGRectMake(i*_mScrollView.width, 0, _mScrollView.width, _mScrollView.height);
                }
            }
        }
    }
    return self;
}

- (void)layoutSubviews{
    
    if(_deviceTransform==YES)return;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.alpha = 1;
        if(self.currentItem.imageType == DZQImageGroupImage ||
           self.currentItem.imageType == DZQImageGroupGif){
            DZQMediaImageCell *imageCell = self.mScrollView.subviews[self.currentIndex];
            imageCell.imageCellFrame = self.mScrollView.bounds;
        }else{
            DZQMediaVideoCell *videoView = self.mScrollView.subviews[self.currentIndex];
            videoView.videoViewFrame = self.mScrollView.bounds;
        }
    } completion:^(BOOL finished) {
        if(self.currentItem.imageType == DZQImageGroupVideo){
            DZQMediaVideoCell *videoView = self.mScrollView.subviews[self.currentIndex];
            videoView.showType = DZQImageShowValue2;
        }
    }];
}

//UISlider 和 UIScrollView手势冲突解决
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if([view isKindOfClass:[UISlider class]]){
        _mScrollView.scrollEnabled = NO;
    }else{
        _mScrollView.scrollEnabled = YES;
    }
    return view;
}


#pragma DZQMediaImageCellImageDelegate 点击图片回收 10+
-(void)DZQMediaImageCellImageClick:(NSInteger)index gesture:(UITapGestureRecognizer *)gesture{
    
    CGRect fromRect1 = [_mScrollView convertRect:_fromImgView.frame fromView:_fromImgView.superview];
    CGRect fromRect2 = [_mScrollView convertRect:_fristImgView.frame fromView:_fristImgView.superview];
    
    DZQMediaImageCell *imageCell = _mScrollView.subviews[index-10];
   
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.alpha = 0.01;
        if(fromRect1.origin.y!=0){
            imageCell.imageCellFrame = fromRect1;
        }else{
            imageCell.imageCellFrame = fromRect2;
            imageCell.alpha = 0.01;
        }
        
    } completion:^(BOOL finished) {
        self.fromImgView.hidden = NO;
        self.dismissBlock();
    }];
}


#pragma DZQMediaVideoCellImageDelegate 点击视频回收
-(void)DZQMediaVideoCellImageButtonClick:(UIButton *)sender item:(DZQMediaGroupItem *)item{
    
    CGRect fromRect1 = [_mScrollView convertRect:_fromImgView.frame fromView:_fromImgView.superview];
    CGRect fromRect2 = [_mScrollView convertRect:_fristImgView.frame fromView:_fristImgView.superview];
    
    DZQMediaVideoCell  *videoView = _mScrollView.subviews[item.itemTag-10];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.alpha = 0.01;
        if(fromRect1.origin.y!=0){
            videoView.videoViewFrame = fromRect1;
        }else{
            videoView.videoViewFrame = fromRect2;
            videoView.alpha = 0.01;
        }
        
    } completion:^(BOOL finished) {
        self.fromImgView.hidden = NO;
        self.dismissBlock();
    }];
}


//处理翻页 图片缩放需要回收 视频不需要
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGPoint offset = scrollView.contentOffset;
    CGFloat sizeWidth = (scrollView.contentSize.width/_groupItems.count);
    _currentPage = offset.x / sizeWidth;
    
    if(_currentPage!=_currentIndex){
        if(_currentItem.imageType == DZQImageGroupImage ||
           _currentItem.imageType == DZQImageGroupGif){
            DZQMediaImageCell *imageCell = _mScrollView.subviews[_currentIndex];
            if (imageCell.zoomScale>1)[imageCell setZoomScale:1 animated:YES];
        }else{
            DZQMediaVideoCell *videoView = _mScrollView.subviews[_currentIndex];
            videoView.showType = DZQImageShowValue4;
        }
        _currentIndex = _currentPage;
        _currentItem = _groupItems[_currentIndex];
        _fromImgView.hidden = NO;
        _fromImgView = _currentItem.fromImgView;
        _fromImgView.hidden = YES;
    }
}


//监听屏幕旋转 重新设计尺寸 支持三个方向
- (void)deviceOrientationDidChange{
    
    _deviceTransform = YES;
    UIDevice *device = [UIDevice currentDevice];
    switch (device.orientation) {
        case UIDeviceOrientationLandscapeLeft:
            KSLog(@"屏幕向左横置");
            if(_deviceOrientation==UIDeviceOrientationPortrait||
               _deviceOrientation==UIDeviceOrientationLandscapeRight||
               _deviceOrientation==UIDeviceOrientationUnknown){
                [self landscapeLeft];
            }
            _deviceOrientation = UIDeviceOrientationLandscapeLeft;
            break;
            
        case UIDeviceOrientationLandscapeRight:
            KSLog(@"屏幕向右橫置");
            if(_deviceOrientation==UIDeviceOrientationLandscapeLeft||
               _deviceOrientation==UIDeviceOrientationPortrait||
               _deviceOrientation==UIDeviceOrientationUnknown){
                [self landscapeRight];
            }
            _deviceOrientation = UIDeviceOrientationLandscapeRight;
            break;
            
        case UIDeviceOrientationPortrait:
            KSLog(@"屏幕直立");
            if(_deviceOrientation==UIDeviceOrientationLandscapeLeft||
               _deviceOrientation==UIDeviceOrientationLandscapeRight){
                [self portrait];
            }
            _deviceOrientation = UIDeviceOrientationPortrait;
            break;
        default:
            _deviceTransform = NO;
            break;
    }
    
}


//屏幕左转
-(void)landscapeLeft{

    [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeLeft;

    [UIView animateWithDuration:0.2f animations:^{
        
        self.mScrollView.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.mScrollView.frame = self.bounds;
        [self setScrollerViewLandscape];
        
        if(self.currentItem.imageType == DZQImageGroupImage ||
           self.currentItem.imageType == DZQImageGroupGif){
            DZQMediaImageCell *imageCell = self.mScrollView.subviews[self.currentIndex];
            if (imageCell.zoomScale>1)[imageCell setZoomScale:1 animated:NO];
        }
        
    } completion:^(BOOL finished) {
        self.deviceTransform = NO;
    }];
}

//屏幕右转
-(void)landscapeRight{
    
    [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeRight;

    [UIView animateWithDuration:0.2f animations:^{
        self.mScrollView.transform = CGAffineTransformMakeRotation(- M_PI_2);
        self.mScrollView.frame = CGRectMake(0, 0, self.width, self.height);
        [self setScrollerViewLandscape];
        
        if(self.currentItem.imageType == DZQImageGroupImage ||
           self.currentItem.imageType == DZQImageGroupGif){
            DZQMediaImageCell *imageCell = self.mScrollView.subviews[self.currentIndex];
            if (imageCell.zoomScale>1)[imageCell setZoomScale:1 animated:NO];
        }
        
    } completion:^(BOOL finished) {
        self.deviceTransform = NO;
    }];
}

//屏幕正向直立
-(void)portrait{
    
    [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortrait;

    [UIView animateWithDuration:0.2f animations:^{
        self.mScrollView.transform = CGAffineTransformMakeRotation(0);
        self.mScrollView.frame = self.bounds;
        [self setScrollerViewRestore];
        
        if(self.currentItem.imageType == DZQImageGroupImage ||
           self.currentItem.imageType == DZQImageGroupGif){
            DZQMediaImageCell *imageCell = self.mScrollView.subviews[self.currentIndex];
            if (imageCell.zoomScale>1)[imageCell setZoomScale:1 animated:NO];
        }
        
    } completion:^(BOOL finished) {
        self.deviceTransform = NO;
    }];
}


//横屏 设置滚动视图的内容部分和图片
-(void)setScrollerViewLandscape{
    
    _mScrollView.contentSize = CGSizeMake(_mScrollView.height*_groupItems.count, 0);
    _mScrollView.contentOffset = CGPointMake(_mScrollView.height * _currentIndex, 0);
    for(int i=0;i<_mScrollView.subviews.count;++i){
        DZQMediaGroupItem *item = _groupItems[i];
        if(item.imageType == DZQImageGroupImage ||
           item.imageType == DZQImageGroupGif){
            DZQMediaImageCell *imageCell = _mScrollView.subviews[i];
            imageCell.imageCellFrame = CGRectMake(i*_mScrollView.height, 0, _mScrollView.height, _mScrollView.width);
        }
        else{
            DZQMediaVideoCell *videoView = _mScrollView.subviews[i];
            videoView.videoViewFrame = CGRectMake(i*_mScrollView.height, 0, _mScrollView.height, _mScrollView.width);
        }
    }
}


//屏幕直立恢复frame
-(void)setScrollerViewRestore{
  
    _mScrollView.contentSize = CGSizeMake(_mScrollView.width*_groupItems.count, _mScrollView.height);
    _mScrollView.contentOffset = CGPointMake(_mScrollView.width * _currentIndex, 0);
    for(int i=0;i<_mScrollView.subviews.count;++i){
        DZQMediaGroupItem *item = _groupItems[i];
        if(item.imageType == DZQImageGroupImage ||
           item.imageType == DZQImageGroupGif){
            DZQMediaImageCell *imageCell = _mScrollView.subviews[i];
            imageCell.imageCellFrame = CGRectMake(i*_mScrollView.width, 0, _mScrollView.width, _mScrollView.height);
        }
        else{
            DZQMediaVideoCell *videoView = _mScrollView.subviews[i];
            videoView.videoViewFrame = CGRectMake(i*_mScrollView.width, 0, _mScrollView.width, _mScrollView.height);
        }
    }
}


@end

