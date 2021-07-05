//
//  DZBarButtonItem.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/4/3.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DZNaviItemType) {
    DZNaviItemType_None,
    DZNaviItemType_Text,//文本
    DZNaviItemType_Image//图片
};

@interface DZBarButtonItem : NSObject

@property (nonatomic, strong) id target;  //!< 属性注释
@property (nonatomic, assign) SEL action;  //!< 属性注释

@property (nonatomic, assign) BOOL isTextButton;  //!< 属性注释
@property (nonatomic, assign) BOOL isBackImage;  //!< 是否是背景图

@property (nonatomic, copy) NSString *title;  //!< 文字
@property (nonatomic, copy) NSString *title_H;  //!< 高亮态的文字 或 图片

@property (nonatomic, copy) NSString *imagePath;  //!< 属性注释
@property (nonatomic, copy) NSString *imagePath_H;  //!< 高亮态的文字 或 图片

@property (nonatomic, assign) DZNaviItemType itemType;  //!< 属性注释


- (instancetype)initTextBarButton:(NSString *)titleOrImage touchH:(NSString *)titleOrImageH target:(id)target action:(SEL)action;

- (instancetype)initImageBarButton:(NSString *)imagePath touchH:(NSString *)imagePathH isBack:(BOOL)isBack target:(id)target action:(SEL)action;



@end

NS_ASSUME_NONNULL_END
