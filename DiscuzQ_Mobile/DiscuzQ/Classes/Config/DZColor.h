//
//  Color.h
//  DiscuzQ
//
//  Created by WebersonGao on 2018/2/1.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

// 颜色文件
#ifndef Color_h
#define Color_h


/// 以下为经常使用的说明色
#define KF9F9F9_Color  @"#F9F9F9"  // 浅灰白
#define KFFFFFF_Color  @"#FFFFFF"  // 白色
#define K000000_Color  @"#000000"  // 纯黑
#define K4D5663_Color  @"#4D5663"  // 黑灰阴影色
#define K2A2C2F_Color  @"#2A2C2F"  //tabbar 标题黑色
#define K31323E_Color  @"#31323E"  // 深黑
#define K33C3A5_Color  @"#33C3A5"  // 绿色
#define K00BF99_Color  @"#00BF99"  // 绿色 -- 深绿色
#define K9A9AA7_Color  @"#9A9AA7"  // 灰色
#define KBDC0C6_Color  @"#BDC0C6"  // 灰色 -- 按钮禁用
#define KFD8230_Color  @"#FD8230"  // 高亮色（橙黄）
#define KE3170D_Color  @"#E3170D"  // 暗红色
#define K6A6C7A_Color  @"#6A6C7A"  // 灰色 -- 灰色
#define KF5F5F5_Color  @"#F5F5F5"  // 深色 分割线(常用)
#define KE2E2E5_Color  @"#E2E2E5"  // 浅 色 分割线(仅限导航条底部使用)




// 常用配置颜色
#define KRed_Color           KColor(KE3170D_Color, 1.0)
#define KWhite_Color         KColor(KFFFFFF_Color, 1.0)
#define KBlack_Color         KColor(K000000_Color, 1.0)

// 常用文字颜色
#define KTitle_Color         KColor(K2A2C2F_Color, 1.0) // 标题
#define KContent_Color       KColor(K31323E_Color, 1.0) // 正常正文颜色（常用）
#define KLightContent_Color  KColor(K9A9AA7_Color, 1.0) // 正常正文颜色（浅灰色正文）

#define KGray_Color          KColor(K9A9AA7_Color, 1.0) // 浅色正文
#define KLightGray_Color     KColor(KF5F5F5_Color, 1.0)

#define KGreen_Color         KColor(K33C3A5_Color, 1.0)
#define KDarkGreen_Color     KColor(K00BF99_Color, 1.0)
#define KShadow_Color        KColor(K4D5663_Color, 1.0)
#define KDisabled_Color      KColor(KBDC0C6_Color, 1.0)


// 图片 高亮态 和 正常态 色值
#define KHight_Color         KColor(KFD8230_Color, 1.0) // 点亮色（黄色253 130 48）: 81x81 48x48
#define KNormal_Color        KColor(K9A9AA7_Color, 1.0) // 正常色（灰色154,154,167）: 54x54 32x32

// 多用来做背景色
#define KLine_Color          KLightGray_Color
#define KDarkLine_Color      KColor(KE2E2E5_Color, 1.0)
#define KLightLine_Color     KColor(KF9F9F9_Color, 1.0)



#define KNormal_fontSize     14  // 常用字号

#define KTitle_fontSize      14  // 标题 字号
#define KContent_fontSize    14  // 正文内容 字号



#define KFont(fontSize)                     [UIFont systemFontOfSize:fontSize]
#define KBoldFont(fontSize)                 [UIFont boldSystemFontOfSize:fontSize]
#define KFontWeight(fontSize, fontWeight)   [UIFont systemFontOfSize:fontSize weight:fontWeight]
#define KExtraBoldFont(fontSize)            [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium]


#define KColor(colorName,alphaValue)  [UIColor color16WithHexString:colorName alpha:alphaValue]
#define mRGBColor(r, g, b)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define mRGBColor_alpha(r,g,b,a)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define KRandom_Color        mRGBColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))


#endif /* Color_h */
