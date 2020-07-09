//
//  TBLodingView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "TBLoadingView.h"

static const NSUInteger ballCount = 3;
static const CGFloat ballSize = 12;
static const float ballScale = 0.7;
static const float s_delay = 0.09;//0.09
static const float s_duration = 0.49;

@interface TBLoadingView()

//@property (nonatomic, assign) NSMutableArray *balls;
@property (nonatomic, retain) UIView *leftBall;
@property (nonatomic, retain) UIView *midBall;
@property (nonatomic, retain) UIView *rightBall;

@property (nonatomic, assign) CGPoint leftBallPosition;
@property (nonatomic, assign) CGPoint midBallPosition;
@property (nonatomic, assign) CGPoint rightBallPosition;

@property (nonatomic, assign) CGPoint beginPosition;

@property (nonatomic, assign) BOOL animating;
@property (nonatomic, assign) BOOL bSlime;

@property (nonatomic, assign) CGFloat delay;
@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, assign) CGMutablePathRef path1;
@property (nonatomic, assign) CGMutablePathRef path2;
@property (nonatomic, assign) CGMutablePathRef path3;

@property (nonatomic, retain) NSArray *valueTransform1;
@property (nonatomic, retain) NSArray *valueTransform2;
@property (nonatomic, retain) NSArray *valueTransform3;

@property (nonatomic, retain) NSArray *valueZposition1;
@property (nonatomic, retain) NSArray *valueZposition2;
@property (nonatomic, retain) NSArray *valueZposition3;

@property (nonatomic, retain) UIImageView *imageview;
@property (nonatomic, retain) UIImage *image;

@end

@implementation TBLoadingView

- (id)initWithDefaultFrame
{
    CGRect frame = CGRectMake(0, 0, ballSize*5, kTBLoadingDefaultHeight);
    self = [super initWithFrame:frame];
    if (self)
    {
        _bSlime = NO;
        [self createView];
    }
    return self;
}

- (id)initWithImageViewByImage:(UIImage*)image
{
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self = [super initWithFrame:frame];
    if (self)
    {
        _bUseImageView = YES;
        _bSlime = NO;
        _bUseSingleImage = YES;
        _image = image;
        [self createView];
    }
    return self;
}

- (id)initWithActImageView
{
    CGRect frame = CGRectMake(0, 0, kImageViewSize, kImageViewSize);
    self = [super initWithFrame:frame];
    if (self)
    {
        _bUseImageView = YES;
        _bSlime = NO;
        [self createView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame bSlime:(BOOL)bSlime
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _bSlime = bSlime;
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.backgroundColor = [UIColor clearColor];
    _toPoint = _startPoint = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    _viscous = 1.0f;
    _delay = s_delay;
    _duration = s_duration*3;
    if (_bUseImageView)
    {
        if (_bUseSingleImage)
        {
            [self setPlayDuration:1.0 AndDelay:0.0];
            [self initImageView];
        }
        else
        {
            [self setPlayDuration:3.0 AndDelay:0.0];
            [self initImageView];
        }
        
    }
    else
    {
        [self createBalls];
        
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addAnimation:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(removeAnimation:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];

}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    CGPathRelease(_path1);
    CGPathRelease(_path2);
    CGPathRelease(_path3);
}


- (void)setPlayDuration:(CGFloat)duration AndDelay:(CGFloat)delay
{
    _delay = delay;
    _duration = duration;
}

- (void)setBallsLeftColor:(UIColor*)leftColor MidColor:(UIColor*)midcolor RightColor:(UIColor*)rightColor
{
    _leftBall.backgroundColor = leftColor;
    _midBall.backgroundColor = midcolor;
    _rightBall.backgroundColor = rightColor;
}

- (void)addAnimation:(NSNotification *)notificaiton
{
    if (_animating)
    {
        self.hidden = NO;
        [self startAnimation];
    }
}

- (void)removeAnimation:(NSNotification *)notificaiton
{
    if (_animating)
    {
        self.hidden = YES;
        [self stopAnimation];
    }
}

NSInteger compareTwoStringByNum1(id aInfo1, id aInfo2, void* context)
{
    int i1 = [[[(NSString *)aInfo1 lastPathComponent] stringByDeletingPathExtension] intValue];
    int i2 = [[[(NSString *)aInfo2 lastPathComponent] stringByDeletingPathExtension] intValue];
    return (i1-i2);
}

- (NSMutableArray *)imageArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:25];
    for (int index = 1; index<=25; index++) {
        NSString *imageName = [NSString stringWithFormat:@"loading_animation_%d",index];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    return array;
}

- (void)createBlackBall
{
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat yPos = CGRectGetHeight(self.frame) / 2  - kImageViewSize/2;//+ 5;
    CGFloat midPos = width / 2 - (0.5) * kBallSize;
   
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kBallSize, kBallSize)];
    ball.backgroundColor = [UIColor colorWithRed:255/255.0 green:153/255.0 blue:0 alpha:1.000];
    ball.layer.cornerRadius = kBallSize / 2.0;
    ball.clipsToBounds = YES;
    
    ball.frame = CGRectMake(midPos, yPos, kBallSize, kBallSize);
    [self addSubview:ball];
        
    self.midBall = ball;
    
    _beginPosition = _midBall.layer.position;//CGPointMake(_midBallPosition.x, _midBallPosition.y);
    _midBallPosition = CGPointMake(_midBallPosition.x, _midBallPosition.y+10);//_midBall.layer.position;
}

