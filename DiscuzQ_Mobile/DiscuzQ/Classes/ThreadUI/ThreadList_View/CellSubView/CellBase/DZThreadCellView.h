//
//  DZThreadCellView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2019/12/24.
//  Copyright © 2019 WebersonGao. All rights reserved.
//  包含一条帖子的 作者 基本内容 以及 转评赞工具条
 
#import <UIKit/UIKit.h>

@interface DZThreadCellView : UIView

- (void)updateThreadCellContent:(DZQDataThread *)dataModel cellPath:(NSIndexPath *)indexPath;

-(void)configBaseAction:(id)target avatar:(SEL)avatarSel more:(SEL)moreSel like:(SEL)likeSel reply:(SEL)replySel share:(SEL)shareSel;

@end


