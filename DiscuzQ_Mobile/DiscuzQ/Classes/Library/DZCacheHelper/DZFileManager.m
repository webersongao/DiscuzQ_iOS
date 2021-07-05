//
//  DZFileManager.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 16/9/24.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZFileManager.h"
#import "DZCacheHelper.h"

NSString *const KDocumentPath = @"DSKS_Doc";
#define checkLocalPathTwoStr(X)        [NSString stringWithFormat:@"%@/%@",X,self.siteSchema]

@interface DZFileManager ()

@property (nonatomic ,strong) dispatch_queue_t fileQueue;

@property (nonatomic ,copy)NSString *siteSchema;   /// 站点标记
@property (nonatomic ,copy ) NSString *dz_TmpPath;  /// 沙盒tmp的文件目录
@property (nonatomic ,copy ) NSString *DZQKitPath;  /// Library/Caches/DSKSKit路径
@property (nonatomic ,copy ) NSString *dz_HomePath; /// 沙盒Home的文件目录
@property (nonatomic ,copy ) NSString *dz_CachesPath;  /// 沙盒Library/Caches的文件目录
@property (nonatomic ,copy ) NSString *dz_LibraryPath;  /// 沙盒Library的文件目录
@property (nonatomic ,copy ) NSString *dz_DocumentPath;  /// 沙盒Document的文件目录

@property (nonatomic ,copy ) NSString *client_DocumentPath;  /// Document 目录(不随域名变化而变化)
@property (nonatomic ,copy ) NSString *client_CachesPath;  /// Library/Caches 目录(不随域名变化而变化)

@end

@implementation DZFileManager

+ (instancetype)Shared {
    static DZFileManager *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[DZFileManager alloc] init];
        helper.fileQueue = dispatch_queue_create("com.dispatch.DZFileManager", DISPATCH_QUEUE_SERIAL);
    });
    return helper;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.siteSchema = [KURLString(DZQ_BASEURL).host stringByReplacingOccurrencesOfString:@"." withString:@"_"];
        self.siteSchema = self.siteSchema.length ? self.siteSchema : @"DZQ_Client";
        self.dz_HomePath = checkLocalPathTwoStr(NSHomeDirectory());
        self.dz_TmpPath = checkLocalPathTwoStr(NSTemporaryDirectory());
        self.dz_DocumentPath = checkLocalPathTwoStr([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]);
        self.client_DocumentPath = checkTwoStr([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject], checkTwoStr(@"/", KDocumentPath));
        self.dz_LibraryPath = checkLocalPathTwoStr([NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject]);
        self.dz_CachesPath = checkLocalPathTwoStr([NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]);
        self.client_CachesPath = checkTwoStr([NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject], checkTwoStr(@"/", KDocumentPath));
        self.DZQKitPath = [self.dz_CachesPath stringByAppendingPathComponent:@"DZQKitPath"];
    }
    return self;
}

#pragma mark - 创建存储文件夹

- (NSString *)dz_CreateFolderAtPath:(NSString *)path{
    path = [path stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:NULL];
    } else {
        // KSLog(@"FileDir is exists.%@",path);
    }
    return path;
}

/**
 * 写入plist 文件Cache
 @ dataDic NSDictionary  存储的数据
 @ fileName  NSString  文件名
 */
- (BOOL)writeCachePlist:(id)dataDic fileName:(NSString*)fileName{
    
    NSString *plistPath = [self cachePathName:[NSString stringWithFormat:@"%@.plist",fileName]];
    
    return [self writeToLocalFile:dataDic andPath:plistPath];
}
/**
 * 读取Cache plist 文件
 @ fileName  NSString  文件名
 */