- (void)initImageView
{
    if (_bUseSingleImage)
    {
        CGFloat width = CGRectGetWidth(self.frame);
        CGFloat yPos = CGRectGetHeight(self.frame);
        _imageview = [[UIImageView alloc] initWithFrame:CGRectMake((width-_image.size.width)/2 , (yPos-_image.size.height)/2, _image.size.width, _image.size.height)];
        _imageview.image = _image;
        [self addSubview:_imageview];
    }
    else
    {
        if (_bSlime)
        {
            [self createBlackBall];
            [self ballsPositionInit];
        }
        
        
        CGFloat width = CGRectGetWidth(self.frame);
        CGFloat yPos = CGRectGetHeight(self.frame);
        _imageview = [[UIImageView alloc] initWithFrame:CGRectMake((width-kImageViewSize)/2 , (yPos-kImageViewSize)/2, kImageViewSize, kImageViewSize)];
        [self addSubview:_imageview];
        
        _imageview.animationImages = [self imageArray];
        _imageview.animationDuration = 2.0;
        _imageview.animationRepeatCount = 0;
    }
}

- (CAAnimation*)animation
{
    //    UIImage* image = [UIImage imageNamed:@"loading.png"];
    //    UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
    //    [self addSubview:imageView];
    //    imageView.frame = CGRectMake(midPos, yPos_start, image.size.width, image.size.height);
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animation];
    CATransform3D rotation1 = CATransform3DMakeRotation(60 * M_PI/180, 0, 0, -1);
    CATransform3D rotation2 = CATransform3DMakeRotation(120 * M_PI/180, 0, 0, -1);
    CATransform3D rotation3 = CATransform3DMakeRotation(180 * M_PI/180, 0, 0, -1);
    CATransform3D rotation4 = CATransform3DMakeRotation(240 * M_PI/180, 0, 0, -1);
    CATransform3D rotation5 = CATransform3DMakeRotation(300 * M_PI/180, 0, 0, -1);
    CATransform3D rotation6 = CATransform3DMakeRotation(360 * M_PI/180, 0, 0, -1);
    CATransform3D rotation7 = CATransform3DMakeRotation(60 * M_PI/180, 0, 0, -1);
    
    [keyAnim setValues:[NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:rotation1],
                        [NSValue valueWithCATransform3D:rotation2],
                        [NSValue valueWithCATransform3D:rotation3],
                        [NSValue valueWithCATransform3D:rotation4],
                        [NSValue valueWithCATransform3D:rotation5],
                        [NSValue valueWithCATransform3D:rotation6],
                        [NSValue valueWithCATransform3D:rotation7],
                        nil]];
    
    [keyAnim setDuration:1];
    keyAnim.repeatCount = HUGE_VAL;
    keyAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    keyAnim.removedOnCompletion = NO;
    return keyAnim;
}


