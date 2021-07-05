//
//  DZQChatTextCell.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/10.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatTextCell.h"

@implementation DZQChatTextCell

-(void)config_ChatCellUserInterface{
    [super config_ChatCellUserInterface];
    [self.mBackImgButton addSubview:self.labelTextView];
}

-(void)updateChatCell:(DZQChatMsgLayout *)layout indexPath:(NSIndexPath *)indexPath delegate:(id)delegate{
    [super updateChatCell:layout indexPath:indexPath delegate:delegate];
    
    UIImage *image = [UIImage imageNamed:layout.message.backImgString];
    image = [image resizableImageWithCapInsets:layout.imageInsets resizingMode:UIImageResizingModeStretch];
    
    self.mBackImgButton.frame = layout.backImgButtonRect;
    [self.mBackImgButton setBackgroundImage:image forState:UIControlStateNormal];

    self.labelTextView.frame = self.layout.textLabRect;
    self.labelTextView.attributedText = layout.message.attTextString;
    
}


@end
