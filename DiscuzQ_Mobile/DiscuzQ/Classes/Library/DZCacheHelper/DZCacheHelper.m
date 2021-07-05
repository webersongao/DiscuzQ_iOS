//
//  DZCacheHelper.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2018/2/3.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "DZCacheHelper.h"
#import <CommonCrypto/CommonDigest.h>

NSString *const defaultAppPath = @"DSKS_Cache";
static const NSInteger defaultCacheMaxCacheAge  = 60*60*24*7;  // 默认缓存时间为7天
static const CGFloat unit = 1000.0;
static const NSInteger timeOut = 60*60;

@interface DZCacheHelper ()
@property (nonatomic ,copy)NSString *kitCachePath;
@property (nonatomic ,strong) dispatch_queue_t fileOpQueue;

@end

@implementation DZCacheHelper

+ (DZCacheHelper *)Shared{
    static DZCacheHelper *cacheInstance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cacheInstance = [[DZCacheHelper alloc] init];
    });
    return cacheInstance;
}

- (id)init{
    self = [super init];
    if (self) {
        self.fileOpQueue = dispatch_queue_create("com.dispatch.DZCacheHelper", DISPATCH_QUEUE_SERIAL);
        [self config_initCachesfileWithName:defaultAppPath];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(automaticCleanCache) name:UIApplicationWillTerminateNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(backgroundCleanCache) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    return self;
}


- (void)config_initCachesfileWithName:(NSString *)name{
    self.kitCachePath = [[DZFileManager Shared].dz_CachesPath stringByAppendingPathComponent:name];
    [[DZFileManager Shared] dz_CreateFolderAtPath:self.kitCachePath];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}

#pragma mark - 获取沙盒目录

- (NSString *)localAppCachePath{
    return self.kitCachePath;
}

- (CGFloat)filePathSize {
    
    NSString *path = [DZFileManager Shared].dz_CachesPath;
    NSArray *chileFile = [[NSFileManager defaultManager] subpathsAtPath:path];
    float folderSize = 0;
    for (NSString *chile in chileFile) {
        NSString *chilePath = [path stringByAppendingPathComponent:chile];
        folderSize += [self fileSiezeAtPath:chilePath];
    }
    if (folderSize <= 0.013) {
        folderSize = 0.00;
    }
    return folderSize;
}

- (float)fileSiezeAtPath:(NSString *)filePath {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        long long fileSize = [[[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil] fileSize];
        return fileSize / 1024.0 / 1024.0;
    }
    return 0;
}


- (BOOL)diskCacheExistsWithKey:(NSString *)key{
    return [self diskCacheExistsWithKey:key path:self.kitCachePath];
}

- (BOOL)diskCacheExistsWithKey:(NSString *)key path:(NSString *)path{
    
    NSString *codingPath = [[self cachePathForKey:key path:path] stringByDeletingPathExtension];
    BOOL exists = NO;
    if ([[NSFileManager defaultManager] fileExistsAtPath:codingPath] && ![DZFileManager isTimeOutWithPath:codingPath timeOut:timeOut]) {
        exists = YES;
    }
    return exists;
}

#pragma  mark - 存储
- (void)storeContent:(NSObject *)content forKey:(NSString *)key isSuccess:(DZCacheIsSuccessBlock)isSuccess{
    [self storeContent:content forKey:key path:self.kitCachePath isSuccess:isSuccess];
}

- (void)storeContent:(NSObject *)content forKey:(NSString *)key path:(NSString *)path isSuccess:(DZCacheIsSuccessBlock)isSuccess{
    dispatch_async(self.fileOpQueue,^{
        NSString *codingPath =[[self cachePathForKey:key path:path] stringByDeletingPathExtension];
        BOOL result = [self setContent:content writeToFile:codingPath];
        if (isSuccess) {
            dispatch_async(dispatch_get_main_queue(), ^{
                isSuccess(result);
            });
        }
    });
}

- (BOOL)setContent:(NSObject *)content writeToFile:(NSString *)path{
    if (!content||!path){
        return NO;
    }
    if ([content isKindOfClass:[NSMutableArray class]]) {
        return  [(NSMutableArray *)content writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[NSArray class]]) {
        return [(NSArray *)content writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[NSMutableData class]]) {
        return [(NSMutableData *)content writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[NSData class]]) {
        return  [(NSData *)content writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[NSMutableDictionary class]]) {
        [(NSMutableDictionary *)content writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[NSDictionary class]]) {
        return  [(NSDictionary *)content writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[NSJSONSerialization class]]) {
        return [(NSDictionary *)content writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[NSMutableString class]]) {
        return  [[((NSString *)content) dataUsingEncoding:NSUTF8StringEncoding] writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[NSString class]]) {
        return [[((NSString *)content) dataUsingEncoding:NSUTF8StringEncoding] writeToFile:path atomically:YES];
    }else if ([content isKindOfClass:[UIImage class]]) {
        return [UIImageJPEGRepresentation((UIImage *)content,(CGFloat)0.9) writeToFile:path atomically:YES];
    }else if ([content conformsToProtocol:@protocol(NSCoding)]) {
        return [NSKeyedArchiver archiveRootObject:content toFile:path];
    }else {
        [NSException raise:@"非法的文件内容" format:@"文件类型%@异常。", NSStringFromClass([content class])];
        return NO;
    }
    return NO;
}

#pragma  mark - 获取存储数据
- (void)getCacheDataForKey:(NSString *)key value:(DZCacheValueBlock)value{
    
    [self getCacheDataForKey:key path:self.kitCachePath value:value];
}

- (void)getCacheDataForKey:(NSString *)key path:(NSString *)path value:(DZCacheValueBlock)value{
    if (!key)return;
    
    // 读取放队列里面去就太慢了,给拿出来了。
    NSString *filePath=[[self cachePathForKey:key path:path]stringByDeletingPathExtension];
    NSData *diskdata= [NSData dataWithContentsOfFile:filePath];
    if (value) {
        value(diskdata,filePath);
    }
    /*
     dispatch_async(self.fileOpQueue,^{
     @autoreleasepool {
     NSString *filePath=[[self cachePathForKey:key path:path]stringByDeletingPathExtension];
     NSData *diskdata= [NSData dataWithContentsOfFile:filePath];
     if (value) {
     dispatch_async(dispatch_get_main_queue(), ^{
     value(diskdata,filePath);
     });
     }
     }
     }); */
}

- (NSArray *)getDiskCacheFileWithPath:(NSString *)path{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    dispatch_sync(self.fileOpQueue, ^{
        
        NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
        for (NSString *fileName in fileEnumerator){
            if (fileName.length==32) {
                NSString *filePath = [path stringByAppendingPathComponent:fileName];
                [array addObject:filePath];
            }
        }
    });
    return array;
}

-(NSDictionary* )getDiskFileAttributes:(NSString *)key path:(NSString *)path{
    
    NSString *filePath=[[self cachePathForKey:key path:path]stringByDeletingPathExtension];
    
    NSDictionary *info = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    return info;
}

#pragma mark -  编码
- (NSString *)diskCachePathForKey:(NSString *)key{
    
    NSString *path=[self cachePathForKey:key path:self.kitCachePath];
    return path;
}

- (NSString *)cachePathForKey:(NSString *)key path:(NSString *)path {
    NSString *filename = [self MD5StringForKey:key];
    return [path stringByAppendingPathComponent:filename];
}

- (NSString *)MD5StringForKey:(NSString *)key {
    const char *str = [key UTF8String];
    if (str == NULL) {
        str = "";
    }
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%@",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10],
                          r[11], r[12], r[13], r[14], r[15], [[key pathExtension] isEqualToString:@""] ? @"" : [NSString stringWithFormat:@".%@", [key pathExtension]]];
    return filename;
}