- (void)createBalls
{
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat xPos = 0.0f;
    CGFloat yPos = CGRectGetHeight(self.frame) / 2 - ballSize / 2 ;//+ 5;
    CGFloat midPos = width / 2 - (0.5) * ballSize;
    for (int i = 0; i < ballCount; i++)
    {
        UIColor *color;
        if (i == 0)
        {
            xPos = midPos - 1.7 *ballSize;
            color = [UIColor colorWithRed:0.996 green:0.988 blue:0.224 alpha:1.000];
        }
        else if (i == 1)
        {
            xPos = midPos;
            color = [UIColor colorWithRed:0.898 green:0.137 blue:0.137 alpha:1.000];
        }
        else if (i == 2)
        {
            xPos = midPos + 1.7 *ballSize;
            color = [UIColor colorWithRed:0.459 green:0.839 blue:0.745 alpha:1.000];
        }
        
        UIView *ball = [self ball:color tag:i];
        ball.frame = CGRectMake(xPos, yPos, ballSize, ballSize);
        [self addSubview:ball];
        
        if (i == 0)
        {
            self.leftBall = ball;
        }
        else if (i == 1)
        {
            self.midBall = ball;
        }
        else if (i == 2)
        {
            self.rightBall = ball;
        }
    }
    
    _leftBallPosition = _leftBall.layer.position;
    _rightBallPosition = _rightBall.layer.position;
    _midBallPosition = _midBall.layer.position;
    
    _beginPosition = CGPointMake(_midBallPosition.x, _midBallPosition.y+kBallOffsetY);
    
    [self initPathAndArray];
    [self ballsPositionInit];
}

- (void) ballsPositionInit
{
    if (_bUseImageView)
    {
        if (_bSlime)
        {
            self.midBall.hidden = NO;
            self.midBall.layer.position = _beginPosition;
            _midBall.layer.transform = CATransform3DMakeScale(0.1,0.1,1.0);
        }
        else
        {
            self.midBall.hidden = YES;
        }
    }
    else
    {
        CATransform3D tr     = CATransform3DMakeScale(ballScale, ballScale, 1.0);
        _leftBall.layer.transform = tr;
        _rightBall.layer.transform = tr;
        _midBall.layer.transform = CATransform3DMakeScale(1.0,1.0,1.0);
        
        if (_bSlime)
        {
            _leftBall.alpha = 0;
            _leftBall.layer.position = _beginPosition;
            _midBall.alpha = 0;
            _midBall.layer.position = _beginPosition;
            _rightBall.alpha = 0;
            _rightBall.layer.position = _beginPosition;
        }

    }
}

- (UIView *)ball:(UIColor*)color tag:(NSInteger)tag
{
    UIView *ball = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ballSize, ballSize)];
    ball.backgroundColor = color;
    ball.layer.cornerRadius = ballSize / 2;
    ball.clipsToBounds = YES;
    return ball;
}

