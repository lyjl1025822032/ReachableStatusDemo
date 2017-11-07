//
//  NetworkStatusManager.m
//  ReachableStatusDemo
//
//  Created by yao on 2017/11/3.
//  Copyright © 2017年 王智垚. All rights reserved.
//

#import "NetworkStatusManager.h"
#import "Reachability.h"

@interface NetworkStatusManager ()
@property (nonatomic) Reachability *reachability;
@end

@implementation NetworkStatusManager
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static NetworkStatusManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[NetworkStatusManager alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)startObserveNetworkStatus {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.reachability = [Reachability reachabilityForInternetConnection];
    [self.reachability startNotifier];
    [self updateInterfaceWithReachability:self.reachability];
}

- (void)reachabilityChanged:(NSNotification*)notifi {
    Reachability *reachability = [notifi object];
    NSParameterAssert([reachability isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:reachability];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability {
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    switch (netStatus) {
        case NotReachable:
            NSLog(@"无网络");
            break;
        case ReachableViaWWAN:
            NSLog(@"移动网络");
            break;
        case ReachableViaWiFi:
            NSLog(@"WiFi");
            break;
    }
}

- (void)stopObserveNetworkiStatus {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    [self.reachability stopNotifier];
}

@end
