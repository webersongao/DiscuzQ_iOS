//
//  DTTextView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2019/11/12.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAttributedTextContentView.h"
#import "DTLazyImageView.h"
#import "DTLinkButton.h"
#import "DTAttributedLabel.h"
@class DTTextView;
@protocol DTTextViewDelegate
- (void)contentLinkPush:(NSDictionary *)dict;

@optional
- (void)adjustForHtmlLayout:(DTTextView*)dtTextView;
@end



@interface DTTextView : UIView<DTAttributedTextContentViewDelegate, DTLazyImageViewDelegate,UIActionSheetDelegate>
{
	NSAttributedString *_attributedString;
	DTAttributedLabel *_attributedTextContextView;
	
	NSUInteger _htmlHash; // preserved hash to avoid relayouting for same HTML
    BOOL m_StringHasChange;
    
    int _maxRows;
    
    NSDictionary *_dict;
    
    BOOL bNeedReloadServerPic;
    
    NSString* _contentStr;
    BOOL _showCopy;
    UILongPressGestureRecognizer* _longPressGesture;
    UITapGestureRecognizer* _singleTapGesture;
//    int m_maxLine;//全部显示要多少行
}
@property (nonatomic, strong) NSAttributedString *attributedString;
@property (nonatomic, readonly) DTAttributedLabel *attributedTextContextView;
@property (nonatomic, assign) BOOL bNeedReloadServerPic;
@property (nonatomic, weak) id<DTTextViewDelegate> htmlDelegate;
@property(nonatomic, retain)NSString* contentStr;
@property(nonatomic, assign)BOOL showCopy;
@property(nonatomic, assign)NSInteger fontSize;
@property (nonatomic, assign)CGFloat  lineHeightMultiplier;  // 这个参数主要是用来改行间距的
@property(nonatomic, copy )NSString* linkColor;//超链接字体颜色
@property(nonatomic, copy )NSString* defaultTextColor; // 超文本默认的颜色

- (BOOL)isNeedMoreButtonByStyleMaxWidth:(int)width maxRow:(int)row;
- (void)setNumberOfLine:(int)numberOfLine;

- (void)setHTMLString:(NSString *)html;

- (NSUInteger)md5Hash:(NSString*)string;
- (int)getWidthIfOnlyOneLine;
- (CGFloat)getLastLineWidth;
- (NSInteger)getLineCount;
- (int)getTextHeight;
- (void)loadString;
- (void)loadStringByWidth:(CGFloat)width;
- (CGFloat)requiredRowHeightInTableView:(CGFloat)contentWidth;

- (void)addSingleClickedRecognizer:(BOOL)add;

@end


