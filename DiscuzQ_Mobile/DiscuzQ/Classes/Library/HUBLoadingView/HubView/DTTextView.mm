//
//  DTTextView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DTTextView.h"
#import "DZSkinHelper.h"
#import "DTTextAttachment.h"

#import "DTImageTextAttachment.h"
#import "DTIframeTextAttachment.h"
#import "DTObjectTextAttachment.h"

#import "DTImage+HTML.h"
#import "NSAttributedString+HTML.h"
#import "DTTiledLayerWithoutFade.h"
#import "DTCoreTextConstants.h"
#import <DTCoreTextLayoutLine.h>
#import <CommonCrypto/CommonDigest.h>

@implementation DTTextView
@synthesize attributedString = _attributedString;
@synthesize attributedTextContextView = _attributedTextContextView;
@synthesize bNeedReloadServerPic;
@synthesize contentStr = _contentStr;
@synthesize showCopy = _showCopy;
@synthesize fontSize = _fontSize;
@synthesize lineHeightMultiplier;
+ (void)saveImageCache:(DTLazyImageView *)img
{
    return;
    NSURL *url = img.url;
    
    NSString *iconUrl = url.absoluteString;
    
    NSString *iconTmp = nil;// [ReaderGUICtrl getUrlRetainIconPathFile:iconUrl];
    if (iconTmp && [[NSFileManager defaultManager] fileExistsAtPath:iconTmp])
    {
        
    }
    UIImage *image = img.image;
    
    BOOL isPng = YES;
    if ([[iconUrl lowercaseString] hasSuffix:@".jpg"])
    {
        isPng = NO;
    }
    
    if (isPng)
    {
        NSData*data = UIImagePNGRepresentation(image);
        [data writeToFile:iconTmp atomically:YES];
    }
    else
    {
        NSData* data = UIImageJPEGRepresentation(image, 1);
        [data writeToFile:iconTmp atomically:YES];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code

        
        
        _attributedTextContextView = [[DTAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _attributedTextContextView.relayoutMask = DTAttributedTextContentViewRelayoutOnWidthChanged;
        _attributedTextContextView.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _attributedTextContextView.delegate = self;
        _attributedTextContextView.backgroundColor = [UIColor clearColor];
        _attributedTextContextView.lineBreakMode = NSLineBreakByTruncatingTail;
        _attributedTextContextView.layoutFrameHeightIsConstrainedByBounds = NO;
        _maxRows = 0;
        [self addSubview:_attributedTextContextView];
        m_StringHasChange = NO;
        self.htmlDelegate = nil;
        
//        m_maxLine = -1;
        self.backgroundColor = [UIColor clearColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contentViewDidLayout:) name:DTAttributedTextContentViewDidFinishLayoutNotification object:_attributedTextContextView];
        
        bNeedReloadServerPic = NO;
        //self.clipsToBounds = YES;

        self.showCopy = NO;
        
    }
    return self;
}

- (void)addSingleClickedRecognizer:(BOOL)add
{
    //return;
    if (!_singleTapGesture && add)
    {
        UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleClickedTextView:)];
        [self addGestureRecognizer:tapRecognizer];
        tapRecognizer.numberOfTapsRequired = 1;
        _singleTapGesture = tapRecognizer;
    }
    else
    {
        if (_singleTapGesture)
        {
            [self removeGestureRecognizer:_singleTapGesture];
            _singleTapGesture = nil;
        }
    }

}

- (void)setShowCopy:(BOOL)showCopy
{
    if (showCopy)
    {
        if (!_longPressGesture)
        {
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(linkLongPressedTextView:)];
            longPress.minimumPressDuration = 1.0;
            [self addGestureRecognizer:longPress];
            _longPressGesture = longPress;
        }
    }
    else
    {
        if (_longPressGesture)
        {
            [self removeGestureRecognizer:_longPressGesture];
            _longPressGesture = nil;
        }
    }
    _showCopy = showCopy;
}

- (void)setBNeedReloadServerPic:(BOOL)bNeed
{
    bNeedReloadServerPic = bNeed;
}

