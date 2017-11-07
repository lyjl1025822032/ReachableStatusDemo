//
//  NetworkStatusManager.h
//  ReachableStatusDemo
//
//  Created by yao on 2017/11/3.
//  Copyright © 2017年 王智垚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkStatusManager : NSObject
+ (instancetype)shareInstance;

- (void)startObserveNetworkStatus;

- (void)stopObserveNetworkiStatus;
@end
