//
//  DZVideoSquareView.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/22.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZVideoSquareView.h"
#import "DZVideoSquareCell.h"

@interface DZVideoSquareView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation DZVideoSquareView

- (instancetype)initWithSquareFrame:(CGRect)frame{
    self = [super initWithSquareFrame:frame];
    if (self) {
        [self configDiscoverSquareView];
    }
    return self;
}


-(void)configDiscoverSquareView{
    
    self.delegate = self;
    self.dataSource = self;
}

-(void)updateDiscover:(NSArray *)dataArray{
    
    
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


















