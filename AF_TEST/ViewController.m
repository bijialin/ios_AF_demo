//
//  ViewController.m
//  AF_TEST
//
//  Created by wzfc-001 on 2019/9/23.
//  Copyright © 2019 nickbi. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //init AFNetWorking
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    [manger.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [manger.requestSerializer setValue:@"3d22372d-ced4-4351-8d9e-887e8fb7d420" forHTTPHeaderField:@"token"];
    //request url
    NSString *url = @"http://localhost:30011/goods/getPendantList.action";
    // conditions dic to json
    NSDictionary *conditions = @{@"1": @[@1, @2, @3]};
    NSData *data = [NSJSONSerialization dataWithJSONObject:conditions options:NSJSONWritingPrettyPrinted error:nil];
    NSString *conditionsStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //build request params
    NSDictionary *parameters = @{@"page": @1, @"rows": @10, @"conditions": conditionsStr};
    //do post request
    [manger POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        NSLog(@"success");
    }    failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        NSLog(@"fail");
    }];


}


@end
