//
//  PRTagSegmentView.h
//  DiscuzQ
//
//  Created by third on 14-4-21.
//
//

#import <UIKit/UIKit.h>
#import "PRNaviTabManager.h"

@class PRTagSegmentView;
@protocol PRTagSegmentViewDelegate <NSObject>

@optional
- (void)navisegment:(PRTagSegmentView *)segment touchIndex:(NSInteger)index;
- (void)navisegment:(PRTagSegmentView *)segment updateIndex:(NSInteger)index;
- (void)navisegment:(PRTagSegmentView *)segment touchSameIndex:(NSInteger)index;

@end

@interface PRTagSegmentView : UIView

@property (nonatomic, strong) UIColor* selectLineColor;
@property (nonatomic, strong) UIColor* bgColor;
@property (nonatomic, strong) NSMutableArray* titleArr;
@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIColor* titleHightColor;
@property (nonatomic, strong) NSMutableArray *btnArr;
@property (nonatomic, weak) id<PRTagSegmentViewDelegate> delegate;
@property (nonatomic, strong) UIFont* titleFont;
@property (nonatomic, strong) UIFont* titleSelectFont;
@property (nonatomic, assign) NSInteger screenType;
@property (nonatomic, strong) NSMutableArray *titleRcctArr;
//@property (nonatomic, weak) UIImageView *bgImageView;
@property (nonatomic, weak) UIView *bottomLineView;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) CGFloat fixedLineWidth;

- (void)setupAllItems:(BOOL)bReload ;
- (void)setTabArr:(NSArray*)arr rect:(NSArray*)arrRc;//arrRc为具体rect,如果arrRc为nil，则等分
- (instancetype)initWithFrame:(CGRect)frame screenType:(SegTabType)screenType;

- (void)reLayoutAllButtonSubviews;
- (void)updateView:(NSInteger)index;   // 选中了 index 项目

@end
