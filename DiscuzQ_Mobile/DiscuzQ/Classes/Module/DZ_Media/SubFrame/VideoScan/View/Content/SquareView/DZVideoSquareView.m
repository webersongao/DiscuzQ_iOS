//
//  DZVideoSquareView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZVideoSquareView.h"

@interface DZVideoSquareView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation DZVideoSquareView

- (instancetype)initWithSquareFrame:(CGRect)frame{
    self = [super initWithSquareFrame:frame];
    if (self) {
        [self configHomeSquareView];
    }
    return self;
}


-(void)configHomeSquareView{
    
    self.delegate = self;
    self.dataSource = self;
}

-(void)updateHome:(NSArray *)dataArray{
    
    
}

#pragma mark   /********************* UICollectionViewDataSource *************************/


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}



#pragma mark   /********************* UICollectionViewDelegate *************************/

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}




@end


















