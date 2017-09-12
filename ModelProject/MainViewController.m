//
//  MainViewController.m
//  ModelProject
//
//  Created by 曹奕程 on 2017/9/12.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

#import "MainViewController.h"
#import "ADViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark ========================================控制器生命周期========================================



- (void)viewDidLoad {

    [super viewDidLoad];
    
    ADViewController *adViewController = [[ADViewController alloc] init];
    [[UIApplication sharedApplication].keyWindow addSubview:adViewController.view];
    [self.navigationController addChildViewController:adViewController];
    
}

#pragma mark ========================================私有方法=============================================

#pragma mark ========================================动作响应=============================================

#pragma mark ========================================网络请求=============================================

#pragma mark ========================================代理方法=============================================

#pragma mark ========================================通知================================================

@end
