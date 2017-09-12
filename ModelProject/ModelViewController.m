//
//  ModelViewController.m
//  ModelProject
//
//  Created by 曹奕程 on 2017/9/12.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

#import "ModelViewController.h"
#import "MainViewController.h"
#import "BusinessViewController.h"
#import "OrderViewController.h"
#import "PersonalViewController.h"


#define Public_Color [UIColor redColor] // 主体颜色
#define Text_Color [UIColor grayColor]  // 字体颜色

#define ViewHeight [UIScreen mainScreen].bounds.size.height // 屏高
#define ViewWidth [UIScreen mainScreen].bounds.size.width   // 屛宽

@interface ModelViewController () {

    // 标题
    NSString *_title;
    
    // 导航栏按钮类型
    ModelViewControllerNavType _navType;
    
    // 标签栏按钮位置
    NSInteger _index;

}

@end

@implementation ModelViewController

#pragma mark ========================================控制器生命周期========================================

#pragma mark - 初始化方法
- (instancetype)initWithTitle:(NSString *)title navType:(ModelViewControllerNavType)type tabIndex:(NSInteger)index {

    if (self = [super init]) {
        
        _title = title;
        _navType = type;
        _index = index;
        
    }
    
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UI
    [self creatSubViewAction];
    
    // 设置UI
    [self setSubViewAction];
    
}


#pragma mark ========================================私有方法=============================================

