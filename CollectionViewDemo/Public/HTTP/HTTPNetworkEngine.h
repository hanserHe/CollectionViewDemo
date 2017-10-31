//
//  HTTPNetworkEngine.h
//  CollectionViewDemo
//
//  Created by Hanser on 31/10/2017.
//  Copyright © 2017 Mr.H. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HSSuccessBlock)(NSDictionary *data);
typedef void(^HSFailureBlock)(NSError *error);

@interface HTTPNetworkEngine : NSObject

+ (HTTPNetworkEngine *)shareInstantce;

- (void)postWithUrl:(NSString *)url
          postParam:(NSDictionary *)postParam
            success:(HSSuccessBlock)success
            failure:(HSFailureBlock)failure;
@end
