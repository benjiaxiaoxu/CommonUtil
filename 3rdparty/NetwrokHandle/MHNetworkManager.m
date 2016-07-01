//
//  MHNetworkManager.m
//  MHProject
//
//  Created by yons on 15/9/22.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "MHNetworkManager.h"
#import "MHAsiNetworkHandler.h"
#import "MHUploadParam.h"
#import "MBProgressHUD+Add.h"
@implementation MHNetworkManager
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static MHNetworkManager *_manager;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:zone];
    });
    return _manager;
}

/// 返回单例
+ (instancetype)sharedInstance
{
    return [[super alloc] init];
}

#pragma mark - GET 请求的三种回调方法

/**
 *   GET请求的公共方法 一下三种方法都调用这个方法 根据传入的不同参数觉得回调的方式
 *
 *   @param url           ur
 *   @param paramsDict   paramsDict
 *   @param target       target
 *   @param action       action
 *   @param delegate     delegate
 *   @param successBlock successBlock
 *   @param failureBlock failureBlock
 *   @param showHUD      showHUD
 */
+ (void)getRequstWithURL:(NSString *)url
                  params:(NSDictionary *)params
            successBlock:(MHAsiSuccessBlock)successBlock
            failureBlock:(MHAsiFailureBlock)failureBlock
                 showHUD:(BOOL)showHUD
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:params];
    [[MHAsiNetworkHandler sharedInstance] conURL:url
                                     networkType:MHAsiNetWorkGET
                                          params:mutableDict
                                         showHUD:showHUD
                                        isCommit:NO
                                    successBlock:successBlock
                                    failureBlock:failureBlock];
}



/**
 *   通过 Block回调结果是否包含token
 *
 *   @param url           url
 *   @param paramsDict    请求的参数字典
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param showHUD       是否加载进度指示器
 *   @param isCommit      是否是提交请求
 */
+ (void)postReqeustWithURL:(NSString *)url
                    params:(NSDictionary *)params
              successBlock:(MHAsiSuccessBlock)successBlock
              failureBlock:(MHAsiFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD
                  isCommit:(BOOL)isCommit
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:params];
    [[MHAsiNetworkHandler sharedInstance] conURL:url
                                     networkType:MHAsiNetWorkPOST
                                          params:mutableDict
                                         showHUD:showHUD
                                        isCommit:isCommit
                                    successBlock:successBlock
                                    failureBlock:failureBlock];

}

/**
 *   通过 Block回调结果
 *
 *   @param url           url
 *   @param paramsDict    请求的参数字典
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param showHUD       是否加载进度指示器
 */
+ (void)postReqeustWithURL:(NSString *)url
                    params:(NSDictionary *)params
              successBlock:(MHAsiSuccessBlock)successBlock
              failureBlock:(MHAsiFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD
{
    if (params == nil)
    {
        params = [NSDictionary dictionary];
    }
    [self postReqeustWithURL:url
                      params:params
                successBlock:successBlock
                failureBlock:failureBlock
                     showHUD:showHUD
                    isCommit:NO];
}

/**
 *  上传文件
 *
 *  @param url          上传文件的 url 地址
 *  @param paramsDict   参数字典
 *  @param successBlock 成功
 *  @param failureBlock 失败
 *  @param showHUD      显示 HUD
 */
+ (void)uploadFileWithURL:(NSString *)url
                   params:(NSDictionary *)paramsDict
             successBlock:(MHAsiSuccessBlock)successBlock
             failureBlock:(MHAsiFailureBlock)failureBlock
              uploadParam:(MHUploadParam *)uploadParam
                  showHUD:(BOOL)showHUD
{
    if (showHUD)
    {
        [MBProgressHUD showHUDAddedTo:nil animated:YES];
    }
    DTLog(@"上传图片接口 URL-> %@", url);
    DTLog(@"上传图片的参数-> %@", paramsDict);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    [manager POST:url
                    parameters:paramsDict
     constructingBodyWithBlock:^(id < AFMultipartFormData > _Nonnull formData) {
        [formData appendPartWithFileData:uploadParam.data
                                    name:uploadParam.name
                                fileName:uploadParam.fileName
                                mimeType:uploadParam.mimeType];
    }
                       success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [MBProgressHUD hideHUDForView:nil animated:YES];

        DTLog(@"----> %@", responseObject);
        if (successBlock)
        {
            successBlock(responseObject);
        }
    }
                       failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [MBProgressHUD hideAllHUDsForView:nil animated:YES];
        DTLog(@"----> %@", error.domain);
        if (error)
        {
            failureBlock(error);
        }
    }];
}

