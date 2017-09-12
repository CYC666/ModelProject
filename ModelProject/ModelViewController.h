//
//  ModelViewController.h
//  ModelProject
//
//  Created by 曹奕程 on 2017/9/12.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

#import <UIKit/UIKit.h>


// 导航栏按钮的类型
typedef enum : NSUInteger {
    NavTypeOnlyLeft,        // 只有左边
    NavTypeOnlyRightOne,    // 只有右边一个(只有分类)
    NavTypeOnlyRightTwo,    // 只有右边两个(搜索跟分类)
    NavTypeLeftAndRightOne, // 左一个右一个
    NavTypeLeftAndRightTwo, // 左一个右两个
    
} ModelViewControllerNavType;


@protocol ModelViewControllerDelegate <NSObject>

@required
/**
 点击了标签按钮

 @param index 被点击的标签按钮的序号0123
 */
- (void)didSelectIndex:(NSInteger)index;

@optional
/**
 点击了返回按钮
 */
- (void)didSelectBackButton;


/**
 点击了搜索按钮
 */
- (void)didSelectSearchButton;


/**
 点击了分类按钮
 */
- (void)didSelectEnumButton;

@end




@interface ModelViewController : UIViewController

// ============================状态栏============================
@property (strong, nonatomic) UIView *statusView;



// ============================导航栏============================
@property (strong, nonatomic) UIView *navView;
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *rightLeftButton;
@property (strong, nonatomic) UIButton *rightRightButton;



// ============================标签栏============================
@property (strong, nonatomic) UIView *tabView;

// 背景图
@property (strong, nonatomic) UIImageView *tabImageView;

// 第一个
@property (strong, nonatomic) UIView *firstTabView;
@property (strong, nonatomic) UIButton *firstTabButton;
@property (strong, nonatomic) UILabel *firstTabLabel;
@property (strong, nonatomic) UIImageView *firstTabImageView;

// 第二个
@property (strong, nonatomic) UIView *secondTabView;
@property (strong, nonatomic) UIButton *secondTabButton;
@property (strong, nonatomic) UILabel *secondTabLabel;
@property (strong, nonatomic) UIImageView *secondTabImageView;

// 第三个
@property (strong, nonatomic) UIView *thirdTabView;
@property (strong, nonatomic) UIButton *thirdTabButton;
@property (strong, nonatomic) UILabel *thirdTabLabel;
@property (strong, nonatomic) UIImageView *thirdTabImageView;

// 第四个
@property (strong, nonatomic) UIView *fourTabView;
@property (strong, nonatomic) UIButton *fourTabButton;
@property (strong, nonatomic) UILabel *fourTabLabel;
@property (strong, nonatomic) UIImageView *fourTabImageView;


// ============================主页面============================
@property (strong, nonatomic) UIView *mainView;


// ============================属性============================
@property (strong, nonatomic) id<ModelViewControllerDelegate> delegate;

// ============================方法============================
/**
 初始化方法

 @param title 标题
 @param type 导航栏按钮类型
 @param index 选中的标签
 @return self
 */
- (instancetype)initWithTitle:(NSString *)title navType:(ModelViewControllerNavType)type tabIndex:(NSInteger)index;







































@end