- (NSArray *)readCachePlist:(NSString*)fileName{
    
    NSString *filenamePath = [self cachePathName:[NSString stringWithFormat:@"%@.plist",fileName]];
    NSData * data1 = [NSData dataWithContentsOfFile:filenamePath];
    NSArray *data= [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    
    return [data isKindOfClass:[NSArray class]] ? data : nil;
}


/**
 * 写入plist 文件Document
 @ dataDic NSDictionary  存储的数据
 @ fileName  NSString  文件名
 */
- (BOOL)writeDocumentPlist:(id)dataDic fileName:(NSString *)fileName {
    NSString *plistPath = [self docPathName:[NSString stringWithFormat:@"%@.plist",fileName]];
    return [self writeToLocalFile:dataDic andPath:plistPath];
}
/**
 * 读取Document plist 文件
 @ fileName  NSString  文件名
 */
- (NSArray *)readDocumentPlist:(NSString *)fileName {
    NSString *plistPath = [self docPathName:[NSString stringWithFormat:@"%@.plist",fileName]];
    NSData * data1 = [NSData dataWithContentsOfFile:plistPath];
    NSArray * data = [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    
    return [data isKindOfClass:[NSArray class]] ? data : nil;
}


/// 写入Document plist 文件 (不随域名变化)
- (BOOL)write_ClientDocument:(nonnull id)dataDic fileName:(nonnull NSString *)fileName{
    NSString *plistPath = [self client_documentPathName:[NSString stringWithFormat:@"%@.plist",fileName]];
    return [self writeToLocalFile:dataDic andPath:plistPath];
}

/// 读取Document plist 文件
- (NSArray *)read_ClinetDocument:(nonnull NSString *)fileName{
    NSString *plistPath = [self client_documentPathName:[NSString stringWithFormat:@"%@.plist",fileName]];
    NSData * data1 = [NSData dataWithContentsOfFile:plistPath];
    NSArray * data = [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    
    return [data isKindOfClass:[NSArray class]] ? data : nil;
}



/**
 * 写入文件共有方法
 */
- (BOOL)writeToLocalFile:(id)dataObj andPath:(NSString *)path{
    NSMutableArray *dataArray = [[NSMutableArray alloc] initWithCapacity:1];
    if (![dataObj isKindOfClass:[NSArray class]]) {
        if (dataObj) {
            [dataArray addObject:dataObj];
        }else{ return NO;}
    }else{
        [dataArray addObjectsFromArray:dataObj];
    }
    path = [path stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *contentDic = [NSDictionary dictionaryWithContentsOfFile:path];
    if (!contentDic) {
        [fm createFileAtPath:path contents:nil attributes:nil];
    }
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dataArray];
    BOOL success = [data writeToFile:path atomically:YES];
    return success;
}

/**
 *  删除文件
 */
- (BOOL)deleteLocalFile:(NSString *_Nullable)filePath{
    NSError *err = nil;
    
    if (nil == filePath) {
        return NO;
    }
    
    NSFileManager *appFileManager = [NSFileManager defaultManager];
    
    if (![appFileManager fileExistsAtPath:filePath]) {
        return YES;
    }
    
    if (![appFileManager isDeletableFileAtPath:filePath]) {
        return NO;
    }
    
    return [appFileManager removeItemAtPath:filePath error:&err];
}



+(BOOL)isTimeOutWithPath:(NSString *)path timeOut:(NSTimeInterval)time{
    
    NSDictionary *info = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    
    NSDate *current = [info objectForKey:NSFileModificationDate];
    
    NSDate *date = [NSDate date];
    
    NSTimeInterval currentTime = [date timeIntervalSinceDate:current];
    
    return (currentTime>time);
}



/// 返回Cache 目录
- (NSString *)cachePathName:(NSString*)fileName{
    NSString *filename = [[DZFileManager Shared].dz_CachesPath stringByAppendingPathComponent:fileName];
    return filename;
}

/// 返回Cache 目录 (不随域名)
- (NSString *)client_cachePathName:(NSString*)fileName{
    NSString *filename = [[DZFileManager Shared].client_CachesPath stringByAppendingPathComponent:fileName];
    return filename;
}

///  返回Document 目录
- (NSString *)docPathName:(NSString*)fileName{
    NSString *docPath = [DZFileManager Shared].dz_DocumentPath;
    NSString *filename = [docPath stringByAppendingPathComponent:fileName];
    return filename;
}

///  返回Document 目录 (不随域名)
- (NSString *)client_documentPathName:(NSString*)fileName{
    NSString *docPath = [DZFileManager Shared].client_DocumentPath;
    NSString *filename = [docPath stringByAppendingPathComponent:fileName];
    return filename;
}


- (void)manageCacheBackThread:(void(^)(void))backThread afterMainThread:(void(^)(void))mainThread {
    KBack_ThreadBlock(^{
        backThread();
        KMain_ThreadBlock(^{
            mainThread();
        });
    });
}


-(void)clearAllBaseUrlCacheFile:(backBoolBlock)completion{
    
    
    
    dispatch_async(self.fileQueue, ^{
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completion) {
                completion(YES);
            }
        });
    });
}

@end
