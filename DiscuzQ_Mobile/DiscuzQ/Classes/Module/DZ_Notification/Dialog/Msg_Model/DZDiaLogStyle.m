//
//  DZDiaLogStyle.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZDiaLogStyle.h"

@implementation DZDiaLogStyle

+(DZQStyle *)inner_dataStyle:(DZQDataDialog *)dataModel{
    
    DZDiaLogStyle *style = [DZDiaLogStyle DDialogListStyleWithCellWidth:kScreenWidth dataModel:dataModel];
    
    return style;
}


+(instancetype)DDialogListStyleWithCellWidth:(CGFloat)cellWidth dataModel:(DZQDataDialog *)dataModel{
    

    DZDiaLogStyle *dialogStyle = [[DZDiaLogStyle alloc] init];
    
    dialogStyle.kf_cellHeight = kCellHeight_70;
    
    dialogStyle.kf_icon = CGRectMake(15, kMargin15, 30, 30);
    CGFloat nameLabelW = (cellWidth/2.f) - CGRectGetMaxX(dialogStyle.kf_icon);
    dialogStyle.kf_title = CGRectMake(CGRectGetMaxX(dialogStyle.kf_icon)+kMargin15, 12.5, nameLabelW, 18.f);
    
    
    dialogStyle.kf_time = CGRectMake(cellWidth/2.f, CGRectGetMinY(dialogStyle.kf_title), (cellWidth/2.f)-15.f, 13.f);
    dialogStyle.kf_number = CGRectMake(cellWidth-kMargin30, dialogStyle.kf_cellHeight/2.0, 15.0, 15.0);
    dialogStyle.kf_bottomLine= CGRectMake(kMargin15, dialogStyle.kf_cellHeight-0.5, cellWidth-kMargin30, 0.5);
    
    dialogStyle.kf_timeString = [dataModel.attributes.created_at dateFormatWithAccurate:unAccurate];
    
    
    
    CGFloat contentW = cellWidth - CGRectGetMaxX(dialogStyle.kf_icon)-kMargin60;
    dialogStyle.kf_diaCellMaxRect = CGRectMake(CGRectGetMinX(dialogStyle.kf_title), CGRectGetMaxY(dialogStyle.kf_title)+5.0, contentW, CGFLOAT_MAX);
    dialogStyle.kf_diaContentItem = [DZHtmlItem canculateHtmlStyle:dataModel.relationships.dialogMessage.attributes.message_text_html maxRect:dialogStyle.kf_diaCellMaxRect];
    dialogStyle.kf_content = CGRectMake(CGRectGetMinX(dialogStyle.kf_title), CGRectGetMaxY(dialogStyle.kf_title)+5.0, contentW, dialogStyle.kf_diaContentItem.lineHeight);

    return dialogStyle;
}


@end
