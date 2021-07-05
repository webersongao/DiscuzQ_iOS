//
//  DZQChatTextView.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQChatTextView.h"
#import "DZQChatEmotionModel.h"

@implementation DZQChatTextView

+ (instancetype)chatInputWithFrame:(CGRect)frame delehgate:(id)delegate
{
    DZQChatTextView *inputV = [[DZQChatTextView alloc] initWithFrame:frame];
    
    inputV.textContainerInset = UIEdgeInsetsMake(10, 5, 10, 5);
    inputV.delegate = delegate;
    inputV.textColor = KContent_Color;
    inputV.backgroundColor = KDebug_Color;
    inputV.returnKeyType = UIReturnKeySend;
    inputV.font = [UIFont systemFontOfSize:15];
    inputV.showsHorizontalScrollIndicator = NO;
    inputV.showsVerticalScrollIndicator = NO;
    inputV.enablesReturnKeyAutomatically = YES;
    inputV.layoutManager.allowsNonContiguousLayout = NO;
    inputV.scrollEnabled = NO;
    return inputV;
}



-(instancetype)updaeteEmoji:(NSObject *)emojiText{

    //删除表情字符串
    if ([emojiText isEqual: DeleteButtonId]) {
        [[DZQChatEmotionCenter sharedCenter] deleteEmtionString:self];
    }else if (![emojiText isKindOfClass:[UIImage class]]) {
        //系统自带表情直接拼接
        [self replaceRange:self.selectedTextRange withText:(NSString *)emojiText];
    }else {
        //其他的表情用可变字符来处理
        NSString * emtionString = [[DZQChatEmotionCenter sharedCenter] emotionStringWithImg:(UIImage *)emojiText];
        self.text = [NSString stringWithFormat:@"%@%@",self.text, emtionString];
    }
    
    return self;
}


-(void)resetInputState{
    self.text = @"";
    [self setContentOffset:CGPointZero animated:YES];
    [self scrollRangeToVisible:self.selectedRange];
    self.contentSize = CGSizeMake(self.contentSize.width, 35);
}

//获取到textView的最佳高度
-(CGFloat)heightOfTextView{
    //获取到textView的最佳高度
    NSInteger height = ceilf([self sizeThatFits:CGSizeMake(self.width, MAXFLOAT)].height);
    
    if(height > DZQChatTextMaxHeight){
        height = DZQChatTextMaxHeight;
        self.scrollEnabled = YES;
    }else if(height < DZQChatTextHeight){
        height = DZQChatTextHeight;
        self.scrollEnabled = NO;
    }else{
        self.scrollEnabled = NO;
    }
    
    return height;
}

@end
