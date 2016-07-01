//
//  MHAsiNetworkItem.h
//  MHProject
//
//  Created by MengHuan on 15/4/23.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHAsiNetworkDefine.h"

/**
 *  网络请求子项
 */
@interface MHAsiNetworkItem : NSObject

/**
 *  网络请求方式
 */
@property (nonatomic, assign) MHAsiNetWorkType networkType;

/**
 *  网络请求URL
 */
@property (nonatomic, strong) NSString *url;

/**
 *  网络请求参数
 */
@property (nonatomic, strong) NSDictionary *params;

/**
 *  是否显示HUD
 */
@property (nonatomic, assign) BOOL showHUD;
/**
 *  是否显示HUD
 */
@property (nonatomic, assign) BOOL isCommit;

#pragma mark - 创建一个网络请求项，开始请求网络
/**
 *  创建一个网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
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
                      failureBlock:(MHAsiFailureBlock)failureBlock;


@end