#define MAX_LINE 2000
- (BOOL)isNeedMoreButtonByStyleMaxWidth:(int)width maxRow:(int)row
{
    BOOL bNeed = NO;
    if (row == 0)
    {
        
    }
    else
    {
        if (_attributedTextContextView.layoutFrame)
        {
            //调用.layoutFrames属性使底层生成layoutframe，否则无法计算行数
        }
        int oldRow = _maxRows;
        _maxRows = 0;
        [self loadStringByWidth:width];
        NSInteger allLinesCount = [_attributedTextContextView.layoutFrame.lines count];
        if (allLinesCount > row)
        {
            bNeed = YES;
        }
        _maxRows = oldRow;
    }
    
    return bNeed;
}

- (int)getWidthIfOnlyOneLine
{
    //must afterLoadString
    int width = self.bounds.size.width;
    
    NSArray *lineArray = _attributedTextContextView.layoutFrame.lines;
    if ([lineArray count] == 1)
    {
        DTCoreTextLayoutLine *layoutLine = [lineArray objectAtIndex:0];
        width = layoutLine.frame.size.width;
    }

    return  width;
}

- (CGFloat)getLastLineWidth
{
    //must afterLoadString
    int width = self.bounds.size.width;
    
    NSArray *lineArray = _attributedTextContextView.layoutFrame.lines;
    if ([lineArray count] > 0)
    {
        DTCoreTextLayoutLine *layoutLine = [lineArray lastObject];
        width = layoutLine.frame.size.width;
    }
    
    return  width;
}

- (NSInteger)getLineCount
{
    //must afterLoadString
    NSInteger lineCount = 1;
    
    NSArray *lineArray = _attributedTextContextView.layoutFrame.lines;
    if ([lineArray count] > 0)
    {
        lineCount = [lineArray count];
    }
    
    return  lineCount;
}

- (int)getTextHeight
{
    //must afterLoadString
    int height = 0;
    
    height = _attributedTextContextView.frame.size.height;
    
    return  height;
}

- (void)setNumberOfLine:(int)numberOfLine
{
    if (_maxRows != numberOfLine)
    {
//        if (_attributedTextContextView)
//        {
//            _attributedTextContextView.layouter = nil;
//        }
        _maxRows = numberOfLine;
    }
	
}

- (void)checkMaxLineIsExist
{
//    if (m_maxLine > 0)
    {
        return;
    }
    
    
}
- (void)loadStringByWidth:(CGFloat)width
{
    if(_attributedTextContextView.numberOfLines != _maxRows)
    {
        _attributedTextContextView.numberOfLines = _maxRows;

     
    }
    {
        _attributedTextContextView.layouter = nil;
        [_attributedTextContextView relayoutText];
    }
    
    CGSize neededSize = [_attributedTextContextView suggestedFrameSizeToFitEntireStringConstraintedToWidth:width];
    CGFloat neededContentHeight = neededSize.height;
    
	// after the first call here the content view size is correct
	CGRect frame = CGRectMake(0, 0, width, neededContentHeight);
	
	// only change frame if width has changed to avoid extra layouting
	//if (_attributedTextContextView.frame.size.width != frame.size.width)
	{
		_attributedTextContextView.frame = frame;
	}
    
    CGRect rect = self.frame;
//    if (rect.size.height != neededContentHeight)
    {
//        rect.size.height = neededContentHeight;

        rect.size.width  = _attributedTextContextView.layoutFrame.frame.size.width;

        rect.size.height = _attributedTextContextView.layoutFrame.frame.size.height;


        
        self.frame = rect;
    }
    

    m_StringHasChange = NO;
}

- (void)loadString
{
    [self loadStringByWidth:self.frame.size.width];
}

- (CGFloat)requiredRowHeightInTableView:(CGFloat)contentWidth
{
	CGSize neededSize = [_attributedTextContextView suggestedFrameSizeToFitEntireStringConstraintedToWidth:contentWidth];
	
	// note: non-integer row heights caused trouble < iOS 5.0
	return neededSize.height;
}

#pragma mark Properties
#define TiledLayerMaxLength 800 //超过800字用异步加载文字
- (void)setHTMLString:(NSString *)html
{
    [self setHTMLString:html fontSize:-1 maxImgSize:CGSizeZero isMD5:NO];
}

