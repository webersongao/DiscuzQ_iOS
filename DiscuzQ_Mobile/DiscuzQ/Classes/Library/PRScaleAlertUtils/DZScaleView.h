//
//  DZScaleView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/9/28.
//

#import <UIKit/UIKit.h>

@interface DZScaleView : UIView

@property(nonatomic,copy) void (^dismissBlock)(void);  /// 移除弹窗后执行的block
@property(nonatomic,copy) void (^touchAlertblock)(CGPoint Point); /// 点击到弹窗上时 返回tap位置的block

@end
