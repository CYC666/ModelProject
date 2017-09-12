//
//  GuideViewController.m
//  ModelProject
//
//  Created by 曹奕程 on 2017/9/12.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

#import "GuideViewController.h"
#import "MainViewController.h"
#import "BaseNavigationController.h"

#define ViewHeight [UIScreen mainScreen].bounds.size.height // 屏高
#define ViewWidth [UIScreen mainScreen].bounds.size.width   // 屛宽

@interface GuideViewController ()



@end

@implementation GuideViewController

#pragma mark ========================================控制器生命周期========================================

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 创建子视图
    [self creatSubViewAction];

}


#pragma mark ========================================私有方法=============================================

#pragma mark - 创建UI
- (void)creatSubViewAction {
    
    NSArray *imageArray = @[@"启动页1",
                            @"启动页2",
                            @"启动页3"];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHeight)];
    _mainScrollView.contentSize = CGSizeMake(ViewWidth * imageArray.count, ViewHeight);
    _mainScrollView.pagingEnabled = YES;
    [self.view addSubview:_mainScrollView];
    
    // 添加图片视图
    for (NSInteger i = 0; i < imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ViewWidth * i, 0, ViewWidth, ViewHeight)];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [_mainScrollView addSubview:imageView];
        
        // 最后一张添加手势，前往首页
        if (i == imageArray.count-1) {
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToMainGesture:)];
            [imageView addGestureRecognizer:tap];
        }
        
        
    }
    
    // 注册按钮
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerButton.frame = CGRectMake(0, ViewHeight - 50, ViewWidth * 0.5, 50);
    [_registerButton setTitle:@"注 册" forState:UIControlStateNormal];
    _registerButton.backgroundColor = [UIColor colorWithRed:61/255.0 green:131/255.0 blue:236/255.0 alpha:1];
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(registerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
    // 登录按钮
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(ViewWidth * 0.5, ViewHeight - 50, ViewWidth * 0.5, 50);
    [_loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor colorWithRed:61/255.0 green:131/255.0 blue:255/255.0 alpha:1];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    
}

#pragma mark ========================================动作响应=============================================

#pragma mark - 点击了最后一个图片，前往首页
- (void)goToMainGesture:(UITapGestureRecognizer *)tap {

    MainViewController *viewController = [[MainViewController alloc] initWithTitle:@"首页" navType:NavTypeOnlyRightOne tabIndex:0];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:viewController];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;

}

#pragma mark - 注册
- (void)registerButtonAction:(UIButton *)button {
    
    
    
}

#pragma mark - 登录
- (void)loginButtonAction:(UIButton *)button {
    
    
    
}



#pragma mark ========================================网络请求=============================================

#pragma mark ========================================代理方法=============================================

#pragma mark ========================================通知================================================






































@end