#pragma mark - 创建UI
- (void)creatSubViewAction {
    
    // =============状态栏==============
    _statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth, 20)];
    _statusView.backgroundColor = Public_Color;
    [self.view addSubview:_statusView];
    
    // =============导航栏==============
    // 导航栏背景
    _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, ViewWidth, 44)];
    _navView.backgroundColor = Public_Color;
    [self.view addSubview:_navView];
    
    // 左边的返回按钮
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(5, 0, 44, 44);
    [_backButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_backButton];
    
    // 右边的右按钮
    _rightRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightRightButton.frame = CGRectMake(ViewWidth - 44 - 5, 0, 44, 44);
    [_rightRightButton setImage:[UIImage imageNamed:@"分类"] forState:UIControlStateNormal];
    [_rightLeftButton addTarget:self action:@selector(rightLeftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_rightRightButton];
    
    // 右边的左按钮
    _rightLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightLeftButton.frame = CGRectMake(ViewWidth - 44 - 5 - 44 - 5, 0, 44, 44);
    [_rightLeftButton setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    [_rightRightButton addTarget:self action:@selector(rightRightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_navView addSubview:_rightLeftButton];
    
    // 标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, ViewWidth - 100 - 100, 44)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:17];
    [_navView addSubview:_titleLabel];
    
    // =============标签栏==============
    // 标签栏的背景
    _tabView = [[UIView alloc] initWithFrame:CGRectMake(0, ViewHeight - 49, ViewWidth, 49)];
    _tabView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabView];
    
    // 标签栏的背景图片
    _tabImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth, 49)];
    _tabImageView.image = [UIImage imageNamed:@"背景图"];
    [_tabView addSubview:_tabImageView];
    
    // 宽度
    CGFloat width = ViewWidth * 0.25;
    
    // -------第一个------
    // 背景视图
    _firstTabView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 49)];
    _firstTabView.backgroundColor = [UIColor clearColor];
    [_tabView addSubview:_firstTabView];
    
    // 图片
    _firstTabImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 35)];
    _firstTabImageView.contentMode = UIViewContentModeCenter;
    [_firstTabView addSubview:_firstTabImageView];
    
    // 标题
    _firstTabLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, width, 14)];
    _firstTabLabel.textAlignment = NSTextAlignmentCenter;
    _firstTabLabel.adjustsFontSizeToFitWidth = YES;
    _firstTabLabel.text = @"首页";
    _firstTabLabel.font = [UIFont systemFontOfSize:10];
    [_firstTabView addSubview:_firstTabLabel];
    
    // 按钮
    _firstTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _firstTabButton.frame = CGRectMake(0, 0, width, 49);
    [_firstTabButton addTarget:self action:@selector(firstTabButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_firstTabView addSubview:_firstTabButton];
    
    // -------第二个-------
    // 背景视图
    _secondTabView = [[UIView alloc] initWithFrame:CGRectMake(width, 0, width, 49)];
    _secondTabView.backgroundColor = [UIColor clearColor];
    [_tabView addSubview:_secondTabView];
    
    // 图片
    _secondTabImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 35)];
    _secondTabImageView.contentMode = UIViewContentModeCenter;
    [_secondTabView addSubview:_secondTabImageView];
    
    // 标题
    _secondTabLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, width, 14)];
    _secondTabLabel.textAlignment = NSTextAlignmentCenter;
    _secondTabLabel.adjustsFontSizeToFitWidth = YES;
    _secondTabLabel.text = @"投资";
    _secondTabLabel.font = [UIFont systemFontOfSize:10];
    [_secondTabView addSubview:_secondTabLabel];
    
    // 按钮
    _secondTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _secondTabButton.frame = CGRectMake(0, 0, width, 49);
    [_secondTabButton addTarget:self action:@selector(secondTabButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_secondTabView addSubview:_secondTabButton];
    
    // -------第三个-------
    // 背景视图
    _thirdTabView = [[UIView alloc] initWithFrame:CGRectMake(width*2, 0, width, 49)];
    _thirdTabView.backgroundColor = [UIColor clearColor];
    [_tabView addSubview:_thirdTabView];
    
    // 图片
    _thirdTabImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 35)];
    _thirdTabImageView.contentMode = UIViewContentModeCenter;
    [_thirdTabView addSubview:_thirdTabImageView];
    
    // 标题
    _thirdTabLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, width, 14)];
    _thirdTabLabel.textAlignment = NSTextAlignmentCenter;
    _thirdTabLabel.adjustsFontSizeToFitWidth = YES;
    _thirdTabLabel.text = @"债权";
    _thirdTabLabel.font = [UIFont systemFontOfSize:10];
    [_thirdTabView addSubview:_thirdTabLabel];
    
    // 按钮
    _thirdTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _thirdTabButton.frame = CGRectMake(0, 0, width, 49);
    [_thirdTabButton addTarget:self action:@selector(thirdTabButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_thirdTabView addSubview:_thirdTabButton];
    
    // -------第四个-------
    // 背景视图
    _fourTabView = [[UIView alloc] initWithFrame:CGRectMake(width*3, 0, width, 49)];
    _fourTabView.backgroundColor = [UIColor clearColor];
    [_tabView addSubview:_fourTabView];
    
    // 图片
    _fourTabImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 35)];
    _fourTabImageView.contentMode = UIViewContentModeCenter;
    [_fourTabView addSubview:_fourTabImageView];
    
    // 标题
    _fourTabLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, width, 14)];
    _fourTabLabel.textAlignment = NSTextAlignmentCenter;
    _fourTabLabel.adjustsFontSizeToFitWidth = YES;
    _fourTabLabel.text = @"登录";
    _fourTabLabel.font = [UIFont systemFontOfSize:10];
    [_fourTabView addSubview:_fourTabLabel];
    
    // 按钮
    _fourTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _fourTabButton.frame = CGRectMake(0, 0, width, 49);
    [_fourTabButton addTarget:self action:@selector(fourTabButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_fourTabView addSubview:_fourTabButton];
    
    
    // =============主视图==============
    _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ViewWidth, ViewHeight - 64 - 49)];
    _mainView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainView];
    
    
}

