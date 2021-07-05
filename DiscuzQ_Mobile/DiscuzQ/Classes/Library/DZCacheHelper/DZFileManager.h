//
//  DZFileManager.h
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/9/24.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZFileManager : NSObject

+ (nonnull instancetype)Shared;

@property (nonatomic ,copy ,readonly) NSString *dz_TmpPath;  /// 沙盒tmp的文件目录
@property (nonatomic ,copy ,readonly) NSString *dz_HomePath; /// 沙盒Home的文件目录
@property (nonatomic ,copy ,readonly) NSString *dz_CachesPath;  /// 沙盒Library/Caches的文件目录
@property (nonatomic ,copy ,readonly) NSString *dz_LibraryPath;  /// 沙盒Library的文件目录
@property (nonatomic ,copy ,readonly) NSString *dz_DocumentPath;  /// Document目录
@property (nonatomic ,copy ,readonly) NSString *DZQKitPath;  /// Library/Caches/DSKSKit路径

@property (nonatomic ,copy ,readonly) NSString *client_DocumentPath;  /// Document 目录(不随域名变化而变化)
@property (nonatomic ,copy ,readonly) NSString *client_CachesPath;  /// Library/Caches 目录(不随域名变化而变化)

/**
 创建沙盒文件夹
 */
- (NSString *)dz_CreateFolderAtPath:(NSString *)path;

/**
 * 写入Cache plist 文件
 * dataDic NSDictionary  存储的数据
 * fileName  NSString  文件名
 */
- (BOOL)writeCachePlist:(nonnull id)dataDic fileName:(nonnull NSString*)fileName;

/**
 * 读取Cache plist 文件
 @ fileName  NSString  文件名
 */
- (NSArray *)readCachePlist:(nonnull NSString*)fileName;

/**
 * 写入Document plist 文件
 * dataDic NSDictionary  存储的数据
 * fileName  NSString  文件名
 */
- (BOOL)writeDocumentPlist:(nonnull id)dataDic fileName:(nonnull NSString *)fileName;
/**
 * 读取Document plist 文件
 @ fileName  NSString  文件名
 */
- (NSArray *)readDocumentPlist:(nonnull NSString *)fileName;


/// 写入Document plist 文件 (不随域名变化)
- (BOOL)write_ClientDocument:(nonnull id)dataDic fileName:(nonnull NSString *)fileName;
/// 读取Document plist 文件
- (NSArray *)read_ClinetDocument:(nonnull NSString *)fileName;





- (void)manageCacheBackThread:(void(^_Nullable)(void))backThread afterMainThread:(void(^_Nullable)(void))mainThread;


/**
 *  删除文件
 */
- (BOOL)deleteLocalFile:(NSString *_Nullable)filePath;

/**
*   判断指定路径下的文件，是否超出规定时间的方法
*  @param path 文件路径
*  @param time NSTimeInterval 毫秒
*  @return 是否超时
*/
+(BOOL)isTimeOutWithPath:(NSString *)path timeOut:(NSTimeInterval)time;


-(void)clearAllBaseUrlCacheFile:(backBoolBlock)completion;

@end

NS_ASSUME_NONNULL_END
