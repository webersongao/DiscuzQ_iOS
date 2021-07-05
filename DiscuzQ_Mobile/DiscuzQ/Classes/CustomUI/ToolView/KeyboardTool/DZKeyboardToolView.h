//
//  DZKeyboardToolView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/2/22.
//

#import <UIKit/UIKit.h>

typedef void(^DZKeyboardToolClickBlock)(UIButton *button, NSUInteger index);

@interface DZKeyboardToolView : UIView

+ (instancetype)toolView;

@property (nonatomic, strong) NSArray<NSString *> *lBtnImgNames;
@property (nonatomic, strong) NSArray<NSString *> *rBtnImgNames;

@property (nonatomic, copy) DZKeyboardToolClickBlock lBtnClickBlock;
@property (nonatomic, copy) DZKeyboardToolClickBlock rBtnClickBlock;

@end
