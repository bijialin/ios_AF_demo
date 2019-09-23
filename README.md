# ios_AF_demo
AFNetWorking demo project

### build Pod file
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'AFNetworking', '~> 3.0'
end
```

### install
```
pod install
```

### do request
```

    //init AFNetWorking
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    [manger.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    
    //request url
    NSString *url = @"http://localhost/goods.action";
    
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
  ```
