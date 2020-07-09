//
//  TipHubView.mm
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "TipHubView.h"
#import "TipHubViewManager.h"

@implementation TipHubView

@synthesize bInKeyWindow = m_bInKeyWindow;
@synthesize endAnimationType = m_endAnimationType;
@synthesize duration = m_duration;


- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame])
	{
		m_textLabel = [[UILabel alloc] initWithFrame:CGRectMake(TEXT_HUB_MARGIN_W, TEXT_HUB_MARGIN_H, TEXT_HUB_MAX_W - TEXT_HUB_MARGIN_W*2, TEXT_HUB_MIN_H - TEXT_HUB_MARGIN_H*2)];
		m_textLabel.backgroundColor = [UIColor clearColor];
		m_textLabel.textAlignment = NSTextAlignmentCenter;
		m_textLabel.textColor = KColor(KF9F9F9_Color, 1);
		m_textLabel.highlighted = YES;
		m_textLabel.font = [UIFont systemFontOfSize:12];
		[self addSubview:m_textLabel];
		
		self.backgroundColor = [UIColor clearColor];
		m_bInKeyWindow = YES;
		m_inView = [UIApplication sharedApplication].keyWindow;

		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(orientationAction:)
													 name:UIDeviceOrientationDidChangeNotification
												   object:nil];
        
        // 添加了StatusBarOrientation改变的通知
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(orientationAction:)
                                                     name:UIApplicationDidChangeStatusBarOrientationNotification
                                                   object:nil];
	}
	return self;
}

- (void)dealloc 
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CGPoint)getCenterPointForMidOtherBG:(CGRect)rcMain
{
    CGPoint center;
    UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if(![DZDevice screenIsPortraitBystatusBarOrientation])
    {
        CGFloat dDiv = 4.0;
        
        {
            if(statusBarOrientation == UIInterfaceOrientationLandscapeRight)
            {
                dDiv = dDiv / (dDiv - 1);
            }
            center.x = (rcMain.size.width)/dDiv;
            center.y = (rcMain.size.height)/2;
        }
    }
    else
    {
        CGFloat dOffsetY = 0;
        
        center.x = (rcMain.size.width)/2 ;
        center.y = (rcMain.size.height)/2 - dOffsetY;
    }
    return center;
}