/**
 *  上传文件
 *
 *  @param url          上传文件的 url 地址
 *  @param paramsDict   参数字典
 *  @param successBlock 成功
 *  @param failureBlock 失败
 *  @param showHUD      显示 HUD
 */
+ (void)uploadFileWithURL:(NSString *)url
                   params:(NSDictionary *)paramsDict
             successBlock:(MHAsiSuccessBlock)successBlock
             failureBlock:(MHAsiFailureBlock)failureBlock
             uploadParams:(NSArray *)uploadParams
                  showHUD:(BOOL)showHUD
{
    if (showHUD)
    {
        [MBProgressHUD showHUDAddedTo:nil animated:YES];
    }
    DTLog(@"上传图片接口 URL-> %@", url);
    DTLog(@"上传图片的参数-> %@", paramsDict);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    [manager POST:url
                    parameters:paramsDict
     constructingBodyWithBlock:^(id < AFMultipartFormData > _Nonnull formData) {
        for (MHUploadParam *uploadParam in uploadParams)
        {
            [formData appendPartWithFileData:uploadParam.data
                                        name:uploadParam.name
                                    fileName:uploadParam.fileName
                                    mimeType:uploadParam.mimeType];
        }
    }
                       success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        [MBProgressHUD hideHUDForView:nil animated:YES];

        DTLog(@"----> %@", responseObject);
        if (successBlock)
        {
            successBlock(responseObject);
        }
    }
                       failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        [MBProgressHUD hideAllHUDsForView:nil animated:YES];

        DTLog(@"----> %@", error.domain);
        if (error)
        {
            failureBlock(error);
        }
    }];
}

// 执行下载文件的方法,可以监控下载进度
+ (void)downLoadMonitor:(NSString *)url
           successBlock:(MHAsiSuccessBlock)successBlock
           failureBlock:(MHAsiFailureBlock)failureBlock
{
    // 1.创建网络管理者
    // AFHTTPSessionManager 基于NSURLSession
    AFHTTPSessionManager *manager     = [AFHTTPSessionManager manager];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"TuneStore iOS 1.0"}];

    //设置我们的缓存大小 其中内存缓存大小设置10M  磁盘缓存5M
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                      diskCapacity:50 * 1024 * 1024
                                                          diskPath:nil];

    [config setURLCache:cache];

    // 2.利用网络管理者下载数据
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    /*
       destination
       - targetPath: 系统给我们自动写入的文件路径
       - block的返回值, 要求返回一个URL, 返回的这个URL就是剪切的位置的路径
       completionHandler
       - url :destination返回的URL == block的返回的路径
     */
    /*
       @property int64_t totalUnitCount;  需要下载文件的总大小
       @property int64_t completedUnitCount; 当前已经下载的大小
     */
//    NSProgress *progress = nil;
    NSURLSessionDownloadTask *downTask = [manager downloadTaskWithRequest:request
                                                                 progress:nil
                                                              destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:path];
    }
                                                        completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"%@", filePath.path);
        NSDictionary *dic = [NSDictionary dictionaryWithObject:filePath.path
                                                        forKey:@"path"];
        successBlock(dic);
    }];
//
//    /*
//     要跟踪进度，需要使用 NSProgress，是在 iOS 7.0 推出的，专门用来跟踪进度的类！
//     NSProgress只是一个对象！如何跟踪进度！-> KVO 对属性变化的监听！
//     @property int64_t totalUnitCount;        总单位数
//     @property int64_t completedUnitCount;    完成单位数
//     */
//    // 给Progress添加监听 KVO
//    [progress addObserver:self forKeyPath:@"completedUnitCount" options:NSKeyValueObservingOptionNew context:nil];

    // 3.启动任务
    [downTask resume];
}

// 收到通知调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(NSProgress *)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%f", 1.0 * object.completedUnitCount / object.totalUnitCount);
    // 回到主队列刷新UI
    dispatch_async(dispatch_get_main_queue(), ^{
//        self.progress.progress = 1.0 * object.completedUnitCount / object.totalUnitCount;
    });
}

@end
