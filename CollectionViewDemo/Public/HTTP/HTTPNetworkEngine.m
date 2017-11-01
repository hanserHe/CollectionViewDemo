//
//  HTTPNetworkEngine.m
//  CollectionViewDemo
//
//  Created by Hanser on 31/10/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import "HTTPNetworkEngine.h"
#import "AFNetworking.h"

static HTTPNetworkEngine *shareInstance = nil;
const NSInteger outTime = 5;
@implementation HTTPNetworkEngine

+ (HTTPNetworkEngine *)shareInstantce {
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (void)postWithUrl:(NSString *)url
          postParam:(NSDictionary *)postParam
            success:(HSSuccessBlock)success
            failure:(HSFailureBlock)failure {
    AFHTTPSessionManager *mananger  = [AFHTTPSessionManager manager];
    /**可接收类型 */
    /**JSON */
    mananger.requestSerializer = [AFJSONRequestSerializer serializer];
    /**Dictionary */
    mananger.responseSerializer = [AFHTTPResponseSerializer serializer];
    mananger.operationQueue.maxConcurrentOperationCount = 10;
    mananger.requestSerializer.timeoutInterval = outTime;
    [mananger POST:url parameters:postParam progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            success(dic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            NSLog(@"网络异常");
        }
    }];
}
@end
