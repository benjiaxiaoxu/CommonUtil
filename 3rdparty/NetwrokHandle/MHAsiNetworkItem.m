//
//  MHAsiNetworkItem.m
//  MHProject
//
//  Created by MengHuan on 15/4/23.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "MHAsiNetworkItem.h"
#import "AFNetworking.h"
#import "MBProgressHUD+Add.h"
#import "MHAsiNetworkDefine.h"
#import "GTMBase64.h"
#import "SendObject.h"
static int kHourlyDuration = 1700;
@interface MHAsiNetworkItem ()

@end

@implementation MHAsiNetworkItem


#pragma mark - 创建一个网络请求项，开始请求网络
/**
 *  创建一个网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return MHAsiNetworkItem对象
 */
- (MHAsiNetworkItem *)initWithtype:(MHAsiNetWorkType)networkType
                               url:(NSString *)url
                            params:(NSDictionary *)params
                           showHUD:(BOOL)showHUD
                          isCommit:(BOOL)isCommit
                      successBlock:(MHAsiSuccessBlock)successBlock
                      failureBlock:(MHAsiFailureBlock)failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url         = url;
        self.params      = params;
        self.showHUD     = showHUD;
        self.isCommit    = isCommit;
        if (showHUD == YES)
        {
            
            [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication]delegate]window]
                                 animated:YES];
        }
        DTLog(@"--请求url地址--%@\n", url);
        DTLog(@"----请求参数%@\n", params);
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"application/xml", nil];
        
        if (networkType == MHAsiNetWorkGET)
        {
            [manager GET:url
              parameters:params
                 success:^(NSURLSessionDataTask *_Nonnull task, id responseObject) {
                     [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication]delegate]window]
                                          animated:YES];
                     DTLog(@"\n\n----请求的返回结果 %@\n", responseObject);
                     if (successBlock)
                     {
                         successBlock(responseObject);
                     }
                     
                 }
                 failure:^(NSURLSessionDataTask *_Nonnull task, NSError *_Nonnull error) {
                     [MBProgressHUD hideHUDForView:nil
                                          animated:YES];
                     
                     DTLog(@"--错误==%@\n", error.localizedDescription);
                     if (failureBlock)
                     {
                         failureBlock(error);
                     }
                 }];
        }
        else
        {
            [self postWithManger:manager url:url parameters:params successBlock:successBlock failureBlock:failureBlock isCommit:isCommit];
        }
    }
    return self;
}


-(void)postWithManger:(AFHTTPSessionManager *)manager url:(NSString *)url parameters:(id)params successBlock:(MHAsiSuccessBlock)successBlock
         failureBlock:(MHAsiFailureBlock)failureBlock isCommit:(BOOL)isCommit;
{
    
    [manager POST:url parameters:[ToolObject getSecSend:params] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication]delegate]window]
                             animated:YES];
        
        NSString *data = [responseObject objectForKey:kResDataKey];
        NSString * key = [[NSString alloc]initWithData:[GTMBase64 decodeString:data] encoding:NSUTF8StringEncoding];
        DTLog(@"---jsonStr----%@",key);
        if (key)
        {
            NSMutableDictionary *responseObjectDecrypt = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            NSDictionary *jsonDic = [self dictionaryWithJsonString:key];
            if (jsonDic == nil)
            {
                jsonDic = [NSDictionary dictionaryWithObjectsAndKeys:@"请求异常，请重试", @"message", nil];
            }
            [responseObjectDecrypt setObject:jsonDic forKey:kResDataKey];
            if (successBlock)
            {
                DTLog(@"---返回内容----%@",responseObjectDecrypt);
                successBlock(responseObjectDecrypt);
            }
        }
        else
        {
            
            if (successBlock)
            {
                successBlock(responseObject);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil)
    {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if (err)
    {
        NSLog(@"json解析失败：%@", err);
        return nil;
    }
    return dic;
}


- (void)dealloc
{
}

@end