-(void)setFrame:(CGRect)rect
{
	[super setFrame:rect];
	
	if (m_textLabel)
	{
		CGRect re = m_textLabel.frame;
		int xmargin = (self.bounds.size.width - re.size.width)/2;
		int ymargin = (self.bounds.size.height - re.size.height)/2;
		
		re.origin.x = xmargin;
		re.origin.y = ymargin;
		re.size = re.size;
		m_textLabel.frame = re;
		
	}
}
- (void)adjustViews
{
	UIFont* font = m_textLabel.font;
	CGSize size = [m_textLabel.text customSizeWithFont:font];
	
	CGFloat min_H = TEXT_HUB_MIN_H;//100
	CGFloat max_W = TEXT_HUB_MAX_W;//200
	CGFloat min_W = TEXT_HUB_MIN_W;//100
    
    if(m_type == TipHubView_Show_Type_Bubble)
    {
        max_W = 180;
    }
	else if (m_type != TipHubView_Show_Type_Mid)
	{
		min_H = 20;
		max_W = TEXT_HUB_MAX_W;//260;
		min_W = TEXT_HUB_MAX_W;//216;
	}
	
    //7.0修改 弹窗宽度不固定 最大为屏幕宽度的2/3;
//	CGFloat w = max_W - TEXT_HUB_MARGIN_W*2;
    CGFloat w = KScreenWidth*2/3;
	CGFloat h = 20;
	
	if (size.width > w)
	{
        CGSize constraint = CGSizeMake(w, 2000.0f);
        size = [m_textLabel.text customSizeWithFont:m_textLabel.font constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
        h = size.height;
        m_textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        m_textLabel.numberOfLines = 0;
	}
	else
	{
		w = size.width;
        
        //7.0 不限制最小弹窗宽度
//		if (w<min_W)
//		{
//			w = min_W;
//		}
		h = size.height;
	}
	
	if (h < min_H)
	{
		h = min_H;
	}
	
	CGRect rc = CGRectMake(TEXT_HUB_MARGIN_W, TEXT_HUB_MARGIN_H, w, h);
	m_textLabel.frame = rc;
	
	rc = self.frame;
	rc.size.height = h + TEXT_HUB_MARGIN_H*2;
	rc.size.width = w + TEXT_HUB_MARGIN_W*2;
    
    if (self.bInKeyWindow)
    {
        CGRect rcTop = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        CGRect rcMain = rcTop;
        CGRect bounds = CGRectMake(0, 0, rc.size.width, rc.size.height);
        CGPoint center = CGPointMake(rc.size.width/2, rc.size.height/2);
        CGAffineTransform trans = CGAffineTransformMakeRotation(0);
       
        {
            UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
            switch (statusBarOrientation)
            {
                case UIInterfaceOrientationPortrait:
                {
                    bounds = CGRectMake(0, 0, rc.size.width, rc.size.height);
                    rcMain = rcTop;
                    trans = CGAffineTransformMakeRotation(0);
                    switch (m_type)
                    {
                        case TipHubView_Show_Type_Bottom:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height) - rc.size.height/2 - rcMain.size.height*2/12;
                        }
                            break;
                        case TipHubView_Show_Type_Mid:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                        case TipHubView_Show_Type_Mid_Other_BG:
                        {
                            center = [self getCenterPointForMidOtherBG:rcMain];
                        }
                            break;
                        default:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                    }
                    
                }
                    break;
                case UIInterfaceOrientationLandscapeLeft:
                {
                    bounds = CGRectMake(0, 0, rc.size.width, rc.size.height);
                    rcMain = rcTop;
                    trans = CGAffineTransformMakeRotation(M_PI_2*3);
                    switch (m_type)
                    {
                        case TipHubView_Show_Type_Bottom:
                        {
                            center.x = (rcMain.size.width) - rc.size.height/2 - rcMain.size.width*2/12;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                        case TipHubView_Show_Type_Mid:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                        case TipHubView_Show_Type_Mid_Other_BG:
                        {
                            center = [self getCenterPointForMidOtherBG:rcMain];
                        }
                            break;
                        default:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                    }
                }
                    break;
                case UIInterfaceOrientationPortraitUpsideDown:
                {
                    bounds = CGRectMake(0, 0, rc.size.width, rc.size.height);
                    rcMain = rcTop;
                    trans = CGAffineTransformMakeRotation(M_PI);
                    switch (m_type)
                    {
                        case TipHubView_Show_Type_Bottom:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = rc.size.height/2 + rcMain.size.height*2/12;
                        }
                            break;
                        case TipHubView_Show_Type_Mid:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                        case TipHubView_Show_Type_Mid_Other_BG:
                        {
                            center = [self getCenterPointForMidOtherBG:rcMain];
                        }
                            break;
                        default:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                    }
                }
                    break;
                case UIInterfaceOrientationLandscapeRight:
                {
                    bounds = CGRectMake(0, 0, rc.size.width, rc.size.height);
                    rcMain = rcTop;
                    trans = CGAffineTransformMakeRotation(M_PI_2);
                    switch (m_type)
                    {
                        case TipHubView_Show_Type_Bottom:
                        {
                            center.x = rc.size.height/2 + rcMain.size.width*2/12;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                        case TipHubView_Show_Type_Mid:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                        case TipHubView_Show_Type_Mid_Other_BG:
                        {
                            center = [self getCenterPointForMidOtherBG:rcMain];
                        }
                            break;
                        default:
                        {
                            center.x = (rcMain.size.width)/2;
                            center.y = (rcMain.size.height)/2;
                        }
                            break;
                    }
                }
                    break;
                    
                default:
                    break;
            }
        }
        self.bounds = bounds;
        self.center = center;
        self.transform = trans;
    }
    else
    {
        CGRect rcMain = m_initRect;//m_inView.frame;

        {
            switch (m_type)
            {
                case TipHubView_Show_Type_Bottom:
                {
                    rc.origin.x = rcMain.origin.x + rcMain.size.width/2 - rc.size.width/2;
                    rc.origin.y = rcMain.origin.y + rcMain.size.height- rc.size.height - rcMain.size.height*2/12;
                }
                    break;
                case TipHubView_Show_Type_Mid:
                {
                    rc.origin.x = rcMain.origin.x + rcMain.size.width/2 - rc.size.width/2;
                    rc.origin.y = rcMain.origin.y + rcMain.size.height/2 - rc.size.height/2;
                }
                    break;
                default:
                {
                    rc.origin.x = rcMain.origin.x + rcMain.size.width/2 - rc.size.width/2;
                    rc.origin.y = rcMain.origin.y + rcMain.size.height/2 - rc.size.height/2;
                }
                    break;
            }
            
        }
        
        self.frame = rc;

    }

}


