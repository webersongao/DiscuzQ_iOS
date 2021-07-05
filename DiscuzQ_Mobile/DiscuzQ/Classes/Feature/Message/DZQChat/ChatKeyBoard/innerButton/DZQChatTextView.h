//
//  DZQChatTextView.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/3/6.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZQChatTextView : UITextView



-(void)resetInputState;

//获取到textView的最佳高度
-(CGFloat)heightOfTextView;

-(instancetype)updaeteEmoji:(NSObject *)emojiText;

+ (instancetype)chatInputWithFrame:(CGRect)frame delehgate:(id)delegate;

@end

NS_ASSUME_NONNULL_END