#pragma  mark - 计算大小与个数
- (NSUInteger)getCacheSize {
    return [self getFileSizeWithpath:self.kitCachePath];
}

- (NSUInteger)getCacheCount {
    return [self getFileCountWithpath:self.kitCachePath];
}

- (NSUInteger)getFileSizeWithpath:(NSString *)path{
    __block NSUInteger size = 0;
    //sync
    dispatch_sync(self.fileOpQueue, ^{
        NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
        for (NSString *fileName in fileEnumerator) {
            NSString *filePath = [path stringByAppendingPathComponent:fileName];
            
            NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
            size += [attrs fileSize];
        }
    });
    
    return size;
}

- (NSUInteger)getFileCountWithpath:(NSString *)path{
    __block NSUInteger count = 0;
    //sync
    dispatch_sync(self.fileOpQueue, ^{
        NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
        count = [[fileEnumerator allObjects] count];
    });
    return count;
}

- (NSString *)fileUnitWithSize:(float)size{
    if (size >= unit * unit * unit) { // >= 1GB
        return [NSString stringWithFormat:@"%.2fGB", size / unit / unit / unit];
    } else if (size >= unit * unit) { // >= 1MB
        return [NSString stringWithFormat:@"%.2fMB", size / unit / unit];
    } else { // >= 1KB
        return [NSString stringWithFormat:@"%.2fKB", size / unit];
    }
}