- (void)orientationView
{
    //m_initRect = m_inView.frame; //暂时注销掉，不然阅读界面轻微晃动位置会错误
	[self adjustViews];
}

- (void)orientationAction:(NSNotification *)ns
{
    [self orientationView];
}

- (void)setShowText:(NSString *)text
{
	if (text)
	{
		m_textLabel.text = text;
	}
}

- (void)setText:(NSString *)text
{
	if (text)
	{
		m_textLabel.text = text;
		[self adjustViews];
	}

}

- (void)setInView:(UIView*)inView
{
	m_inView = inView;
}

- (void)setInitRect:(CGRect)rect
{
    m_initRect = rect;
}

- (void)setShowType:(int)type
{
	if (type<=TipHubView_Show_Type_Begin || type>=TipHubView_Show_Type_End) 
	{
		type = TipHubView_Show_Type_Mid;
	}
	m_type = type;
}

- (void)closeTipHubView
{
    if ([TipHubViewManager staticTipHubView] == self)
    {
        [TipHubViewManager setStaticTipHubView:nil];
    }
	if (self)
	{
		[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(closeTipHubView) object:nil];
        [self removeFromSuperview];

		if ([[DZMobileCtrl sharedCtrl].tipHubViewArr count])
		{
			[[DZMobileCtrl sharedCtrl].tipHubViewArr removeObjectAtIndex:0];
		}
		
		if ([[DZMobileCtrl sharedCtrl].tipHubViewArr count] == 0)
		{
			 [[DZMobileCtrl sharedCtrl] showHub:YES];
		}
		else
		{
			[TipHubViewManager showNextHubView];
		}

        
       
	}
	//if ([[UIApplication sharedApplication] isIgnoringInteractionEvents])
	//	[[UIApplication sharedApplication] endIgnoringInteractionEvents];
}