- (void)setHTMLString:(NSString *)html fontSize:(CGFloat)fontSize maxImgSize:(CGSize)maxSize
{
    [self setHTMLString:html fontSize:fontSize maxImgSize:maxSize isMD5:NO];
}

- (NSUInteger)md5Hash:(NSString*)string
{
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (int)strlen(cStr), result );
    NSString* strTemp =  [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    return [strTemp hash];
}

- (void)setHTMLString:(NSString *)html fontSize:(CGFloat)fontSize maxImgSize:(CGSize)maxSize isMD5:(BOOL)bMD5
{
	// we don't preserve the html but compare it's hash
	NSUInteger newHash = 0;
    // 品阅汇中由于白天黑夜切换时计算出的hash相同因此去计算MD5值
    if (bMD5)
    {
        newHash = [self md5Hash:html];
    }
    else
    {
        newHash = [html hash];
    }
    
	if (newHash == _htmlHash)
	{
		return;
	}
    NSInteger length = [html length];
    
    if (length > TiledLayerMaxLength)
    {
        [DTAttributedTextContentView setLayerClass:[DTTiledLayerWithoutFade class]];
    }
    else
    {
        [DTAttributedTextContentView setLayerClass:[CALayer class]];
    }
    
	_htmlHash = newHash;
	self.contentStr = html;
	NSData *data = [[self replaseChar:html] dataUsingEncoding:NSUTF16StringEncoding];
    {
        //dttextView 增加白天黑夜 的默认色值
        // 如果有设置默认色的话用默认色 没有的话用程序统一的默认色
        NSString* defaultColor = self.defaultTextColor;
        if (!defaultColor)
        {
            defaultColor = [NSString stringWithFormat:@"#%@",[[DZSkinHelper sharedHelper] getGrayDarkTitleColorString]];
        }
        
        NSMutableDictionary *options = nil;
        if ([DZSkinHelper sharedHelper].bNight)
        {
            NSString* linkColor = self.linkColor ? self.linkColor : @"#007aff";
            options = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       defaultColor, DTDefaultTextColor,
//                       [NSValue valueWithCGSize:maxSize], DTMaxImageSize,
                       //@"purple", DTDefaultLinkColor,
                       linkColor, DTDefaultLinkColor,//淡蓝色
                       nil];
        }
        else
        {
            NSString* linkColor = self.linkColor ? self.linkColor : @"#8faf71";
            options = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       defaultColor, DTDefaultTextColor,
//                       [NSValue valueWithCGSize:maxSize], DTMaxImageSize,
                       //@"purple", DTDefaultLinkColor,
                       linkColor, DTDefaultLinkColor,
                       nil];
        }
        
        if(self.fontSize > 0)
        {
            [options setObject:[NSNumber numberWithInteger:self.fontSize] forKey:DTDefaultFontSize];
        }

        if(self.lineHeightMultiplier > 0)
        {
            [options setObject:[NSNumber numberWithFloat:self.lineHeightMultiplier] forKey:DTDefaultLineHeightMultiplier];
        }
        
        if (fontSize > 0)
        {
            //品阅汇控件需要首行缩进
            [options setObject:[NSNumber numberWithFloat:2*fontSize]  forKey:DTDefaultFirstLineHeadIndent];
//            [options setObject:[NSNumber numberWithFloat:0]  forKey:DTDefaultHeadIndent];
        }
        
        NSString *readmePath = nil;
        
        readmePath = [[DZFileManager Shared] dz_TmpPath];
        [options setObject:[NSURL fileURLWithPath:readmePath] forKey:NSBaseURLDocumentOption];
        
        if (!CGSizeEqualToSize(maxSize, CGSizeZero))
        {
//            [options setObject:[NSValue valueWithCGSize:maxSize] forKey:DTMaxImageSize];
        }

        NSAttributedString *string = [[NSAttributedString alloc] initWithHTMLData:data options:options documentAttributes:NULL];
        self.attributedString = string;
    }
	
}