- (NSUInteger)diskSystemSpace{
    
    __block NSUInteger size = 0.0;
    dispatch_sync(self.fileOpQueue, ^{
        NSError *error=nil;
        NSDictionary *dic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[[DZFileManager Shared] dz_HomePath] error:&error];
        if (error) {
            KSLog(@"error: %@", error.localizedDescription);
        }else{
            NSNumber *systemNumber = [dic objectForKey:NSFileSystemSize];
            size = [systemNumber floatValue];
        }
    });
    return size;
    
}

- (NSUInteger)diskFreeSystemSpace{
    
    __block NSUInteger size = 0.0;
    dispatch_sync(self.fileOpQueue, ^{
        NSError *error=nil;
        NSDictionary *dic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[[DZFileManager Shared] dz_HomePath] error:&error];
        if (error) {
            KSLog(@"error: %@", error.localizedDescription);
        }else{
            NSNumber *freeSystemNumber = [dic objectForKey:NSFileSystemFreeSize];
            size = [freeSystemNumber floatValue];
        }
    });
    return size;
}

#pragma  mark - 设置过期时间 清除某路径缓存文件
- (void)automaticCleanCache{
    [self clearCacheWithTime:defaultCacheMaxCacheAge completion:nil];
}

- (void)clearCacheWithTime:(NSTimeInterval)time completion:(DZCacheCompletedBlock)completion{
    [self clearCacheWithTime:time path:self.kitCachePath completion:completion];
}

- (void)clearCacheWithTime:(NSTimeInterval)time path:(NSString *)path completion:(DZCacheCompletedBlock)completion{
    if (!time||!path)return;
    dispatch_async(self.fileOpQueue,^{
        // “-” time
        NSDate *expirationDate = [NSDate dateWithTimeIntervalSinceNow:-time];
        
        NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
        
        for (NSString *fileName in fileEnumerator){
            NSString *filePath = [path stringByAppendingPathComponent:fileName];
            
            NSDictionary *info = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
            NSDate *current = [info objectForKey:NSFileModificationDate];
            
            if ([[current laterDate:expirationDate] isEqualToDate:expirationDate]){
                [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
            }
        }
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion();
            });
        }
    });
}