-(void)initPathAndArray{
    
    _path1 = CGPathCreateMutable();
    _path2 = CGPathCreateMutable();
    _path3 = CGPathCreateMutable();
    
    CGPoint p1 = _midBall.layer.position;
    CGPoint p2 = _rightBall.layer.position;
    CGPoint p3 = _leftBall.layer.position;
    
    CGPathMoveToPoint(_path1, NULL, p1.x,p1.y);
    CGPathAddQuadCurveToPoint(_path1, NULL, p1.x, p1.y, p2.x, p2.y);
    CGPathAddQuadCurveToPoint(_path1, NULL, p2.x, p2.y, p3.x, p3.y);
    CGPathAddQuadCurveToPoint(_path1, NULL, p3.x, p3.y, p1.x, p1.y);
    
    CGPathMoveToPoint(_path2, NULL, p2.x,p2.y);
    CGPathAddQuadCurveToPoint(_path2, NULL, p2.x, p2.y, p3.x, p3.y);
    CGPathAddQuadCurveToPoint(_path2, NULL, p3.x, p3.y, p1.x, p1.y);
    CGPathAddQuadCurveToPoint(_path2, NULL, p1.x, p1.y, p2.x, p2.y);
    
    CGPathMoveToPoint(_path3, NULL, p3.x,p3.y);
    CGPathAddQuadCurveToPoint(_path3, NULL, p3.x, p3.y, p1.x, p1.y);
    CGPathAddQuadCurveToPoint(_path3, NULL, p1.x, p1.y, p2.x, p2.y);
    CGPathAddQuadCurveToPoint(_path3, NULL, p2.x, p2.y, p3.x, p3.y);
    
    self.valueTransform1 =[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(ballScale, ballScale, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(ballScale, ballScale, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(ballScale, ballScale, 1.0)],nil];
    
    self.valueTransform2 =[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(ballScale, ballScale, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(ballScale, ballScale, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)],nil];
    
    self.valueTransform3 =[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(ballScale, ballScale, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(ballScale, ballScale, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)],
                       [NSValue valueWithCATransform3D:CATransform3DMakeScale(ballScale, ballScale, 1.0)],nil];
    
    self.valueZposition1 =[NSArray arrayWithObjects:@.7,@1,@.5,@.7, nil];
    self.valueZposition2 =[NSArray arrayWithObjects:@1,@0.5,@.7,@1, nil];
    self.valueZposition3 =[NSArray arrayWithObjects:@.5,@.7,@1,@.7, nil];
    
}

-(CAAnimation*)animationByPath:(CGMutablePathRef)path {
    
    CAKeyframeAnimation* animation;
    animation = [CAKeyframeAnimation animation];
    animation.path = path;
    animation.duration = _duration;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    return animation;
}

-(CAAnimation*)animationByValue:(NSArray*)values {
    
    CAKeyframeAnimation* animation;
    animation = [CAKeyframeAnimation animation];
    animation.values = values;
    animation.duration = _duration;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    return animation;
}

- (void)stopAnimation
{
    if (_bUseImageView)
    {
        if (_bUseSingleImage)
        {
            _imageview.hidden = YES;
            [_imageview.layer removeAnimationForKey:@"transform"];
        }
        else
        {
             [_imageview stopAnimating];
        }
    }
    else
    {
        [self.midBall.layer removeAnimationForKey:@"position"];
        [self.rightBall.layer removeAnimationForKey:@"position"];
        [self.leftBall.layer removeAnimationForKey:@"position"];
        
        [self.midBall.layer removeAnimationForKey:@"transform"];
        [self.rightBall.layer removeAnimationForKey:@"transform"];
        [self.leftBall.layer removeAnimationForKey:@"transform"];
        
        [self.midBall.layer removeAnimationForKey:@"zPosition"];
        [self.rightBall.layer removeAnimationForKey:@"zPosition"];
        [self.leftBall.layer removeAnimationForKey:@"zPosition"];
    }
    
   }

- (void)startAnimation
{
    if (_bUseImageView)
    {
        if (_bUseSingleImage)
        {
            _imageview.hidden = NO;
            [_imageview.layer addAnimation:[self animation] forKey:@"transform"];
        }
        else
        {
            [_imageview startAnimating];
        }
    }
    else
    {
        [self.midBall.layer addAnimation:[self animationByPath:_path1] forKey:@"position"];
        [self.rightBall.layer addAnimation:[self animationByPath:_path2] forKey:@"position"];
        [self.leftBall.layer addAnimation:[self animationByPath:_path3] forKey:@"position"];
        
        [self.leftBall.layer addAnimation:[self animationByValue:_valueTransform1] forKey:@"transform"];
        [self.midBall.layer addAnimation:[self animationByValue:_valueTransform2] forKey:@"transform"];
        [self.rightBall.layer addAnimation:[self animationByValue:_valueTransform3] forKey:@"transform"];
        
        [self.leftBall.layer addAnimation:[self animationByValue:_valueZposition1] forKey:@"zPosition"];
        [self.midBall.layer addAnimation:[self animationByValue:_valueZposition2] forKey:@"zPosition"];
        [self.rightBall.layer addAnimation:[self animationByValue:_valueZposition3] forKey:@"zPosition"];
    }
  
}


- (void)willBeginAction
{
    if (_bUseImageView)
    {
        self.midBall.hidden = YES;
//        self.midBall.layer.transform = CATransform3DMakeScale(1.0,1.0,1.0);
    }
    else
    {
        _leftBall.layer.position = self.leftBallPosition;
        _midBall.layer.position = self.midBallPosition;
        _rightBall.layer.position = self.rightBallPosition;

    }
}

- (void)aPartBalls:(CGFloat)distans
{
    if (_bUseImageView)
    {
        if (distans > kImageViewSize + kBallSize)
        {
            CGFloat precent = (distans - kImageViewSize - kBallSize) / (kTBLoadingDefaultHeight - kImageViewSize - kBallSize);
            NSLog(@"precent = %f",precent);
            self.midBall.layer.transform = CATransform3DMakeScale(precent,precent,1.0);

        }
        
//        self.midBall.layer.position = CGPointMake(self.beginPosition.x + (self.midBallPosition.x - self.beginPosition.x) *precent, self.beginPosition.y + (self.midBallPosition.y - self.beginPosition.y) * precent );
        
//        self.midBall.layer.position = CGPointMake(self.midBallPosition.x + (self.beginPosition.x - self.midBallPosition.x) *precent, self.midBallPosition.y + (self.beginPosition.y - self.midBallPosition.y) * precent );
    }
    else
    {
        CGFloat precent = distans / kTBLoadingDefaultHeight;
        
        _leftBall.alpha = 1.0 * precent;
        _midBall.alpha = 1.0 * precent;
        _rightBall.alpha = 1.0 * precent;
        
        self.leftBall.layer.position = CGPointMake(self.beginPosition.x + (self.leftBallPosition.x - self.beginPosition.x) *precent, self.beginPosition.y + (self.leftBallPosition.y - self.beginPosition.y) * precent );
        
        self.midBall.layer.position = CGPointMake(self.beginPosition.x + (self.midBallPosition.x - self.beginPosition.x) *precent, self.beginPosition.y + (self.midBallPosition.y - self.beginPosition.y) * precent );
        
        self.rightBall.layer.position = CGPointMake(self.beginPosition.x + (self.rightBallPosition.x - self.beginPosition.x) *precent, self.beginPosition.y + (self.rightBallPosition.y - self.beginPosition.y) * precent );
    }
    
}



- (void)startAnimating
{
    if (_animating)
    {
        return;
    }
    self.hidden = NO;
    _animating = YES;
    [self startAnimation];
}

- (void)stopAnimating
{
    if (!_animating)
    {
        return;
    }
    
    if (_bSlime)
    {
        [self ballsPositionInit];
    }
    else
    {
        self.hidden = YES;
        //[self willBeginAction];
    }
    
    _animating = NO;
    [self stopAnimation];
   
}

- (BOOL)isAnimating
{
    return _animating;
}

- (void)reStartAnimating
{
//    return;
//    if (!_animating)
//    {
//        return;
//    }
//    
//    if (_bUseImageView)
//    {
//        if (_bUseSingleImage)
//        {
//            [self reStartAnimation:_imageview.layer withAnimation:[self animation] forKey:@"transform"];
//        }
//        else
//        {
//            if (![_imageview isAnimating])
//            {
//                [_imageview startAnimating];
//            }
//        }
//    }
//    else
//    {
//        [self reStartAnimation:self.midBall.layer withAnimation:[self animationByPath:_path1] forKey:@"position"];
//        [self reStartAnimation:self.rightBall.layer withAnimation:[self animationByPath:_path2] forKey:@"position"];
//        [self reStartAnimation:self.leftBall.layer withAnimation:[self animationByPath:_path3] forKey:@"position"];
//        
//        [self reStartAnimation:self.leftBall.layer withAnimation:[self animationByValue:_valueTransform1] forKey:@"transform"];
//        [self reStartAnimation:self.midBall.layer withAnimation:[self animationByValue:_valueTransform2] forKey:@"transform"];
//        [self reStartAnimation:self.rightBall.layer withAnimation:[self animationByValue:_valueTransform3] forKey:@"transform"];
//        
//        [self reStartAnimation:self.leftBall.layer withAnimation:[self animationByValue:_valueZposition1] forKey:@"zPosition"];
//        [self reStartAnimation:self.midBall.layer withAnimation:[self animationByValue:_valueZposition2] forKey:@"zPosition"];
//        [self reStartAnimation:self.rightBall.layer withAnimation:[self animationByValue:_valueZposition3] forKey:@"zPosition"];
//    }
//
//}
}

@end



@interface NiHubView ()

{
    UILabel *m_textLabel;
}

@property (nonatomic, strong) TBLoadingView *actingView;

@end

@implementation NiHubView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _actingView = [[TBLoadingView alloc] initWithActImageView];
        [_actingView setPlayDuration:0.5 AndDelay:0];
        [_actingView startAnimating];
        [self addSubview:_actingView];
        
        m_textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 30)];
        m_textLabel.backgroundColor = [UIColor clearColor];
        m_textLabel.textAlignment = NSTextAlignmentCenter;
        m_textLabel.textColor = KColor(K00BF99_Color, 1.0);
        m_textLabel.highlighted = YES;
        m_textLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:m_textLabel];
        
        
        self.backgroundColor = [UIColor clearColor];
        
        CGRect frame = self.frame;
        if (_actingView)
        {
            _actingView.frame = CGRectMake((frame.size.width-_actingView.frame.size.width)/2,
                                         (frame.size.height-_actingView.frame.size.height)/2,
                                         _actingView.frame.size.width,
                                         _actingView.frame.size.height);
        }
        if (m_textLabel)
        {
            m_textLabel.frame = CGRectMake(0,_actingView.frame.origin.y + _actingView.frame.size.height + 5,frame.size.width, 20);
        }
        
        [self ajustSubviews];
    }
    return self;
}

