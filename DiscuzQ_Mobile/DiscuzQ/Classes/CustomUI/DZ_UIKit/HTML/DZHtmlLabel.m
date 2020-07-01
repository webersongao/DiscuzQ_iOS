//
//  DZHtmlLabel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZHtmlLabel.h"
#import <DTFoundation-umbrella.h>

@interface DZHtmlLabel ()<DTAttributedTextContentViewDelegate,DTLazyImageViewDelegate>

@property(nonatomic,strong) DZHtmlItem *htmlItem;
@property(nonatomic,assign) CGRect viewMaxRect;

@end

@implementation DZHtmlLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.numberOfLines = 0;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(htmlAttachmentDownLoadEnded:) name:DTLazyImageViewDidFinishDownloadNotification object:nil];
        self.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return self;
}


-(void)updateContent_Html:(DZHtmlItem *)htmlItem{
    
    self.htmlItem = htmlItem;
    [self updateHtml:htmlItem.attributedString rect:htmlItem.maxRect];
}

-(void)updateHtml:(NSAttributedString *)attributeString rect:(CGRect)viewRect{
    
    self.attributedString = attributeString;
    self.viewMaxRect = CGRectMake(dz_CellMargin, viewRect.origin.y, dz_CellMaxContentWidth, CGFLOAT_HEIGHT_UNKNOWN);
}

-(void)htmlAttachmentDownLoadEnded:(NSNotification *)notification{
    
    NSDictionary *userInfo = notification.userInfo;
    DTLazyImageView *lazyImage = notification.object;
    
//    NSErrorFailingURLStringKey=https://discuz.chat/GaoiOS/images/logo.png, NSErrorFailingURLKey=https://discuz.chat/GaoiOS/images/logo.png,
    
    if (lazyImage && [lazyImage isKindOfClass:[DTLazyImageView class]]) {
        
        NSString *attachUrl = nil;
        if (userInfo) {
            NSError *error = [userInfo objectForKey:@"Error"];
            if (error && [error isKindOfClass:[NSError class]]) {
                NSDictionary *errorUserinfo = error.userInfo;
               NSString *attachUrl_old = [errorUserinfo stringForKey:NSErrorFailingURLStringKey];
                attachUrl = [errorUserinfo stringForKey:NSURLErrorFailingURLStringErrorKey];
                KSLog(@"WBS 错误URL 为 %@ ----",attachUrl);
            }else{
                KSLog(@"WBS 未知错误等等等等----");
            }
            // 失败了
        }else{
            // 成功啦
            attachUrl = lazyImage.url.absoluteString;
        }
//        KSLog(@"WBS 图片的URL 地址是 %@",attachUrl);
    }
    
}

#pragma mark - Delegate：DTAttributedTextContentViewDelegate
//图片占位
- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame{
    
    if([attachment isKindOfClass:[DTImageTextAttachment class]]){
        NSString *imageURL = [NSString stringWithFormat:@"%@", attachment.contentURL];
        DTLazyImageView *imageView = [[DTLazyImageView alloc] initWithFrame:frame];
        imageView.delegate = self;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *localImage = [(DTImageTextAttachment *)attachment image];
        imageView.image = localImage;
        imageView.url = attachment.contentURL;
        if ([imageURL containsString:@"gif"]) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSData *gifData = [NSData dataWithContentsOfURL:attachment.contentURL];
                dispatch_async(dispatch_get_main_queue(), ^{
                    imageView.image = DTAnimatedGIFFromData(gifData);
                });
            });
        }
        return imageView;
    }
    return nil;
}

//根据a标签，自定义响应按钮，处理点击事件
- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForLink:(NSURL *)url identifier:(NSString *)identifier frame:(CGRect)frame{
    DZHtmlButton *htmlButton = [DZHtmlButton htmlButtonURL:url.absoluteString withIdentifier:identifier frame:frame];
    return htmlButton;
}


