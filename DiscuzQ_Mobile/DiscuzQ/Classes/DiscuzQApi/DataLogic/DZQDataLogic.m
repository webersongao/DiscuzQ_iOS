//
//  DZQDataLogic.m
//  DiscuzQ
//  联系作者：微信： ChinaMasker gao@btbk.org
//  Github ：https://github.com/webersongao/DiscuzQ_iOS
//  Created by WebersonGao on 2020/5/18.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQDataLogic.h"
#import "DZQDataLogic+Convert_V1.h"
#import "DZQDataLogic+Convert_V3.h"

@interface DZQDataLogic ()

@property (nonatomic, strong) dispatch_queue_t dataQueue;  //!< 数据处理Queue
@property (nonatomic, strong) NSFileManager *fileManager;  //!< 属性注释
@end

@implementation DZQDataLogic

- (instancetype)init{
    self = [super init];
    if (self) {
        _Maper = [[DZQMaper alloc] init];
        _fileManager = [NSFileManager defaultManager];
        
        self.dataQueue = dispatch_queue_create([[NSString stringWithFormat:@"ios_sdk_queueManager.%p", self] UTF8String], DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

-(void)updateLogicVersion:(NSInteger)version{
    _version = version;
}
-(DZQResError *)resErrorWithError:(PRError *)oriError {
    DZQResError *resModel = [DZQResError errorBodyWithError:oriError];
    return resModel;
}

- (void)cleanCacheWithBlock:(void (^)(void))completion{
    
    NSString *cachePath = [self localDataPathWithUrl:nil];
    [self.fileManager removeItemAtPath:cachePath error:nil];
    if (completion) { completion(); }
}

-(NSDictionary *)loadResponseDataWithUrl:(NSString *)urlString{
    
    NSString *cachePath = [self localDataPathWithUrl:urlString];
    
    return [NSDictionary dictionaryWithContentsOfFile:cachePath];
    
}

-(void)saveResponseDataWithUrl:(NSString *)urlString response:(NSDictionary *)response{
    if (![response isKindOfClass:[NSDictionary class]]) {
        return;
    }
    NSString *cachePath = [self localDataPathWithUrl:urlString];
    
    [response writeToFile:cachePath atomically:YES];
}


-(void)resModelWithJSON:(id)json urlCtrl:(NSString *)urlCtrl completion:(void (^)(DZQBaseRes *resModel))completion{
    dispatch_async(self.dataQueue, ^{
        DZQBaseRes *resModel = [self revert_innerResConvertWithJSON:json urlCtrl:urlCtrl];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(resModel);
            }
        });
    });
}

-(void)resV3ModelWithJSON:(id)json dataClass:(Class)dataClass completion:(void (^)(DZQBaseRes *resModel))completion{
    dispatch_async(self.dataQueue, ^{
        DZQBaseRes *resModel = [self revert_innerV3ResConvertWithJSON:json dataClass:dataClass];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(resModel);
            }
        });
    });
}

-(NSString *)localDataPathWithUrl:(NSString *)urlString{
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *folderPath = [cachePath stringByAppendingPathComponent:@"SDKLogic/"];
    
    if (![self.fileManager fileExistsAtPath:folderPath]) {
        [self.fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"SDKLogic/%@.plist",[urlString md5String]]];
}





@end
