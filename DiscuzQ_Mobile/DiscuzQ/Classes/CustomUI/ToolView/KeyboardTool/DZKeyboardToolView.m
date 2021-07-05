//
//  DZKeyboardToolView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/2/22.
//

#import "DZKeyboardToolView.h"

static CGFloat kToolViewH = 44.f;
static CGFloat kBtnW = 23.f;
static CGFloat kBtnH = 19.f;
static CGFloat kMargin = 16.f;

@interface DZKeyboardToolView ()

@property (nonatomic, strong) NSMutableArray<UIButton *> *lBtns;
@property (nonatomic, strong) NSMutableArray<UIButton *> *rBtns;

@end

@implementation DZKeyboardToolView

+ (instancetype)toolView {
//    NSString *nibName = NSStringFromClass([DZKeyboardToolView class]);
//    DZKeyboardToolView *toolView = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil].firstObject;
    
    DZKeyboardToolView *toolView = [[DZKeyboardToolView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kToolViewH)];
    
//    CGFloat toolViewW = CGRectGetWidth([UIScreen mainScreen].bounds);
//    [toolView setFrame:CGRectMake(0, 0, toolViewW, kToolViewH)];
    
    CALayer *topLineLayer = [CALayer layer];
    [topLineLayer setFrame:CGRectMake(0, 0, kScreenWidth, 0.5f)];
    [topLineLayer setBackgroundColor:[UIColor colorWithRed:0xc3/255.0f green:0xc3/255.0f blue:0xc3/255.0f alpha:1.0f].CGColor];
    [toolView.layer addSublayer:topLineLayer];
    
    return toolView;
}

- (void)didClickButtonAtLeft:(UIButton *)sender {
    if (!self.lBtnClickBlock) {
        return;
    }
    self.lBtnClickBlock(sender, [self.lBtns indexOfObject:sender]);
}

- (void)didClickButtonAtRight:(UIButton *)sender {
    if (!self.rBtnClickBlock) {
        return;
    }
    self.rBtnClickBlock(sender, [self.rBtns indexOfObject:sender]);
}

- (void)setLBtnImgNames:(NSArray<NSString *> *)lBtnImgNames {
    _lBtnImgNames = lBtnImgNames;
    
    [lBtnImgNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat x = kMargin + kBtnW * idx + 2 * kMargin * idx;
        CGFloat y = (kToolViewH - kBtnH) / 2.f;
        [btn setFrame:CGRectMake(x, y, kBtnW, kBtnH)];
        [btn setImage:[UIImage imageNamed:obj] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(didClickButtonAtLeft:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.lBtns addObject:btn];
    }];
}

- (void)setRBtnImgNames:(NSArray<NSString *> *)rBtnImgNames {
    _rBtnImgNames = rBtnImgNames;
    
    CGFloat toolViewW = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    [rBtnImgNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat x = toolViewW - (kBtnW * (idx + 1) + 2 * kMargin * idx + kMargin);
        CGFloat y = (kToolViewH - kBtnH) / 2.f;
        [btn setFrame:CGRectMake(x, y, kBtnW, kBtnH)];
        [btn setImage:[UIImage imageNamed:obj] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(didClickButtonAtRight:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.rBtns addObject:btn];
    }];
}

- (NSMutableArray<UIButton *> *)lBtns {
    if (!_lBtns) {
        _lBtns = [NSMutableArray array];
    }
    return _lBtns;
}

- (NSMutableArray<UIButton *> *)rBtns {
    if (!_rBtns) {
        _rBtns = [NSMutableArray array];
    }
    return _rBtns;
}

@end