- (NSString*)replaseFontColorString:(NSString*)str
{
    {
        {
            //深灰替换
            NSString* strColor = [NSString stringWithFormat:@"color='#%@'",@"161616"];
            NSString* strColor1 = [NSString stringWithFormat:@"color='#%@'",[[DZSkinHelper sharedHelper] getGrayDarkTitleColorString]];
            
            str = [str stringByReplacingOccurrencesOfString:strColor withString:strColor1];
        }
        
        {
            //浅灰替换
            NSString* strColor = [NSString stringWithFormat:@"color='#%@'",@"787878"];
            
            NSString* strColor1 = [NSString stringWithFormat:@"color='#%@'",[[DZSkinHelper sharedHelper] getGrayLightTitleColorString]];
            
            str = [str stringByReplacingOccurrencesOfString:strColor withString:strColor1];
        }
    }
    
    return str;
}

-(NSString*)replaseChar:(NSString*)source
{
    if (!source || source.length == 0)
    {
        return source;
    }
    NSString* source1 = [self replaseFontColorString:source];
    
    NSMutableString* str = [[NSMutableString alloc] initWithString:source1];
    NSRange range = [str rangeOfString:@">" options:NSBackwardsSearch];
    size_t rightPos = str.length;
    while (range.length > 0)
    {
        NSRange ran1;
        ran1.location = range.location + range.length;
        ran1.length = rightPos - ran1.location;
        [str replaceOccurrencesOfString:@"<" withString:@"&lt;" options:NSCaseInsensitiveSearch range:ran1];
        NSRange ran;
        ran.location = 0;
        ran.length = range.location;
        
        NSRange rangeL = [str rangeOfString:@"<" options:NSBackwardsSearch range:ran];
        if (rangeL.length == 0)
        {
            [str replaceCharactersInRange:range withString:@"&gt;"];
            break;
        }
        
        rightPos = rangeL.location;
        ran.location = 0;
        ran.length = rightPos;
        
        range = [str rangeOfString:@">" options:NSBackwardsSearch range:ran];
    }
    
    
    
    return str;
}

- (void)setAttributedString:(NSAttributedString *)attributedString
{

	if (_attributedString != attributedString)
	{
		_attributedString = attributedString;
        m_StringHasChange = YES;
		// passthrough
		_attributedTextContextView.attributedString = _attributedString;
	}
}

- (void)contentViewDidLayout:(NSNotification *)notification
{
    //test//
    //用于图片下载后的重绘，但是如果重绘的话，控件发现有本地图片时会闪一下（layout），如何区分？
    //根据frame变动？
    //
    if (!bNeedReloadServerPic)
    {
        return;        
    }

	if (![NSThread mainThread])
	{
		[self performSelectorOnMainThread:@selector(contentViewDidLayout:) withObject:notification waitUntilDone:YES];
		return;
	}
	
	NSDictionary *userInfo = [notification userInfo];
	CGRect optimalFrame = [[userInfo objectForKey:@"OptimalFrame"] CGRectValue];
	
    CGRect frame = self.frame;
	
	// ignore possibly delayed layout notification for a different width
	if (optimalFrame.size.width == frame.size.width)
	{
        _attributedTextContextView.frame = optimalFrame;
		CGSize size = [_attributedTextContextView intrinsicContentSize];
        if(!CGSizeEqualToSize(size, self.frame.size))
        {
            CGRect rect = self.frame;
            rect.size.width  = size.width;
            rect.size.height = size.height;
            self.frame = rect;
        }

	}
    else
    {
    
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DTAttributedTextContentViewDidFinishLayoutNotification object:_attributedTextContextView];
    self.htmlDelegate = nil;
    if (_attributedTextContextView)
    {
        _attributedTextContextView.delegate = nil;
        [_attributedTextContextView  removeAllSubviews];
    }
    
}