- (void)ajustSubviews
{
    CGFloat superW = KScreenWidth;
    CGFloat superH = KScreenHeight;
    CGFloat w = VIEW_HUB_Width;
    CGFloat h = 60;
    CGRect rect;
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    {
        transform = CGAffineTransformMakeRotation(0);
        if([DZDevice screenIsPortrait])
        {
            rect = CGRectMake((superW - w)/2, (superH - h)/2, w, h);
        }
        else
        {
            // 书架横屏时全屏的
            superH = kScreenSize.height;
            superW = kScreenSize.width;
            
            rect = CGRectMake((superH - w)/2, (superW - h)/2, w, h);
        }
        
    }
    self.transform = transform;
    self.frame = rect;
    
}

- (void)setText:(NSString *)text bHidden:(BOOL)bHideden
{
    m_textLabel.text = text;
    m_textLabel.hidden = bHideden;
}

/* //7.0改版没有背景色
 - (void)drawRect:(CGRect)rect
 {
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSaveGState(context);
 
 CGContextSetFillColorWithColor(context, [UIColor colorWithRed:111/255.0 green:91/255.0 blue:76/255.0    alpha:1.0].CGColor);
 
 CGContextBeginPath(context);
 CGContextMoveToPoint(context, rect.size.width/2, 0);
 CGContextAddArcToPoint(context, rect.size.width, 0, rect.size.width, rect.size.height/2, 10);
 CGContextAddArcToPoint(context, rect.size.width, rect.size.height, rect.size.width/2, rect.size.height, 10);
 CGContextAddArcToPoint(context, 0, rect.size.height, 0, rect.size.height/2, 10);
 CGContextAddArcToPoint(context, 0, 0, rect.size.width, 0 ,10);
 CGContextClosePath(context);
 CGContextFillPath(context);
 
 CGContextRestoreGState(context);
 }
 */

@end
