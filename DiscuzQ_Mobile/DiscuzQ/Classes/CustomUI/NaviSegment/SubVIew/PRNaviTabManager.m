//
//  PRNaviTabManager.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/6/12.
//

#import "PRNaviTabManager.h"
#import "PRTriangleCaptionBtn.h"
#import <SDWebImage.h>

@interface PRNaviTabManager ()

@property (nonatomic, strong) NSMutableDictionary *originTitleDict;  //!< 属性注释

@end

@implementation PRNaviTabManager

+(instancetype)shared{
    static PRNaviTabManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PRNaviTabManager alloc] init];
    });
    return instance;
}

-(NSDictionary *)calculateTitleWidthinfo:(NSMutableArray *)TitleArray cache:(BOOL)cache Completion:(void(^)(NSDictionary *widthDict))completion{
    
    if (!TitleArray.count) {
        if (completion) {
            completion(nil);
        }
        return nil;
    }
    
    if (!cache) {
        [self.originTitleDict removeAllObjects];
    }
    
    NSMutableArray *imgTitleArr = [[NSMutableArray alloc] initWithCapacity:3];
    NSArray *tempArray = [[NSArray alloc]initWithArray:TitleArray];
    [TitleArray removeAllObjects];
    for (int index = 0; index<tempArray.count; index++) {
        NSString *titleStr = tempArray[index];
        // 左右各 15.f 的间距
        if (titleStr.length) {
            if ([titleStr hasPrefix:kStoreIconPrefix]) {
                // 图片默认占位图宽度为30.f
                [imgTitleArr addObject:titleStr];
                [self.originTitleDict setValue:@(30) forKey:titleStr];
            }else{
                CGFloat NameWidth = [titleStr cacaulteStringWidth:15.0 maxHeight:16.0];
                [self.originTitleDict setValue:@(NameWidth) forKey:titleStr];
            }
            [TitleArray addObject:titleStr];
        }
    }
    if (imgTitleArr.count) {
        [self reloadNaviIconTitleWithArr:imgTitleArr completion:completion];
    }
    return self.originTitleDict;
}

-(void)reloadNaviIconTitleWithArr:(NSArray *)titleArray completion:(void(^)(NSDictionary *widthDict))completion{
    
    dispatch_group_t group = dispatch_group_create();
    __block NSMutableDictionary *tmpDict = [[NSMutableDictionary alloc] initWithDictionary:self.originTitleDict];
    
    for (NSString *originTitle in titleArray) {
        if ([originTitle hasPrefix:kStoreIconPrefix]) {
            NSString *imgURLString = [originTitle substringFromIndex:kStoreIconPrefix.length];
            NSArray *imgIconArr = [imgURLString componentsSeparatedByString:kStoreIconSeparator];
            NSString * highImgString = nil;
            NSString * normalImgString = imgIconArr.firstObject;
            if (imgIconArr.count > 1) {
                highImgString = imgIconArr[1];
                dispatch_group_enter(group);
                [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:highImgString] options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
                    dispatch_group_leave(group);
                }];
            }
            
            dispatch_group_enter(group);
            [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:normalImgString] options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
                CGFloat imgWidth = image ? ((image.size.width * kStoreIconHeight) / image.size.height) : 40.f;
                [tmpDict setValue:@(imgWidth) forKey:originTitle];
                dispatch_group_leave(group);
            }];
        }
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        self.originTitleDict = [NSMutableDictionary dictionaryWithDictionary:tmpDict];
        if (completion) {
            completion(tmpDict);
        }
    });
    
}


+(PRTriangleCaptionBtn *)configSegmentButton:(NSString *)oriTitleString{
    
    PRTriangleCaptionBtn* btnView = [[PRTriangleCaptionBtn alloc] initWithFrame:CGRectZero];
    
    NSString *bottomTitle = nil;
    NSString *highImgUrl = nil;
    NSString *normalImgUrl = nil;
    NSString *normalTitle = nil;
    
    if ([oriTitleString hasPrefix:kStoreIconPrefix]) {
        NSString *imgURLString = [oriTitleString substringFromIndex:kStoreIconPrefix.length];
        NSArray *imgIconArr = [imgURLString componentsSeparatedByString:kStoreIconSeparator];
        normalImgUrl = imgIconArr.firstObject;
        if (imgIconArr.count > 1) {
            highImgUrl = imgIconArr[1];
        }
        if (imgIconArr.count > 2) {
            normalTitle = imgIconArr[2];
        }
    }else{
        NSArray *titleArr = [oriTitleString componentsSeparatedByString:kStoreTitleSeparator];
        normalTitle = titleArr.firstObject;
        if (titleArr.count > 1) {
            bottomTitle = titleArr[1];
        }
    }
    
    [btnView setCaptionTitleInfo:normalTitle bottom:bottomTitle image:normalImgUrl highImgUrl:highImgUrl buttonKey:oriTitleString];
    
    return btnView;
}


-(NSMutableDictionary *)originTitleDict{
    if (_originTitleDict == nil) {
        _originTitleDict = [[NSMutableDictionary alloc] initWithCapacity:3];
    }
    return _originTitleDict;
}


@end
