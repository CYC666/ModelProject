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

@property (strong, nonatomic) ADViewController *adViewController;   // 需要持有一下，不然，代理方达无法执行


@end

@implementation MainViewController

#pragma mark ========================================控制器生命周期========================================



- (void)viewDidLoad {

    [super viewDidLoad];
    
}

#pragma mark ========================================私有方法=============================================

- (void)setShowAD:(BOOL)showAD {

    _showAD = showAD;
    if (_showAD) {
        
        // 显示广告图
        _adViewController = [[ADViewController alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:_adViewController.view];
        
    }

}



#pragma mark ========================================动作响应=============================================

#pragma mark ========================================网络请求=============================================

#pragma mark ========================================代理方法=============================================

#pragma mark ========================================通知================================================

@end
