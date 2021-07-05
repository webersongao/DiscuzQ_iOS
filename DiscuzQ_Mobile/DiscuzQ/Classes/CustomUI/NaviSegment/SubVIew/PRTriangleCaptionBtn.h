//
//  PRTriangleCaptionBtn.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/6/4.
//

#import <UIKit/UIKit.h>

@interface PRTriangleCaptionBtn : UIView


@property (nonatomic, assign,readonly) BOOL isSelected;  //!< 属性注释

- (void)setTitleAlignment:(NSTextAlignment)alignment;
- (void)setBottomBtnTitleColor;
- (void)updateCaptionState:(BOOL)bSelected;
- (void)setCaptionTitleTopFont:(UIFont *)font;
- (void)setCaptionTitleColor:(UIColor *)color forState:(UIControlState)State;
- (void)setCaptionBtnTitleColor:(UIColor *)color forSelectState:(BOOL)bSelectState;
- (void)addCaptionTitleTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
- (void)setCaptionTitleInfo:(NSString*)normalTitle bottom:(NSString*)bottom image:(NSString *)imagUrl highImgUrl:(NSString *)highImgUrl buttonKey:(NSString *)key;

@end

