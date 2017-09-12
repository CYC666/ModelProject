//
//  ADViewController.m
//  ModelProject
//
//  Created by 曹奕程 on 2017/9/12.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

#import "ADViewController.h"
#import "ADCircleView.h"

#define ViewHeight [UIScreen mainScreen].bounds.size.height // 屏高
#define ViewWidth [UIScreen mainScreen].bounds.size.width   // 屛宽

@interface ADViewController () <ADCircleViewDelegate>

@end

@implementation ADViewController

#pragma mark ========================================控制器生命周期========================================

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 广告图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight)];
    imageView.image = [UIImage imageNamed:@"启动页1"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];

    // 5s倒计时
    ADCircleView *adCircleView = [[ADCircleView alloc] initWithFrame:CGRectMake(ViewWidth - 90, 30, 60, 60) radius:25 size:5];
    adCircleView.delegate = self;
    [self.view addSubview:adCircleView];
    
    // 跳过广告按钮
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeCustom];
    goButton.frame = CGRectMake(ViewWidth - 90, 30, 60, 60);
    [goButton setTitle:@"跳过" forState:UIControlStateNormal];
    [goButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    goButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [goButton addTarget:self action:@selector(goAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goButton];
    
}

#pragma mark ========================================私有方法=============================================

#pragma mark - 跳过广告
- (void)goAction {

    [UIView animateWithDuration:1 animations:^{
        self.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        self.view = nil;
    }];

}

#pragma mark ========================================动作响应=============================================

#pragma mark ========================================网络请求=============================================

#pragma mark ========================================代理方法=============================================

#pragma mark - 5秒倒计时完毕
- (void)timeOver {

    // 显示主页
    [UIView animateWithDuration:1 animations:^{
        self.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        self.view = nil;
    }];

}



#pragma mark ========================================通知================================================






































@end
