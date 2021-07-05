//
//  DZQChatMessage.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/10/12.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

//cell的一些设置
#define DZQChatTextCellId        @"DZQChatTextCellId"
#define DZQChatImageCellId       @"DZQChatImageCellId"
#define DZQChatVoiceCellId       @"DZQChatVoiceCellId"
#define DZQChatMapCellId         @"DZQChatMapCellId"
#define DZQChatVideoCellId       @"DZQChatVideoCellId"

#define DZQChatCellTop           15           //顶部距离cell
#define DZQChatCellBottom        15           //底部距离cell
#define DZQChatIconWH            44           //原型头像尺寸
#define DZQChatIconLeft          10           //头像与左边距离
#define DZQChatIconRight         10           //头像与右边距离
#define DZQChatDetailRight       10           //详情与右边距离
#define DZQChatTextTop           12           //文本距离详情顶部
#define DZQChatTextBottom        12           //文本距离详情底部
#define DZQChatTextLRS           12           //文本左右短距离
#define DZQChatTextLRB           20           //文本左右长距离

//显示时间
#define DZQChatTimeWidth         250          //时间宽度
#define DZQChatTimeHeight        20           //时间高度
#define DZQChatTimeTop           15           //时间距离顶部
#define DZQChatTimeBottom        20           //时间距离底部


#define DZQChatAirTop            35           //气泡距离详情顶部
#define DZQChatAirLRS            10           //气泡左右短距离
#define DZQChatAirBottom         10           //气泡距离详情底部
#define DZQChatAirLRB            22           //气泡左右长距离
#define DZQChatTimeFont          12           //时间字体
#define DZQChatTextFont          17           //内容字号

#define DZQChatTextLineSpacing   5            //文本行高
#define DZQChatTextRowSpacing    0            //文本间距

//文本颜色
#define DZQChatTextColor         [UIColor blackColor]

//右侧头像的X坐标
#define DZQChatIcon_RX            kScreenWidth-DZQChatIconRight-DZQChatIconWH

//文本自适应限制宽度
#define DZQChatTextInitWidth    kScreenWidth*0.7-DZQChatTextLRS-DZQChatTextLRB

//图片最大尺寸(正方形)
#define DZQChatImageMaxSize    150

//音频的最小宽度  最大宽度   高度
#define DZQChatVoiceMinWidth     100
#define DZQChatVoiceMaxWidth        kScreenWidth*2/3-DZQChatTextLRS-DZQChatTextLRB
#define DZQChatVoiceHeight       45
//音频时间字体
#define DZQChatVoiceTimeFont     14
//音频波浪图案尺寸
#define DZQChatVoiceImgSize      20


//地图位置宽度 高度
#define DZQChatMapWidth        240
#define DZQChatMapHeight       150


//短视频位置宽度 高度
#define DZQChatVideoWidth        200
#define DZQChatVideoHeight       150

/// 判断消息的发送者
typedef NS_ENUM(NSInteger, DZQChatMsgFrom) {
    DZQChatMsgFromMe    = 1, // 我发的
    DZQChatMsgFromOther = 2, // 对方发的(单聊群里同等对待)
    DZQChatMsgFromSystem = 3 // 系统消息(提示撤销删除、商品信息等)
};


/// 判断发送消息所属的类型
typedef NS_ENUM(NSInteger, DZQChatMsgType) {
    DZQChatMsgTypeText = 1,  // 文本消息
    DZQChatMsgTypeImage = 2,  // 图片消息
    DZQChatMsgTypeGif = 3,  // Gif图片消息
    DZQChatMsgTypeVoice = 4,  // 语音消息
    DZQChatMsgTypeMap = 5,  // 语音消息
    DZQChatMsgTypeVideo = 6,  // 小视频
    DZQChatMsgTypeThread = 7,  // 主题帖子
    
    DZQChatMsgTypeUndo = 50,  // 撤销的消息
    DZQChatMsgTypeDelete = 51,  // 删除的消息
};




@interface DZQChatMessage : NSObject


/**
 判断当前时间是否展示
 
 @param lastTime 最后展示的时间
 @param currentTime 当前时间
 */
-(void)showTimeWithLastShowTime:(NSString *)lastTime currentTime:(NSString *)currentTime;

//消息发送方  消息类型  消息对应cell类型
@property (nonatomic, assign) DZQChatMsgFrom messageFrom;
@property (nonatomic, assign) DZQChatMsgType messageType;
@property (nonatomic, strong) NSString     *cellString;

//会话id
@property (nonatomic, strong) NSString    *sessionId;

//消息id   消息时间  是否显示时间 （这里需要什么就设置什么 不宜过多）
@property (nonatomic, strong) NSString    *messageId;
@property (nonatomic, strong) NSString    *messageTime;
@property (nonatomic, assign) BOOL        showTime;

//消息是否发送失败
@property (nonatomic, assign) BOOL sendError;

//头像
@property (nonatomic, strong) NSString    *headerImgurl;

//单条消息背景图
@property (nonatomic, strong) NSString    *backImgString;


//文本消息内容 颜色  消息转换可变字符串
@property (nonatomic, strong) NSString    *textString;
@property (nonatomic, strong) UIColor     *textColor;
@property (nonatomic, strong) NSMutableAttributedString  *attTextString;

//图片消息链接或者本地图片 图片展示格式
@property (nonatomic, strong) NSString    *imageString;
@property (nonatomic, strong) UIImage     *image;
@property (nonatomic, assign) UIViewContentMode contentMode;

//gif图片本地地址  图片的第一张图
@property (nonatomic, strong) NSString    *imageLocalPath;
@property (nonatomic, strong) NSArray     *imageArr;

//音频时长(单位：秒) 展示时长  音频网络路径  本地路径  音频
@property (nonatomic, assign) NSInteger   voiceDuration;
@property (nonatomic, strong) NSString    *voiceTime;
@property (nonatomic, strong) NSString    *voiceRemotePath;
@property (nonatomic, strong) NSString    *voiceLocalPath;
@property (nonatomic, strong) NSData      *voice;
//语音波浪图标及数组
@property (nonatomic, strong) UIImage     *voiceImg;
@property (nonatomic, strong) NSArray     *voiceImgs;


//地理位置纬度  经度   详细地址
@property (nonatomic, assign) double      latitude;
@property (nonatomic, assign) double      longitude;
@property (nonatomic, strong) NSString    *addressString;

//短视频缩略图网络路径 本地路径  视频图片 local路径
@property (nonatomic, strong) NSString    *videoRemotePath;
@property (nonatomic, strong) NSString    *videoLocalPath;
@property (nonatomic, strong) UIImage     *videoImage;
@property (nonatomic, assign) NSInteger   videodDration;


//拓展消息
@property(nonatomic,strong)NSDictionary *dict;





@end
