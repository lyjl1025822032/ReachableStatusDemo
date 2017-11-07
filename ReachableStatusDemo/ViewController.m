//
//  ViewController.m
//  ReachableStatusDemo
//
//  Created by yao on 2017/11/3.
//  Copyright © 2017年 王智垚. All rights reserved.
//

#import "ViewController.h"
#import "NetworkStatusManager.h"

@interface ViewController ()
@property(nonatomic, strong)NetworkStatusManager *netManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.netManager = [NetworkStatusManager shareInstance];
}

- (IBAction)handleStart:(UIButton *)sender {
    [_netManager startObserveNetworkStatus];
}

- (IBAction)handleStop:(UIButton *)sender {
    [_netManager stopObserveNetworkiStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
