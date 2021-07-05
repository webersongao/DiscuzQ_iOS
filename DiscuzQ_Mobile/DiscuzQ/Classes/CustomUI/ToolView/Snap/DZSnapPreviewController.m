//
//  DZSnapPreviewController.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/01/19.
//  Copyright © 2020年 WebersonGao. All rights reserved.
//

#import "DZSnapPreviewController.h"

@interface DZSnapPreviewController ()

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UIImage *image;

@end

@implementation DZSnapPreviewController


- (instancetype)init:(UIImage *)image
{
    self = [super init]; //用于初始化父类
    if (self) {
        self.image = image;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveImage)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"放弃" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewControllerAnimated)];
}

- (void)initView{
    self.view.backgroundColor = KWhite_Color;
    
    self.imageView = [UIImageView new];
    self.imageView.image = self.image;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.scrollView = [UIScrollView new];
    [self.scrollView addSubview:self.imageView];
    
    [self.view addSubview:self.scrollView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    CGFloat height =  self.image.size.height;
    CGFloat width =  self.image.size.width;
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake(width, height);
    self.imageView.frame = CGRectMake(0, 0, width, height);
}

- (void)saveImage{
    //save to photosAlbum
    UIImageWriteToSavedPhotosAlbum(self.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *barItemTitle = @"保存成功";
    if (error != nil) {
        barItemTitle = @"保存失败";
    }
    
    [self.navigationItem.rightBarButtonItem setTitle:barItemTitle];
    [self dismissViewControllerAnimated];
}

- (void)dismissViewControllerAnimated{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