-(void)myanimationWillStart:(NSString *)animationID context:(void *)context
{
    TipHubView* animationView = self;
	if ([animationID isEqualToString:@"tiphubviewframeend"])
	{
		if (!animationView)
			return;
		
		[animationView setShowText:@""];
	}
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
	TipHubView* animationView = self;
	if ([animationID isEqualToString:@"tiphubviewframestart"] || [animationID isEqualToString:@"tiphubviewalphastart"])
	{
		if (animationView.endAnimationType == TipHubViewAnimationType_frame)
		{
			CGRect rect = animationView.frame;
			CGRect tarrect = rect;
			tarrect.origin.x -= rect.size.width/2;
			tarrect.origin.y -= rect.size.height/2;
			tarrect.size.width = tarrect.size.width * 2;
			tarrect.size.height = tarrect.size.height * 2;
			
			[UIView beginAnimations:@"tiphubviewframeend" context:nil];
			[UIView setAnimationDelay:animationView.duration];
			[UIView setAnimationDuration:0.1f];
			[UIView setAnimationDelegate:self];
			[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
			[UIView setAnimationWillStartSelector:@selector(myanimationWillStart:context:)];
			
			animationView.frame = tarrect;
			animationView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0f];
			animationView.alpha = 0.0f;
			
			[UIView commitAnimations];
		}
		else 
		{
			
			[UIView beginAnimations:@"tiphubviewalphaend" context:nil];
			[UIView setAnimationDelay:animationView.duration];
			[UIView setAnimationDuration:1.0f];
			[UIView setAnimationDelegate:animationView];
			[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
			
			//animationView.frame = rect;
			animationView.backgroundColor = [UIColor clearColor];
			animationView.alpha = 0.1f;
			//animationView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];			
			[UIView commitAnimations];
		}

		
	}
	else if ([animationID isEqualToString:@"tiphubviewframeend"] || [animationID isEqualToString:@"tiphubviewalphaend"])
	{
		[animationView performSelector:@selector(closeTipHubView) withObject:nil afterDelay:0.1f];
	}
}

@end

@implementation BottomTipHubView
- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame])
	{
        m_bottom_tip_bg = [[UIImageView alloc] init];
        [self addSubview:m_bottom_tip_bg];
        
        m_bottom_tip_bg.backgroundColor = [TipHubViewManager getTipBgColor];
        
        
        [self sendSubviewToBack:m_bottom_tip_bg];
    }
    return self;
}

- (void)adjustViews
{
    [super adjustViews];
    m_bottom_tip_bg.frame = self.bounds;
    //self.backgroundColor = [UIColor clearColor];
}


@end

@interface BubbleTipHubView ()
{
	CGSize					m_bubbleSize;
	CGFloat					m_cornerRadius;
	PointDirection			m_pointDirection;
	CGFloat					m_pointerSize;
	CGPoint					m_targetPoint;
    CGFloat                 m_sidePadding;
    CGFloat                 m_topMargin;
    UIButton               *m_unvisableBtn;
}
@end

@implementation BubbleTipHubView
@synthesize preferredPointDirection;
- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame])
	{
        // Initialization code
		m_topMargin = 2.0;
		m_pointerSize = 12.0;
		m_sidePadding = 2.0;
        m_cornerRadius = 0.0;//10.0;
        m_pointDirection = PointDirectionAny;
        self.preferredPointDirection = PointDirectionAny;
        m_unvisableBtn = nil;
    }
    return self;
}

- (CGRect)bubbleFrame
{
	CGRect bubbleFrame;
	if (m_pointDirection == PointDirectionUp)
    {
		bubbleFrame = CGRectMake(m_sidePadding, m_targetPoint.y+m_pointerSize, m_bubbleSize.width, m_bubbleSize.height);
	}
	else
    {
		bubbleFrame = CGRectMake(m_sidePadding, m_targetPoint.y-m_pointerSize-m_bubbleSize.height, m_bubbleSize.width, m_bubbleSize.height);
	}
	return bubbleFrame;
}

- (CGRect)contentFrame
{
	CGRect bubbleFrame = [self bubbleFrame];
	CGRect contentFrame = CGRectMake(bubbleFrame.origin.x + m_cornerRadius,
									 bubbleFrame.origin.y + m_cornerRadius,
									 bubbleFrame.size.width - m_cornerRadius*2,
									 bubbleFrame.size.height - m_cornerRadius*2);
	return contentFrame;
}