#pragma mark  Delegate：DTLazyImageViewDelegate
//懒加载获取图片大小
- (void)lazyImageView:(DTLazyImageView *)lazyImageView didChangeImageSize:(CGSize)size {
    NSURL *url = lazyImageView.url;
    CGSize imageSize = size;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"contentURL == %@", url];
    BOOL didUpdate = NO;
    // update all attachments that match this URL (possibly multiple images with same size)
    NSArray *localTextAttachArray = [self.layoutFrame textAttachmentsWithPredicate:pred];
    for (DTTextAttachment *oneAttachment in localTextAttachArray)
    {
        // update attachments that have no original size, that also sets the display size
        if (CGSizeEqualToSize(oneAttachment.originalSize, CGSizeZero))
        {
            oneAttachment.originalSize = imageSize;
            [self gao_configNoSizeImageView:url.absoluteString size:imageSize];
            didUpdate = YES;
        }else{
//            KSLog(@"WBS 图片完美展示");
        }
    }
    
    //    if (didUpdate)
    //    {
    //        self.attributedTextContentView.layouter = nil;
    //        [self relayoutText];
    //    }
}

//字符串中一些图片没有宽高，懒加载图片之后，在此方法中得到图片宽高
//这个把宽高替换原来的html,然后重新设置富文本
- (void)gao_configNoSizeImageView:(NSString *)url size:(CGSize)size
{
    CGFloat imgSizeScale = size.height/size.width;
    CGFloat widthPx = self.viewMaxRect.size.width;
    CGFloat heightPx = widthPx * imgSizeScale;
    
    NSString *imageInfo = [NSString stringWithFormat:@"<img src=\"%@\"",url];
    NSString *sizeString = [NSString stringWithFormat:@" style=\"width:%.fpx; height:%.fpx;\"",widthPx,heightPx];
    NSString *newImageInfo = [NSString stringWithFormat:@"<img src=\"%@\"%@",url,sizeString];
    
    if ([self.htmlItem.screen_html containsString:imageInfo]) {
        NSString *newHtml = [self.htmlItem.screen_html stringByReplacingOccurrencesOfString:imageInfo withString:newImageInfo];
        
        // reload newHtml
        self.htmlItem.screen_html = newHtml;
        
        [self.htmlItem.htmlDelagate refreshThreadCurrentHtmlView:newHtml];
        
    }

}


//字符串中一些图片没有宽高，懒加载图片之后，在此方法中得到图片宽高
//这个把宽高替换原来的html,然后重新设置富文本
- (void)configNoSizeImageView:(NSString *)url size:(CGSize)size
{
    CGFloat imgSizeScale = size.height/size.width;
    CGFloat widthPx = self.viewMaxRect.size.width;
    CGFloat heightPx = widthPx * imgSizeScale;
    
    NSString *imageInfo = [NSString stringWithFormat:@"_src=\"%@\"",url];
    NSString *sizeString = [NSString stringWithFormat:@" style=\"width:%.fpx; height:%.fpx;\"",widthPx,heightPx];
    NSString *newImageInfo = [NSString stringWithFormat:@"_src=\"%@\"%@",url,sizeString];
    
    if ([self.htmlItem.screen_html containsString:imageInfo]) {
        NSString *newHtml = [self.htmlItem.screen_html stringByReplacingOccurrencesOfString:imageInfo withString:newImageInfo];
        
        // reload newHtml
        self.htmlItem.screen_html = newHtml;
        // WBS 暂时 禁止重载图片
//        CGSize textSize = [DZHtmlUtils getAttributedTextHeightHtml:self.htmlString withMaxRect:self.viewMaxRect];
//        self.frame = CGRectMake(self.viewMaxRect.origin.x, self.viewMaxRect.origin.y, self.viewMaxRect.size.width, textSize.height);
//        self.attributedString = [DZHtmlUtils getAttributedStringWithHtml:self.htmlString];
//
//        [self relayoutText];
    }
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
