//
//  DZQChatEmotionModel.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/6/1.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DZQChatKeyHeader.h"

/**
 表情模型
 */
@interface DZQChatEmotionModel : NSObject

+ (DZQChatEmotionModel *)emotionWithDict:(NSDictionary*)dic atIndex:(int)index;

//for post, ex:[0]
@property (nonatomic, copy) NSString* code;
//for parse, ex:[微笑]
@property (nonatomic, copy) NSString* name;
//ex, Expression_1.png
@property (nonatomic, copy) NSString* imageName;

@end





/**
 配置表情，包括系统自带的表情 还有本地导入的表情
 */
@interface DZQChatEmotionCenter : NSObject

@property(nonatomic,strong)NSMutableArray *emotions;
@property(nonatomic,strong)NSMutableArray<UIImage*> *images;
@property(nonatomic,strong)NSMutableArray *codes;
@property(nonatomic,strong)NSMutableArray *systemImages;


+ (DZQChatEmotionCenter *)sharedCenter;
- (void)initEmotionImages;
- (void)initSystemEmotionImages;

//对数组进行处理
-(NSMutableArray *)dealWithArray:(NSMutableArray *)arr1 arr2:(NSMutableArray *)arr2;

//将表情图转换成字符串
-(NSString *)emotionStringWithImg:(UIImage *)image;
//将字符串转换成对应的表情图
-(UIImage *)emotionImgWithString:(NSString *)string;

//将字符串中所有的表情字符串转换成图片 并返回可变字符串
-(NSMutableAttributedString *)emotionImgsWithString:(NSString *)string;

//输入视图删除 [微笑] 这类字符串  直接一次性删除
-(void)deleteEmtionString:(UITextView *)textView;

@end




/**
 表单Layout
 */
@interface DZQChatEmotionLayout : UICollectionViewFlowLayout

@end















