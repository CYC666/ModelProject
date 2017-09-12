//
//  ADCircleView.m
//  ModelProject
//
//  Created by 曹奕程 on 2017/9/12.
//  Copyright © 2017年 曹奕程. All rights reserved.
//

#import "ADCircleView.h"

@implementation ADCircleView


- (instancetype)initWithFrame:(CGRect)frame radius:(CGFloat)radius size:(CGFloat)size {

    if (self = [super initWithFrame:frame]) {
        
        _radius = radius;
        _size = size;
        _timerOver = 0.0f;
        
        self.backgroundColor = [UIColor clearColor];
        
        [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        
    }
    return self;

}

- (void)drawRect:(CGRect)rect {
    
    
    // 获取上下文（画布）
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条宽度
    CGContextSetLineWidth(context, _size);
    // 设置线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    // 设置圆心
    CGPoint centerPoint = {self.frame.size.width * 0.5, self.frame.size.width * 0.5};
    // 设置半径
    CGFloat radius = _radius;
    // 设置起始角度
    CGFloat startAngle = - M_PI_2;
    // 设置结束角度
    CGFloat endAngle = M_PI * 2 * _timerOver / 5 - M_PI_2;
    // 设置绘制方向：1为顺时针， 0为逆时针
    int clockwise = 1;
    
    // 绘制弧线
    // 第1个参数：上下文
    // 第2个参数：圆心.x
    // 第3个参数：圆心.y
    // 第4个参数：半径
    // 第5个参数：起始角度
    // 第6个参数：结束角度
    // 第7个参数：旋转方向
    CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, startAngle, endAngle, clockwise);
    CGContextStrokePath(context);
    
    
}


#pragma mark - 定时器方法
- (void)timerAction:(NSTimer *)timer {

    _timerOver += 0.01;
    
    if (_timerOver >= 5.0) {
        
        // 销毁定时器
        [timer invalidate];
        timer = nil;
        
        if ([_delegate respondsToSelector:@selector(timeOver)]) {
            [_delegate timeOver];
        }
        
        return;
    }
    
    [self setNeedsDisplay];

}




































@end