#pragma mark delegate
- (void)lazyImageView:(DTLazyImageView *)lazyImageView didChangeImageSize:(CGSize)size
{
	NSURL *url = lazyImageView.url;

    CGSize imageSize = size;

    //改为imgsrc width = xx height = xx
    NSArray *lineArray = _attributedTextContextView.layoutFrame.lines;
    if ([lineArray count] > 1)
    {
        //只对大于1行的，否则vip这种只有一行的html会有问题
        if (imageSize.width > self.frame.size.width)
        {
            CGFloat width = self.frame.size.width;
            CGFloat height = (imageSize.height*1.0)*(width*1.0)/(imageSize.width*1.0);
            imageSize = CGSizeMake(width, height);
        }

    }
    
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"contentURL == %@", url];
	
	// update all attachments that matchin this URL (possibly multiple images with same size)
    
	for (DTTextAttachment *oneAttachment in [_attributedTextContextView.layoutFrame textAttachmentsWithPredicate:pred])
	{

		oneAttachment.originalSize = imageSize;

		if (!CGSizeEqualToSize(imageSize, oneAttachment.displaySize))
		{
			oneAttachment.displaySize = imageSize;
		}
	}

    [DTTextView saveImageCache:lazyImageView];
	if (bNeedReloadServerPic)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeFrameAfterImageDownload) object:nil];
        [self performSelector:@selector(changeFrameAfterImageDownload) withObject:nil];
    }
    else
    {
        [self relayoutText];
    }
    
}

- (void)relayoutText
{
	if (![NSThread isMainThread])
	{
		[self performSelectorOnMainThread:@selector(relayoutText) withObject:nil waitUntilDone:YES];
		return;
	}
	
	// need to reset the layouter because otherwise we get the old framesetter or cached layout frames
	_attributedTextContextView.layouter=nil;
	
	// here we're layouting the entire string, might be more efficient to only relayout the paragraphs that contain these attachments
	[_attributedTextContextView relayoutText];
	
	// layout custom subviews for visible area
	[self setNeedsLayout];
    
    if (bNeedReloadServerPic)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeFrameAfterImageDownload) object:nil];
        [self performSelector:@selector(changeFrameAfterImageDownload) withObject:nil afterDelay:0.2f];
    }
    
}

- (void)changeFrameAfterImageDownload
{
    //
    CGRect rect = self.frame;
    //    if (rect.size.height != neededContentHeight)
    {
        //        rect.size.height = neededContentHeight;
        rect.size.width  = _attributedTextContextView.layoutFrame.frame.size.width;
        rect.size.height = _attributedTextContextView.layoutFrame.frame.size.height;
        self.frame = rect;
    }
    
    if (bNeedReloadServerPic)
    {
//        if ([self.htmlDelegate respondsToSelector:@selector(adjustForHtmlLayout:)])
//        {
//            [self.htmlDelegate adjustForHtmlLayout:self];
//        }
    }
}

- (void)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView didDrawLayoutFrame:(DTCoreTextLayoutFrame *)layoutFrame inContext:(CGContextRef)context
{
    //    attributedTextContentView.frame = CGRectMake(0, 0, 247, 50);
}


- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame
{
	//if (attachment.contentType == DTTextAttachmentTypeImage)
    if ([attachment isKindOfClass:[DTImageTextAttachment class]])
	{
        // if the attachment has a hyperlinkURL then this is currently ignored
		DTLazyImageView *imageView = [[DTLazyImageView alloc] initWithFrame:frame];
		imageView.delegate = self;
		
		// sets the image if there is one
        UIImage *dtImg = (UIImage*)[(DTImageTextAttachment *)attachment image];
		imageView.image = dtImg;
        
		imageView.url = attachment.contentURL;
		
        if(1)
        {
            //解决评论列表五角星被拉伸的问题。
            NSString *relativePath = imageView.url.absoluteString;
            
            if (relativePath && [DTTextView isLocalStarIcon:relativePath])
            {
                CGRect imgRect = imageView.frame;
                imgRect.size.width = imgRect.size.height;
                imageView.frame = imgRect;
            }

        }
        // if there is a hyperlink then add a link button on top of this image
		if (attachment.hyperLinkURL)
		{
			// NOTE: this is a hack, you probably want to use your own image view and touch handling
			// also, this treats an image with a hyperlink by itself because we don't have the GUID of the link parts
			imageView.userInteractionEnabled = YES;
			
			DTLinkButton *button = [[DTLinkButton alloc] initWithFrame:imageView.bounds];
			button.URL = attachment.hyperLinkURL;
			button.minimumHitSize = CGSizeMake(25, 25); // adjusts it's bounds so that button is always large enough
			button.GUID = attachment.hyperLinkGUID;
			
			// use normal push action for opening URL
			[button addTarget:self action:@selector(linkPushed:) forControlEvents:UIControlEventTouchUpInside];
			
			// demonstrate combination with long press
//			UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(linkLongPressed:)];
//			[button addGestureRecognizer:longPress];
			
			[imageView addSubview:button];
		}
		return imageView;
	}
    
	return nil;
}