- (void)setInView:(UIView*)inView
{
	m_inView = inView;
    
    if(!m_unvisableBtn)
    {
        m_unvisableBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [m_unvisableBtn addTarget:self action:@selector(closeTipHubView) forControlEvents:UIControlEventTouchUpInside];
        [m_unvisableBtn setTitle:@"" forState:UIControlStateNormal];
        m_unvisableBtn.frame = CGRectZero;
    }
    
    if(m_unvisableBtn.superview)
    {
        [m_unvisableBtn removeFromSuperview];
    }

    if (m_inView)
    {
        m_unvisableBtn.frame = m_inView.frame;
        [m_inView addSubview:m_unvisableBtn];
    }
}

- (void)adjustViews
{
    [super adjustViews];
    
    CGSize textSize = m_textLabel.frame.size;
    m_bubbleSize = CGSizeMake(textSize.width + /*m_cornerRadius*/10*2, textSize.height + /*m_cornerRadius*/10*2);
    
    CGFloat pointerY = 0;
    CGRect containerRC = m_inView.frame;
    if (m_initRect.origin.y + m_initRect.size.height < containerRC.size.height)
    {
        pointerY = 0.0;
        m_pointDirection = PointDirectionUp;
    }
    else if(m_initRect.origin.y > containerRC.origin.y + containerRC.size.height)
    {
        pointerY = containerRC.size.height;
        m_pointDirection = PointDirectionDown;
    }
    else
    {
        m_pointDirection = PointDirectionAny;
        CGFloat sizeBelow = containerRC.size.height - m_initRect.origin.y;
        if (m_pointDirection == PointDirectionAny)
        {
            if (sizeBelow > m_initRect.origin.y)
            {
                pointerY = m_initRect.origin.y + m_initRect.size.height;
                m_pointDirection = PointDirectionUp;
            }
            else
            {
                pointerY = m_initRect.origin.y;
                m_pointDirection = PointDirectionDown;
            }
        }
        else
        {
            if (m_pointDirection == PointDirectionDown)
            {
                pointerY = m_initRect.origin.y;
            }
            else {
                pointerY = m_initRect.origin.y + m_initRect.size.height;
            }
        }
    }

    
    CGFloat W = m_inView.frame.size.width;
	
	CGPoint p = CGPointMake(CGRectGetMidX(m_initRect), CGRectGetMidY(m_initRect));
	CGFloat x_p = p.x;
	CGFloat x_b = x_p - roundf(m_bubbleSize.width/2);
	if (x_b < m_sidePadding)
    {
		x_b = m_sidePadding;
	}
	if (x_b + m_bubbleSize.width + m_sidePadding > W)
    {
		x_b = W - m_bubbleSize.width - m_sidePadding;
	}
	if (x_p - m_pointerSize < x_b + m_cornerRadius)
    {
		x_p = x_b + m_cornerRadius + m_pointerSize;
	}
	if (x_p + m_pointerSize > x_b + m_bubbleSize.width - m_cornerRadius)
    {
		x_p = x_b + m_bubbleSize.width - m_cornerRadius - m_pointerSize;
	}
    
    CGFloat fullHeight = m_bubbleSize.height + m_pointerSize + 10.0;
	CGFloat y_b;
	if (m_pointDirection == PointDirectionUp)
    {
		y_b = m_topMargin + pointerY;
		m_targetPoint = CGPointMake(x_p-x_b, 0);
	}
	else
    {
		y_b = pointerY - fullHeight;
		m_targetPoint = CGPointMake(x_p-x_b, fullHeight-2.0);
	}
	
	CGRect finalFrame = CGRectMake(x_b-m_sidePadding,
								   y_b,
								   m_bubbleSize.width+m_sidePadding*2,
								   fullHeight);
    finalFrame = CGRectIntegral(finalFrame);

    self.frame = finalFrame;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGRect bubbleRect = [self bubbleFrame];
    CGContextRef c = UIGraphicsGetCurrentContext();
    UIColor* color = [TipHubViewManager getTipBgColor];
	CGContextSetFillColorWithColor(c, color.CGColor);
	CGMutablePathRef bubblePath = CGPathCreateMutable();
	
	if (m_pointDirection == PointDirectionUp)
    {
		CGPathMoveToPoint(bubblePath, NULL, m_targetPoint.x+m_sidePadding, m_targetPoint.y);
		CGPathAddLineToPoint(bubblePath, NULL, m_targetPoint.x+m_sidePadding+m_pointerSize, m_targetPoint.y+m_pointerSize);
		
		CGPathAddArcToPoint(bubblePath, NULL,
							bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y,
							bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y+m_cornerRadius,
							m_cornerRadius);
		CGPathAddArcToPoint(bubblePath, NULL,
							bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y+bubbleRect.size.height,
							bubbleRect.origin.x+bubbleRect.size.width-m_cornerRadius, bubbleRect.origin.y+bubbleRect.size.height,
							m_cornerRadius);
		CGPathAddArcToPoint(bubblePath, NULL,
							bubbleRect.origin.x, bubbleRect.origin.y+bubbleRect.size.height,
							bubbleRect.origin.x, bubbleRect.origin.y+bubbleRect.size.height-m_cornerRadius,
							m_cornerRadius);
		CGPathAddArcToPoint(bubblePath, NULL,
							bubbleRect.origin.x, bubbleRect.origin.y,
							bubbleRect.origin.x+m_cornerRadius, bubbleRect.origin.y,
							m_cornerRadius);
		CGPathAddLineToPoint(bubblePath, NULL, m_targetPoint.x+m_sidePadding-m_pointerSize, m_targetPoint.y+m_pointerSize);
	}
	else
    {
		CGPathMoveToPoint(bubblePath, NULL, m_targetPoint.x+m_sidePadding, m_targetPoint.y);
		CGPathAddLineToPoint(bubblePath, NULL, m_targetPoint.x+m_sidePadding-m_pointerSize, m_targetPoint.y-m_pointerSize);
		
		CGPathAddArcToPoint(bubblePath, NULL,
							bubbleRect.origin.x, bubbleRect.origin.y+bubbleRect.size.height,
							bubbleRect.origin.x, bubbleRect.origin.y+bubbleRect.size.height-m_cornerRadius,
							m_cornerRadius);
		CGPathAddArcToPoint(bubblePath, NULL,
							bubbleRect.origin.x, bubbleRect.origin.y,
							bubbleRect.origin.x+m_cornerRadius, bubbleRect.origin.y,
							m_cornerRadius);
		CGPathAddArcToPoint(bubblePath, NULL,
							bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y,
							bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y+m_cornerRadius,
							m_cornerRadius);
		CGPathAddArcToPoint(bubblePath, NULL,
							bubbleRect.origin.x+bubbleRect.size.width, bubbleRect.origin.y+bubbleRect.size.height,
							bubbleRect.origin.x+bubbleRect.size.width-m_cornerRadius, bubbleRect.origin.y+bubbleRect.size.height,
							m_cornerRadius);
		CGPathAddLineToPoint(bubblePath, NULL, m_targetPoint.x+m_sidePadding+m_pointerSize, m_targetPoint.y-m_pointerSize);
	}
    
	CGPathCloseSubpath(bubblePath);
    
    CGContextSaveGState(c);
	CGContextAddPath(c, bubblePath);
    CGContextFillPath(c);
    CGContextRestoreGState(c);
	
	CGPathRelease(bubblePath);
}
@end

@implementation MidBgTipHubView
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        m_textLabel.textColor = KWhite_Color;
        m_tip_bg = [[UIImageView alloc] init];
        [self addSubview:m_tip_bg];
        m_tip_bg.backgroundColor = KDebug_Color;
        [self sendSubviewToBack:m_tip_bg];
    }
    return self;
}

- (void)adjustViews
{
    [super adjustViews];
    m_tip_bg.frame = self.bounds;
    //self.backgroundColor = [UIColor clearColor];
}
@end

