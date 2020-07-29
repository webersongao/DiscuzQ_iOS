//
//  PRTriangleCaptionBtn.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/6/4.
//

#import "PRTriangleCaptionBtn.h"
#import "UIButton+WebCache.h"
#import "PRNaviTabManager.h"

@interface PRTriangleCaptionBtn ()
{
    UIButton* m_topBtn;
    NSString *m_buttonKey; // 每一个tab对应的唯一key值
    UIButton* m_bottomBtn;
    
    NSString *m_highImageUrl;
    NSString *m_normalImageUrl;
}
@end

@implementation PRTriangleCaptionBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        m_buttonKey = nil;
        _isSelected = NO;
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGRect rc = self.bounds;
    if (m_bottomBtn)
    {
        CGRect rcBottom = rc;
        rcBottom.origin.y = rc.size.height/2-2;
        rcBottom.size.height = rc.size.height/2;
        m_bottomBtn.frame = rcBottom;
        
        CGRect rcTop = rc;
        rcTop.origin.y += 2;
        rcTop.size.height = rc.size.height/2;
        m_topBtn.frame = rcTop;
    }
    else
    {
        if (m_normalImageUrl.length) {
            [m_topBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:m_normalImageUrl] forState:UIControlStateNormal completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                CGFloat imgWidth = image ? ((image.size.width * kStoreIconHeight) / image.size.height) : 40.f;
                CGFloat maginX = MAX(kNaviLeftRightMargin, ((self.width - imgWidth)/2.f));
                CGFloat maginY = (self.height - kStoreIconHeight)/2.f;
                m_topBtn.frame = CGRectMake(maginX, maginY, imgWidth, kStoreIconHeight);
            }];
        }else{
            m_topBtn.frame = rc;
        }
    }
}

- (void)setCaptionTitleTopFont:(UIFont *)font
{
    if (m_topBtn)
    {
        m_topBtn.titleLabel.font = font;
    }
    if (m_bottomBtn)
    {
        m_bottomBtn.titleLabel.font = font;
    }
}

- (void)setTitleAlignment:(NSTextAlignment)alignment
{
    UIControlContentHorizontalAlignment alignment1 = UIControlContentHorizontalAlignmentCenter;
    
    if (alignment == NSTextAlignmentLeft)
    {
        alignment1 = UIControlContentHorizontalAlignmentLeft;
    }
    if (m_topBtn)
    {
        m_topBtn.contentHorizontalAlignment = alignment1;
    }
    
    if (m_bottomBtn)
    {
        m_bottomBtn.contentHorizontalAlignment = alignment1;
    }
}

- (void)setCaptionTitleColor:(UIColor *)color forState:(UIControlState)State{
    if (m_topBtn) {
        [m_topBtn setTitleColor:color forState:State];
    }
}
- (void)setCaptionBtnTitleColor:(UIColor *)color forSelectState:(BOOL)bSelectState{
    
    if (m_topBtn)
    {
        [self updateCaptionState:bSelectState];
        [m_topBtn setTitleColor:color forState:UIControlStateNormal];
    }
}

- (void)updateCaptionState:(BOOL)bSelected{
    _isSelected = m_topBtn.selected = bSelected;
    if (m_normalImageUrl.length) {
        NSString *backImgIrl = bSelected ? m_highImageUrl : m_normalImageUrl;
        
        [m_topBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:backImgIrl] forState:UIControlStateNormal completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            //            CGFloat imgWidth = image ? ((image.size.width * kStoreIconHeight) / image.size.height) : 40.f;
            //            CGFloat maginX = MAX(kNaviLeftRightMargin, ((self.width - imgWidth)/2.f));
            //            CGFloat maginY = (self.height - kStoreIconHeight)/2.f;
            //            m_topBtn.frame = CGRectMake(maginX, maginY, imgWidth, kStoreIconHeight);
        }];
    }
}

- (void)addCaptionTitleTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
{
    if (m_topBtn)
    {
        [m_topBtn addTarget:target action:action forControlEvents:controlEvents];
    }
    if (m_bottomBtn)
    {
        [m_bottomBtn addTarget:target action:action forControlEvents:controlEvents];
    }
}


- (void)setBottomBtnTitleColor
{
    if ([m_bottomBtn.currentTitle length] == 1 && [m_bottomBtn.currentTitle intValue] == 0)
    {
        [m_bottomBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [m_bottomBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    }
    else
    {
        [m_bottomBtn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [m_bottomBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    }
}

- (void)setCaptionTitleInfo:(NSString*)normalTitle bottom:(NSString*)bottom image:(NSString *)imagUrl highImgUrl:(NSString *)highImgUrl buttonKey:(NSString *)key
{
    if (!normalTitle.length && bottom.length) {
        normalTitle = bottom;
    }
    m_buttonKey = key;
    m_topBtn = [[UIButton alloc] init];
    [self addSubview:m_topBtn];
    //    m_topBtn.backgroundColor = kRandomColor;
    if (imagUrl.length) {
        m_normalImageUrl = imagUrl;
//        __weak typeof(self) weakSelf = self;
        m_highImageUrl = highImgUrl.length ? highImgUrl : imagUrl;
        [m_topBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:m_highImageUrl] forState:UIControlStateSelected|UIControlStateHighlighted completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!image && error) {
                [self->m_topBtn setTitle:normalTitle forState:UIControlStateNormal];
            }
        }];
    }else{
        [m_topBtn setTitle:normalTitle forState:UIControlStateNormal];
    }
    
    if (bottom && [bottom length])
    {
        m_bottomBtn = [[UIButton alloc] init];
        [self addSubview:m_bottomBtn];
        [m_bottomBtn setTitle:bottom forState:UIControlStateNormal];
        m_bottomBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setBottomBtnTitleColor];
    }
    
    [self setFrame:self.frame];
}



@end

















