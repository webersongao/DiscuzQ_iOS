//
//  DZQChatImageCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatImageCell.h"

@implementation DZQChatImageCell

-(void)config_ChatCellUserInterface{
    
    [super config_ChatCellUserInterface];
    
    self.mImgView = [UIImageView new];
    self.mImgView.layer.cornerRadius = 5;
    self.mImgView.layer.masksToBounds  = YES;
    self.mImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.mImgView.backgroundColor = [UIColor whiteColor];
    [self.mBackImgButton addSubview:self.mImgView];
}


-(void)updateChatCell:(DZQChatMsgLayout *)layout indexPath:(NSIndexPath *)indexPath delegate:(id)delegate{
    [super updateChatCell:layout indexPath:indexPath delegate:delegate];
    
    UIImage *image = [UIImage imageNamed:layout.message.backImgString];
    image = [image resizableImageWithCapInsets:layout.imageInsets resizingMode:UIImageResizingModeStretch];
    self.mBackImgButton.frame = layout.backImgButtonRect;
    [self.mBackImgButton setBackgroundImage:image forState:UIControlStateNormal];
    
    //普通图片
    if(layout.message.messageType == DZQChatMsgTypeImage){
        self.mImgView.frame = self.mBackImgButton.bounds;
        self.mImgView.image = self.layout.message.image;
        self.mImgView.contentMode = self.layout.message.contentMode;
    }else{
        //gif图片
        self.mImgView.frame = self.mBackImgButton.bounds;
        self.mImgView.contentMode = self.layout.message.contentMode;
        self.mImgView.animationImages = self.layout.message.imageArr;
        self.mImgView.animationDuration = self.layout.message.imageArr.count * 0.1;
        [self.mImgView startAnimating];
    }
    
    //给图片设置一个描边 描边跟背景按钮的气泡图片一样
    UIImageView *btnImgView = [[UIImageView alloc]initWithImage:image];
    btnImgView.frame = CGRectInset(self.mImgView.frame, 0.0f, 0.0f);
//    self.mImgView.layer.mask = btnImgView.layer;
}


//点击展开图片
-(void)buttonPressed:(UIButton *)sender{
    if(self.cellDelegate && [self.cellDelegate respondsToSelector:@selector(DZQChatCellImageVideoClick:layout:)]){
        [self.cellDelegate DZQChatCellImageVideoClick:self.indexPath layout:self.layout];
    }
}

@end