+ (BOOL)isLocalStarIcon:(NSString*)urlString
{
    BOOL isLocalStar = NO;
    //五角星，不要拉伸
    if (urlString && [urlString rangeOfString:@"store/webIcon/star"].length > 0)
    {
        isLocalStar = YES;
    }
    return isLocalStar;
}

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForLink:(NSURL *)url identifier:(NSString *)identifier frame:(CGRect)frame
{
	DTLinkButton *button = [[DTLinkButton alloc] initWithFrame:frame];
	button.URL = url;
	button.minimumHitSize = CGSizeMake(25, 25); // adjusts it's bounds so that button is always large enough
	button.GUID = identifier;
	
	// use normal push action for opening URL
	[button addTarget:self action:@selector(linkPushed:) forControlEvents:UIControlEventTouchUpInside];
	
	return button;
}

//- (void)linkLongPressed:(DTLinkButton *)button
//{
//    //长按目前不响应特殊事件，按单击处理
//    [self linkPushed:button];
//}

- (void)linkPushed:(DTLinkButton *)button
{
    NSString *url = [button.URL absoluteString];
    NSString *title = @"";
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:url,@"url",title,@"title", nil];
    //KSLog(@"linkPushurl = %@",url);
    if (url)
    {
//        if ([self.htmlDelegate respondsToSelector:@selector(contentLinkPush:)])
//        {
//            [self.htmlDelegate performSelector:@selector(contentLinkPush:) withObject:dict];
//        }
    }
}

- (void)linkLongPressedTextView:(UILongPressGestureRecognizer *)gesture
{
    //KSLog(@"linkLongPressedTextView");
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        if(self.showCopy && [self.contentStr length])
        {
            {
                CGRect rc = self.frame;
                CGPoint pt = [gesture locationInView:self];
                [self becomeFirstResponder];
                rc.origin.x += rc.size.width/2;
                rc.origin.y += pt.y;
                rc.size.width = 0;
                rc.size.height = 0;
                {
                    
                    UIMenuItem* miCustom1 = [[UIMenuItem alloc] initWithTitle: @"copy" action:@selector( onCustomCopy: )];
                    UIMenuController* mc = [UIMenuController sharedMenuController];
                    mc.menuItems = [NSArray arrayWithObjects: miCustom1, nil];
                }
                
                UIMenuController* mc = [UIMenuController sharedMenuController];
                mc.arrowDirection = UIMenuControllerArrowDown;
                [mc setTargetRect: rc inView:self.superview];
                [mc setMenuVisible: YES animated: YES];
            }
        }
    }

}

- (void)singleClickedTextView:(UITapGestureRecognizer *)gesture
{
    UIView* superView = self.superview;
    if (superView && [superView respondsToSelector:@selector(singleClickedTextView:)])
    {
        [superView performSelector:@selector(singleClickedTextView:) withObject:self];
    }
}

- (BOOL)canBecomeFirstResponder
{
	return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
	if ( action == @selector( onCustomCopy: ) )
    {
		return YES;  // logic here for context menu show/hide
    }

    return [super canPerformAction: action withSender: sender];
}


-(void)onCustomCopy:(UIMenuController*) sender
{
//    NSString *result = [ContentExtractor getContent:self.contentStr addImage:NO];
//
//    UIPasteboard *gpBoard = [UIPasteboard generalPasteboard];
//    if (result)
//    {
//        if(result)
//        {
//            [gpBoard  setString:result];
//        }
//    }
}

@end
