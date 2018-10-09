//
//  KKBaseHttpClient.h
//  UcloudLinkExport_Example
//
//  Created by killua on 2018/10/8.
//  Copyright © 2018年 liwenfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

typedef NSURLSessionDataTask KKAFTASK;

typedef void(^KKHttpClientSuccessBlock)(KKAFTASK *task, id responseData);
typedef void(^KKHttpClientFailureBlock)(KKAFTASK *task, NSError *error);

@interface KKBaseHttpClient : NSObject

@property (nonatomic, strong) NSDictionary *headers;

+ (instancetype)sharedClient;

- (KKAFTASK *)getRequestWithURL:(NSString *)url
                         params:(NSDictionary *) params
                    withSuccess:(KKHttpClientSuccessBlock)success
                        failure:(KKHttpClientFailureBlock)failure;

- (KKAFTASK *)postRequestWithURL:(NSString *)url
                          params:(NSDictionary *)params
                     withSuccess:(KKHttpClientSuccessBlock)success
                         failure:(KKHttpClientFailureBlock)failure;

@end