- (void)backgroundCleanCacheWithPath:(NSString *)path{
    Class UIApplicationClass = NSClassFromString(@"UIApplication");
    if(!UIApplicationClass || ![UIApplicationClass respondsToSelector:@selector(sharedApplication)]) {
        return;
    }
    UIApplication *application = [UIApplication performSelector:@selector(sharedApplication)];
    __block UIBackgroundTaskIdentifier bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
        // Clean up any unfinished task business by marking where you
        // stopped or ending the task outright.
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
    // Start the long-running task and return immediately.
    [self clearCacheWithTime:defaultCacheMaxCacheAge path:path completion:^{
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
}

- (void)backgroundCleanCache {
    [self backgroundCleanCacheWithPath:self.kitCachePath];
}

#pragma  mark - 清除单个缓存文件
- (void)clearCacheForkey:(NSString *)key{
    
    [self clearCacheForkey:key completion:nil];
}

- (void)clearCacheForkey:(NSString *)key completion:(DZCacheCompletedBlock)completion{
    
    [self clearCacheForkey:key path:self.kitCachePath completion:completion];
}

- (void)clearCacheForkey:(NSString *)key path:(NSString *)path completion:(DZCacheCompletedBlock)completion{
    if (!key||!path)return;
    dispatch_async(self.fileOpQueue,^{
        
        NSString *filePath=[[self cachePathForKey:key path:path]stringByDeletingPathExtension];
        
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
        
        if (completion) {
            dispatch_async(dispatch_get_main_queue(),^{
                completion();
            });
        }
    });
}
#pragma  mark - 设置过期时间 清除单个缓存文件
- (void)clearCacheForkey:(NSString *)key time:(NSTimeInterval)time{
    [self clearCacheForkey:key time:time completion:nil];
}

- (void)clearCacheForkey:(NSString *)key time:(NSTimeInterval)time completion:(DZCacheCompletedBlock)completion{
    [self clearCacheForkey:key time:time path:self.kitCachePath completion:completion];
}

- (void)clearCacheForkey:(NSString *)key time:(NSTimeInterval)time path:(NSString *)path completion:(DZCacheCompletedBlock)completion{
    if (!time||!key||!path)return;
    dispatch_async(self.fileOpQueue,^{
        // “-” time
        NSDate *expirationDate = [NSDate dateWithTimeIntervalSinceNow:-time];
        
        NSString *filePath = [[self cachePathForKey:key path:path]stringByDeletingPathExtension];
        
        NSDictionary *info = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        NSDate *current = [info objectForKey:NSFileModificationDate];
        
        if ([[current laterDate:expirationDate] isEqualToDate:expirationDate]){
            [[NSFileManager defaultManager]removeItemAtPath:filePath error:nil];
        }
        
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion();
            });
        }
    });
}
#pragma  mark - 清除默认路径缓存
- (void)clearCache{
    [self clearCacheOnCompletion:nil];
}

- (void)clearCacheOnCompletion:(DZCacheCompletedBlock)completion{
    
    dispatch_async(self.fileOpQueue, ^{
        //[self clearDiskWithpath:self.kitCachePath];
        [[NSFileManager defaultManager] removeItemAtPath:self.kitCachePath error:nil];
        [[DZFileManager Shared] dz_CreateFolderAtPath:self.kitCachePath];
        if (completion) {
            dispatch_async(dispatch_get_main_queue(),^{
                completion();
            });
        }
    });
}
#pragma  mark - 清除自定义路径缓存
- (void)clearDiskWithpath:(NSString *)path{
    [self clearDiskWithpath:path completion:nil];
}

- (void)clearDiskWithpath:(NSString *)path completion:(DZCacheCompletedBlock)completion{
    if (!path)return;
    dispatch_async(self.fileOpQueue, ^{
        
        NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:path];
        for (NSString *fileName in fileEnumerator)
        {
            NSString *filePath = [path stringByAppendingPathComponent:fileName];
            
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        }
        if (completion) {
            dispatch_async(dispatch_get_main_queue(),^{
                completion();
            });
        }
    });
}


@end
