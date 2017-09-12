//
//  ADCircleView.h
//  ModelProject
//
//  Created by 曹奕程 on 2017/9/12.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ADCircleViewDelegate <NSObject>

@optional
- (void)timeOver;   // 结束了

@end


@interface ADCircleView : UIView



@property (assign, nonatomic) CGFloat timerOver;    // 执行的时间
@property (assign, nonatomic) CGFloat radius;       // 半径
@property (assign, nonatomic) CGFloat size;         // 宽度

@property (weak, nonatomic) id<ADCircleViewDelegate> delegate;

/**
 初始化方法

 @param frame 视图大小
 @param radius 曲线半径
 @param size 曲线宽度
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame radius:(CGFloat)radius size:(CGFloat)size;

@end
