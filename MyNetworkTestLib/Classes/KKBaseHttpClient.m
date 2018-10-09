//
//  KKBaseHttpClient.m
//  UcloudLinkExport_Example
//
//  Created by killua on 2018/10/8.
//  Copyright © 2018年 liwenfeng. All rights reserved.
//

#import "KKBaseHttpClient.h"

@interface KKBaseHttpClient ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation KKBaseHttpClient

+ (instancetype)sharedClient {
    static KKBaseHttpClient *sharedRequestManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedRequestManager = [[KKBaseHttpClient alloc] init];
        sharedRequestManager.manager = [[AFHTTPSessionManager manager] init];
        sharedRequestManager.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        sharedRequestManager.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [sharedRequestManager.manager.requestSerializer setHTTPShouldHandleCookies:YES];
        sharedRequestManager.manager.requestSerializer.timeoutInterval = 15;
        sharedRequestManager.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
        
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        [[AFNetworkActivityIndicatorManager sharedManager] setActivationDelay:0.4f];
        
    });
    return sharedRequestManager;
}

- (void)setHeaders:(NSDictionary *)headers {
    _headers = headers;
    if (headers) {
        for (NSString *key in headers.allKeys) {
            [self.manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
        }
    }
}

- (KKAFTASK *)getRequestWithURL:(NSString *)url params:(NSDictionary *)params withSuccess:(KKHttpClientSuccessBlock)success failure:(KKHttpClientFailureBlock)failure {
    return [self.manager GET:url parameters:params progress:NULL success:success failure:failure];
}

- (KKAFTASK *)postRequestWithURL:(NSString *)url params:(NSDictionary *)params withSuccess:(KKHttpClientSuccessBlock)success failure:(KKHttpClientFailureBlock)failure {
    return [self.manager POST:url parameters:params progress:NULL success:success failure:failure];
}

@end
