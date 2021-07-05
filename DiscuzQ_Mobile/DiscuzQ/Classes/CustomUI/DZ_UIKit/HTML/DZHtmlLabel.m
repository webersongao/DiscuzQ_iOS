//
//  DZHtmlLabel.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZHtmlLabel.h"
#import <DTCoreText.h>
#import "DTAnimatedGIF.h"

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
        [DTTextAttachment registerClass:[DTObjectTextAttachment class] forTagName:@"span"];
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
        DTLazyImageView *innerimageV = [[DTLazyImageView alloc] initWithFrame:frame];
        innerimageV.delegate = self;
        innerimageV.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *localImage = [(DTImageTextAttachment *)attachment image];
        innerimageV.image = localImage;
        innerimageV.url = attachment.contentURL;
        if ([imageURL containsString:@"gif"]) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSData *gifData = [NSData dataWithContentsOfURL:attachment.contentURL];
                dispatch_async(dispatch_get_main_queue(), ^{
                    innerimageV.image = DTAnimatedGIFFromData(gifData);
                });
            });
        }
        return innerimageV;
    }else if ([attachment isKindOfClass:[DTObjectTextAttachment class]]){
        NSDictionary *attributeDict = attachment.attributes;
        
        NSString *idStr = [attributeDict stringValueForKey:@"id" default:@""];
        NSString *valueStr = [attributeDict stringValueForKey:@"value" default:@""];
        
        if ([idStr isEqualToString:@"topic"]) {
            //        <span id="topic" value="15">#建议#</span>
            
        }else if ([idStr isEqualToString:@"member"]){
            //        <span id="member" value="19">@小虫</span>
            
        }
        
    }
    return nil;
}

//根据a标签，自定义响应按钮，处理点击事件
- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForLink:(NSURL *)url identifier:(NSString *)identifier frame:(CGRect)frame{
    DZHtmlButton *htmlButton = [DZHtmlButton htmlButtonURL:url.absoluteString withIdentifier:identifier frame:frame];
    return htmlButton;
}

- (void)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView willDrawLayoutFrame:(DTCoreTextLayoutFrame *)layoutFrame inContext:(CGContextRef)context{
//    KSLog(@"WBS willDrawLayoutFrame ");
}


- (void)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView didDrawLayoutFrame:(DTCoreTextLayoutFrame *)layoutFrame inContext:(CGContextRef)context{
//    KSLog(@"WBS didDrawLayoutFrame ");
}

//- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttributedString:(NSAttributedString *)string frame:(CGRect)frame{
//    return nil;
//}

#pragma mark  =====   Delegate：DTLazyImageViewDelegate  ======
//懒加载获取图片大小
- (void)lazyImageView:(DTLazyImageView *)lazyImageView didChangeImageSize:(CGSize)size {
    NSURL *url = lazyImageView.url;
    CGSize imageSize = size;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"contentURL == %@", url];
    // update all attachments that match this URL (possibly multiple images with same size)
    NSArray *localTextAttachArray = [self.layoutFrame textAttachmentsWithPredicate:pred];
    for (DTTextAttachment *oneAttachment in localTextAttachArray)
    {
        // update attachments that have no original size, that also sets the display size
        if (CGSizeEqualToSize(oneAttachment.originalSize, CGSizeZero))
        {
            oneAttachment.originalSize = imageSize;
            [self gao_configNoSizeImageView:url.absoluteString size:imageSize];
        }else{
            //            KSLog(@"WBS 图片完美展示");
        }
    }
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

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
