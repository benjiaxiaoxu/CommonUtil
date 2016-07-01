//
//  MHNetworkManager.h
//  MHProject
//
//  Created by yons on 15/9/22.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHAsiNetworkDefine.h"
@class MHUploadParam;
/// 请求管理着
@interface MHNetworkManager : NSObject<NSURLSessionDataDelegate, NSURLSessionDelegate, NSURLSessionTaskDelegate>

/// 返回单例
+ (instancetype)sharedInstance;

#pragma mark - 发送 GET 请求的方法

/**
 *   GET请求通过Block 回调结果
 *
 *   @param url          url
 *   @param paramsDict   paramsDict
 *   @param successBlock  成功的回调
 *   @param failureBlock  失败的回调
 *   @param showHUD      是否加载进度指示器
 */
+ (void)getRequstWithURL:(NSString *)url
                  params:(NSDictionary *)paramsDict
            successBlock:(MHAsiSuccessBlock)successBlock
            failureBlock:(MHAsiFailureBlock)failureBlock
                 showHUD:(BOOL)showHUD;

#pragma mark - 发送 POST 请求的方法
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
                    params:(NSDictionary *)paramsDict
              successBlock:(MHAsiSuccessBlock)successBlock
              failureBlock:(MHAsiFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD
                  isCommit:(BOOL)isCommit;
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
                    params:(NSDictionary *)paramsDict
              successBlock:(MHAsiSuccessBlock)successBlock
              failureBlock:(MHAsiFailureBlock)failureBlock
                   showHUD:(BOOL)showHUD;

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
                  showHUD:(BOOL)showHUD;
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
                  showHUD:(BOOL)showHUD;

+ (void)downLoadMonitor:(NSString *)url
           successBlock:(MHAsiSuccessBlock)successBlock
           failureBlock:(MHAsiFailureBlock)failureBlock;
@end
