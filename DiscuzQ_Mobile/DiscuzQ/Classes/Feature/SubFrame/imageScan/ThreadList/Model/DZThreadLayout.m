//
//  DZThreadLayout.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/24.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "DZThreadLayout.h"
#import "DZThreadListModel.h"

@implementation DZTHHeadLayout


@end

@implementation DZTHBottomLayout


@end

@implementation DZThreadLayout

- (instancetype)initWithModel:(DZThreadListModel *)Model isList:(BOOL)isList isTop:(BOOL)isTop
{
    self = [super init];
    if (self) {
        self.isTop = isTop;
        if (isList) {
            [self caculateListCell:Model isTop:isTop];
        }else{
            [self caculateSquareCell:Model isTop:isTop];
        }
    }
    return self;
}

-(void)caculateListCell:(DZThreadListModel *)cellModel isTop:(BOOL)isTop{
    
    CGFloat cellWidth = KScreenWidth;
    CGFloat textWidth = cellWidth - kMargin20;
    CGFloat buttonWidth = 65;
    CGFloat buttonLeft = cellWidth-(buttonWidth * 3)-kMargin15;
    
    self.headLayout = [[DZTHHeadLayout alloc] init];
    self.bottomLayout = [[DZTHBottomLayout alloc] init];
    
    CGFloat attachMargin = cellModel.imglist.count ? kMargin10 : 0;
    CGFloat attachHeight = cellModel.imglist.count ? KWidthScale(90) : 0;
    CGFloat nameWidth = [NSString cacaulteStringWidth:cellModel.author fontSize:16];
    CGFloat timeWidth = [NSString cacaulteStringWidth:cellModel.dateline fontSize:12];
    CGFloat gradeWidth = [NSString cacaulteStringWidth:cellModel.gradeName fontSize:12];
    
    CGFloat subtitleMargin = cellModel.lastReplyString.length ? kMargin10 : 0.f;
    CGFloat subtitleHeight = [NSString cacaulteStringHeight:cellModel.lastReplyString fontSize:14 width:textWidth lineSpacing:kMargin5];
    
    if (!isTop) {
        self.headFrame = CGRectMake(0, 0, cellWidth, kMargin40);
        
        self.headLayout.iconFrame = CGRectMake(kMargin10, kMargin5, 30, 30);
        self.headLayout.nameFrame = CGRectMake(CGRectGetMaxX(self.headLayout.iconFrame) + kMargin10, kMargin5, nameWidth, 30);
        self.headLayout.gradeFrame = CGRectMake(CGRectGetMaxX(self.headLayout.nameFrame)+ kMargin10, kMargin5, gradeWidth, cellModel.gradeName.length ? 30 : 0);
        self.headLayout.tagFrame = CGRectMake(cellWidth-kMargin10-34, (kMargin40-17)/2.f, 34, 17);
        CGFloat timeLabelLeft = cellModel.tagImage ? CGRectGetMinX(self.headLayout.tagFrame) : cellWidth;
        self.headLayout.timeFrame = CGRectMake(timeLabelLeft - kMargin10 - timeWidth, kMargin5, timeWidth, 30);
    }
    
    self.titleFrame = CGRectMake(kMargin10, isTop ? kMargin10 : (CGRectGetMaxY(self.headFrame)+kMargin10), textWidth, 17.f);
    
    if (!isTop) {
        self.contentFrame = CGRectMake(kMargin10, CGRectGetMaxY(self.titleFrame)+subtitleMargin, textWidth, subtitleHeight);
        self.attachFrame = CGRectMake(kMargin10, CGRectGetMaxY(self.contentFrame)+attachMargin, textWidth, attachHeight);
        
        self.bottomFrame = CGRectMake(0, CGRectGetMaxY(self.attachFrame)+kMargin15, cellWidth, 13.f+kMargin10);
        
        self.bottomLayout.viewFrame = CGRectMake(buttonLeft, 0, buttonWidth, 13.f);
        self.bottomLayout.replyFrame = CGRectMake(CGRectGetMaxX(self.bottomLayout.viewFrame), 0, buttonWidth, 13.f);
        self.bottomLayout.zanFrame = CGRectMake(CGRectGetMaxX(self.bottomLayout.replyFrame), 0, buttonWidth, 13.f);
        self.bottomLayout.lineFrame = CGRectMake(0, 13.f+kMargin5, cellWidth, kMargin5);
    }
    
    self.cellHeight = isTop ? (CGRectGetMaxY(self.titleFrame) + kMargin10) : CGRectGetMaxY(self.bottomFrame);
    
}

-(void)caculateSquareCell:(DZThreadListModel *)cellModel isTop:(BOOL)isTop{
    
    
    
}





@end
