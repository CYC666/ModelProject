//
//  GuideViewController.h
//  ModelProject
//
//  Created by 曹奕程 on 2017/9/12.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

// 引导页

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController

// 滑动视图
@property (strong, nonatomic) UIScrollView *mainScrollView;

// 注册按钮
@property (strong, nonatomic) UIButton *registerButton;

// 登录按钮
@property (strong, nonatomic) UIButton *loginButton;


@end
