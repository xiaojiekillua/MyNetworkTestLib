//
//  KKViewController.m
//  MyNetworkTestLib
//
//  Created by xiaojiekillua on 10/08/2018.
//  Copyright (c) 2018 xiaojiekillua. All rights reserved.
//

#import "KKViewController.h"
#import <MyNetworkTestLib/KKBaseHttpClient.h>

@interface KKViewController ()

@end

@implementation KKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *url = @"http://58.251.37.197:10165/bss/app/noauth/QueryOfferList";
    NSDictionary *param = @{@"channelType" : @"APP",
                            @"goodsType" : @"DISC",
                            @"mcc" : @"US",
                            @"mvnoCode" : @"GCGROUP",
                            @"partnerCode" : @"UKAPP",
                            @"perPageCount" : @"1000",
                            @"streamNo" : @"UKAPP20180928020014125649",
                            @"terminalType" : @"MIFI",
                            };
    
    [[KKBaseHttpClient sharedClient] postRequestWithURL:url params:param withSuccess:^(KKAFTASK *task, id responseData) {
        
        NSError *error = nil;
        id value = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
        NSLog(@"%@",value);
        
    } failure:^(KKAFTASK *task, NSError *error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
