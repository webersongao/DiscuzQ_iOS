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

#define mRGBColor(r, g, b)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBACOLOR(r,g,b,a)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define KRandom_Color        mRGBColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))
#define KColor(colorName,alphaValue)  [UIColor color16WithHexString:colorName alpha:alphaValue]

#define K_Color_MainGray     mRGBColor(238, 238, 238)
#define K_Color_Message      mRGBColor(102,102,102)
#define K_Color_ToolBack     mRGBColor(209, 213, 218)
#define K_Color_Disabled     mRGBColor(190, 190, 190)


#define KFFCE2E_Color  @"#FFCE2E" //黄色
#define KFD8D2F_Color  @"#FD8D2F"
#define K2D3035_Color  @"#2D3035"
#define KF9F9F9_Color  @"#F9F9F9" //
#define K8D8E91_Color  @"#8D8E91"
#define KFFFFFF_Color  @"#FFFFFF" // 白色
#define KFF6565_Color  @"#FF6565"
#define KF0F0F0_Color  @"#F0F0F0"
#define K000000_Color  @"#000000" // 纯黑
#define KBDC0C6_Color  @"#BDC0C6" // 按钮禁用
#define KECECEC_Color  @"#ECECEC" // 分割线
#define KF7F7F8_Color  @"#F7F7F8" // 点击高亮色
#define KCDCDCD_Color  @"#CDCDCD"
#define KFCA43B_Color  @"#FCA43B"
#define K00BF99_Color  @"#00BF99" //绿色
#define K2A2C2F_Color  @"#2A2C2F" //tabbar 黑色

// 以下为熊猫配色

#define K3A434E_Color  @"#3A434E"
#define KD8D8D8_Color  @"#D8D8D8"
#define KF6F7F8_Color  @"#F6F7F8"
#define KF7F7F7_Color  @"#F7F7F7"
#define KF7F8F9_Color  @"#F7F8F9"
#define KD0D0D0_Color  @"#D0D0D0"
#define KF5F6F8_Color  @"#F5F6F8"
#define K4D5663_Color  @"#4D5663"
#define KFF7634_Color  @"#FF7634"
#define K535B65_Color  @"#535B65"
#define KAAAAAA_Color  @"#AAAAAA"
#define K8E97A4_Color  @"#8E97A4"
#define KBABCC4_Color  @"#BABCC4"
#define KF63737_Color  @"#F63737"
#define KD3D3D3_Color  @"#D3D3D3"
#define K888888_Color  @"#888888"
#define KEEEEEE_Color  @"#EEEEEE"
#define KEFF1F4_Color  @"#EFF1F4"
#define KEBF9F6_Color  @"#EBF9F6"
#define KE2E4EB_Color  @"#E2E4EB"
#define K85682F_Color  @"#85682F"
#define K8F88FF_Color  @"#8F88FF"
#define K8B93A0_Color  @"#8B93A0"
#define KF4E3C5_Color  @"#F4E3C5"
#define KF7CC7A_Color  @"#F7CC7A"
#define KFFEEC5_Color  @"#FFEEC5"
#define KE2E4EB_Color  @"#E2E4EB"
#define KEFEFEF_Color  @"#EFEFEF"
#define KC4C4CC_Color  @"#C4C4CC"
#define KEE1111_Color  @"#EE1111"
#define K42423F_Color  @"#42423F"
#define K212120_Color  @"#212120"
#define KF4E3C5_Color  @"#F4E3C5"
#define KFFB734_Color  @"#FFB734"
#define KFA3A3A_Color  @"#FA3A3A"
#define KBD4BFF_Color  @"#BD4BFF"
#define KFF9234_Color  @"#FF9234"
#define K1E1E1E_Color  @"#1E1E1E"
#define K696565_Color  @"#696565"
#define K8C581E_Color  @"#8C581E"
#define KFFF9F2_Color  @"#FFF9F2"
#define KD0AC86_Color  @"#D0AC86"
#define K7B4411_Color  @"#7B4411"
#define KFFE1C1_Color  @"#FFE1C1"
#define KFFEFDE_Color  @"#FFEFDE"
#define KFFB46F_Color  @"#FFB46F"
#define KFF3B00_Color  @"#FF3B00"
#define K8C68EA_Color  @"#8C68EA"
#define K7E5DD2_Color  @"#7E5DD2"
#define K837CFF_Color  @"#837CFF"
#define KB436FE_Color  @"#B436FE"
#define K4D4D4D_Color  @"#4D4D4D"
#define K21201F_Color  @"#21201F"
#define K222222_Color  @"#222222"
#define K555555_Color  @"#555555"
#define KFF9234_Color  @"#FF9234"
#define KFA3A3A_Color  @"#FA3A3A"
#define K464646_Color  @"#464646"
#define K333333_Color  @"#333333"
#define K4A4A4A_Color  @"#4A4A4A"
#define KFEFEFE_Color  @"#FEFEFE"
#define K454759_Color  @"#454759"
#define KFD8230_Color  @"#FD8230"
#define K241217_Color  @"#241217"


/// 以下为经常使用的说明色
#define K31323E_Color  @"#31323E"  // 深黑
#define K33C3A5_Color  @"#33C3A5"  // 绿色
#define K9A9AA7_Color  @"#9A9AA7"  // 灰色
#define K6A6C7A_Color  @"#6A6C7A"  // 浅灰色
#define KF5F5F5_Color  @"#F5F5F5"  // 深色 分割线(常用)
#define KE2E2E5_Color  @"#E2E2E5"  // 浅 色 分割线(仅限导航条底部使用)



// 常用配置颜色
#define KWhite_Color        KColor(KFFFFFF_Color, 1.0)
#define KBlack_Color        KColor(K000000_Color, 1.0)

// 常用文字颜色
#define KTitle_Color        KColor(K31323E_Color, 1.0) // 标题
#define KGray_Color         KColor(K9A9AA7_Color, 1.0) // 浅色正文
#define KContent_Color      KColor(K2A2C2F_Color, 1.0) // 正常正文颜色（常用）
#define KLightGray_Color    KColor(K6A6C7A_Color, 1.0)
#define KGreen_Color        KColor(K33C3A5_Color, 1.0)

// 图片 高亮态 和 正常态 色值
#define KHight_Color        KColor(KFD8230_Color, 1.0) // 点亮色（黄色253 130 48）: 71x71
#define KNormal_Color       KColor(K9A9AA7_Color, 1.0) // 正常色（灰色154,154,167）: 54x54 (222222)

// 多用来做背景色
#define KLine_Color         KColor(KF5F5F5_Color, 1.0)
#define KLightLine_Color    KColor(KE2E2E5_Color, 1.0)
#define KGroupLine_Color    [UIColor groupTableViewBackgroundColor]




#define KFont(fontSize)                     [UIFont systemFontOfSize:fontSize]
#define KBoldFont(fontSize)                 [UIFont boldSystemFontOfSize:fontSize]
#define KFontWeight(fontSize, fontWeight)   [UIFont systemFontOfSize:fontSize weight:fontWeight]
#define KExtraBoldFont(fontSize)            [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium]



#endif /* Color_h */