#pragma mark - 设置UI
- (void)setSubViewAction {
    
    // 标题
    _titleLabel.text = _title;
    
    // 导航栏按钮
    if (_navType == NavTypeOnlyLeft) {
        _backButton.hidden = NO;
        _rightLeftButton.hidden = YES;
        _rightRightButton.hidden = YES;
    } else if (_navType == NavTypeOnlyRightOne) {
        _backButton.hidden = YES;
        _rightLeftButton.hidden = YES;
        _rightRightButton.hidden = NO;
    } else if (_navType == NavTypeOnlyRightTwo) {
        _backButton.hidden = YES;
        _rightLeftButton.hidden = NO;
        _rightRightButton.hidden = NO;
    } else if (_navType == NavTypeLeftAndRightOne) {
        _backButton.hidden = YES;
        _rightLeftButton.hidden = YES;
        _rightRightButton.hidden = NO;
    } else {
        _backButton.hidden = NO;
        _rightLeftButton.hidden = NO;
        _rightRightButton.hidden = NO;
    }
    
    // 标签栏
    if (_index == 1) {
        _firstTabLabel.textColor = Text_Color;
        _firstTabImageView.image = [UIImage imageNamed:@"第一个"];
        _secondTabLabel.textColor = Public_Color;
        _secondTabImageView.image = [UIImage imageNamed:@"第二个选中"];
        _thirdTabLabel.textColor = Text_Color;
        _thirdTabImageView.image = [UIImage imageNamed:@"第三个"];
        _fourTabLabel.textColor = Text_Color;
        _fourTabImageView.image = [UIImage imageNamed:@"第四个"];
    } else if (_index == 2) {
        _firstTabLabel.textColor = Text_Color;
        _firstTabImageView.image = [UIImage imageNamed:@"第一个"];
        _secondTabLabel.textColor = Text_Color;
        _secondTabImageView.image = [UIImage imageNamed:@"第二个"];
        _thirdTabLabel.textColor = Public_Color;
        _thirdTabImageView.image = [UIImage imageNamed:@"第三个选中"];
        _fourTabLabel.textColor = Text_Color;
        _fourTabImageView.image = [UIImage imageNamed:@"第四个"];
    } else if (_index == 3) {
        _firstTabLabel.textColor = Text_Color;
        _firstTabImageView.image = [UIImage imageNamed:@"第一个"];
        _secondTabLabel.textColor = Text_Color;
        _secondTabImageView.image = [UIImage imageNamed:@"第二个"];
        _thirdTabLabel.textColor = Text_Color;
        _thirdTabImageView.image = [UIImage imageNamed:@"第三个"];
        _fourTabLabel.textColor = Public_Color;
        _fourTabImageView.image = [UIImage imageNamed:@"第四个选中"];
    } else {
        _firstTabLabel.textColor = Public_Color;
        _firstTabImageView.image = [UIImage imageNamed:@"第一个选中"];
        _secondTabLabel.textColor = Text_Color;
        _secondTabImageView.image = [UIImage imageNamed:@"第二个"];
        _thirdTabLabel.textColor = Text_Color;
        _thirdTabImageView.image = [UIImage imageNamed:@"第三个"];
        _fourTabLabel.textColor = Text_Color;
        _fourTabImageView.image = [UIImage imageNamed:@"第四个"];
    }
    
}


#pragma mark ========================================动作响应=============================================

#pragma mark - 返回
- (void)backButtonAction {
    
    if ([_delegate respondsToSelector:@selector(didSelectBackButton)]) {
        [_delegate didSelectBackButton];
    }
    
}

#pragma mark - 分类
- (void)rightRightButtonAction {
    
    if ([_delegate respondsToSelector:@selector(didSelectSearchButton)]) {
        [_delegate didSelectSearchButton];
    }
    
}

#pragma mark - 搜索
- (void)rightLeftButtonAction {
    
    if ([_delegate respondsToSelector:@selector(didSelectEnumButton)]) {
        [_delegate didSelectEnumButton];
    }
    
}

#pragma mark - 第一个标签按钮
- (void)firstTabButtonAction {

    if ([_delegate respondsToSelector:@selector(didSelectIndex:)]) {
        [_delegate didSelectIndex:0];
    }
    
    MainViewController *viewController = [[MainViewController alloc] initWithTitle:@"首页" navType:NavTypeOnlyRightOne tabIndex:0];
    [self.navigationController pushViewController:viewController animated:YES];
    

}


#pragma mark - 第二个标签按钮
- (void)secondTabButtonAction {
    
    if ([_delegate respondsToSelector:@selector(didSelectIndex:)]) {
        [_delegate didSelectIndex:1];
    }
    
    BusinessViewController *viewController = [[BusinessViewController alloc] initWithTitle:@"投资" navType:NavTypeOnlyRightOne tabIndex:1];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

#pragma mark - 第三个标签按钮
- (void)thirdTabButtonAction {
    
    if ([_delegate respondsToSelector:@selector(didSelectIndex:)]) {
        [_delegate didSelectIndex:2];
    }
    OrderViewController *viewController = [[OrderViewController alloc] initWithTitle:@"债权" navType:NavTypeOnlyRightTwo tabIndex:2];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - 第四个标签按钮
- (void)fourTabButtonAction {
    
    if ([_delegate respondsToSelector:@selector(didSelectIndex:)]) {
        [_delegate didSelectIndex:3];
    }
    
    PersonalViewController *viewController = [[PersonalViewController alloc] initWithTitle:@"登录" navType:NavTypeOnlyRightOne tabIndex:3];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark ========================================网络请求=============================================

#pragma mark ========================================代理方法=============================================

#pragma mark ========================================通知================================================






































@end
