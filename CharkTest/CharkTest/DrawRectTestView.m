//
//  DrawRectTestView.m
//  CharkTest
//
//  Created by CharkZhang on 16/5/20.
//  Copyright © 2016年 Chark. All rights reserved.
//

#import "DrawRectTestView.h"

@implementation DrawRectTestView

#if 1
// 画一条线
- (void)drawRect:(CGRect)rect{
    CGContextRef ref = UIGraphicsGetCurrentContext(); // 拿到当前画板，在这个画板上画就是在视图上画
    CGContextBeginPath(ref); // 开始绘画
    CGContextSetLineWidth(ref, 3);
    CGContextMoveToPoint(ref, 0, 0); // 画线
    CGContextAddLineToPoint(ref, rect.size.width, 0); // 画线
    CGContextAddLineToPoint(ref, rect.size.width, rect.size.height); // 画线
//    CGContextAddLineToPoint(ref, 0, rect.size.height); // 画线
//    CGContextAddLineToPoint(ref, 0, 0); // 画线
//    CGFloat redColor[4] = {1.0, 0, 0, 1.0};
//    CGContextSetStrokeColor(ref, redColor);
    // 设置当前画笔的颜色，这两句可以用[[UIColor whiteColor] setStroke]代替;
    [[UIColor redColor] setStroke];
    
    //填充了一段路径:
    CGContextSetFillColorWithColor(ref, [UIColor cyanColor].CGColor);
    CGContextFillPath(ref);

    CGContextStrokePath(ref); // 对移动的路径画线
    
    //绘制贝兹曲线
    /**
     CGContextSetLineWidth(ref, 2);
     [[UIColor greenColor] setStroke];
     CGContextMoveToPoint(ref, 10, 10);
     //贝兹曲线是通过移动一个起始点，然后通过两个控制点,还有一个中止点，调用CGContextAddCurveToPoint()函数绘制
     CGContextAddCurveToPoint(ref, 50, 300, 100, 400, 190,rect.size.height - 30);
     CGContextAddCurveToPoint(ref, 200, 50, 300, 40, 90,rect.size.height - 130);
     //    CGContextAddQuadCurveToPoint(ref, 50, 300, 190, rect.size.height - 30);
     CGContextStrokePath(ref);
     */

    
    //绘制连续的曲线
    /**
     CGContextSetLineWidth(ref,5.0);
     CGFloat dashArray3[] = {3,2, 10, 20,5};
     CGContextSetLineDash(ref, 0, dashArray3, 5);//画虚线
     CGContextSetStrokeColorWithColor(ref, [UIColor greenColor].CGColor);
     CGContextMoveToPoint(ref,5, 400);//开始画线, x，y为开始点的坐标
     CGContextAddCurveToPoint(ref, 50, 200, 80, 300, 100, 220);//画三次点曲线
     CGContextAddQuadCurveToPoint(ref,150, 100,200, 200);//画二次点曲线
     CGContextAddCurveToPoint(ref, 240, 400, 10, 50, 300, 300);//画三次点曲线
     CGContextStrokePath(ref);//开始画线
     */
    
    //画一个方形图形没有边框
    /**
     CGContextSetRGBFillColor(ref,0, 0.25,0, 0.5);//方框的填充色
     //    CGContextFillRect(ref,CGRectMake(5,150, 100,100)); //画一个方框
     CGContextStrokeRect(ref,CGRectMake(5,5, 200,200));//画方形边框,参数2:方形的坐标。
     */
    //画弧线
    CGContextSetRGBStrokeColor(ref,0.3, 0.4,0.5, 1);//线条颜色
    CGContextAddArc(ref, 180, 200, 50, 0, 180*(M_PI/180),0);
    CGContextStrokePath(ref);//开始画线
    
    //画椭圆
    CGRect aRect= CGRectMake(80,80, 160, 100);
    CGContextSetRGBStrokeColor(ref,0.6, 0.9,0, 1.0);
    CGContextSetLineWidth(ref,3.0);
    CGContextAddEllipseInRect(ref, aRect);//椭圆, 参数2:椭圆的坐标。
    CGContextDrawPath(ref,kCGPathStroke);


    //画实心圆
    [[UIColor cyanColor] setStroke];
    CGContextFillEllipseInRect(ref,CGRectMake(95,195, 100.0,100));//画实心圆,参数2:圆坐标。可以是椭圆

    
    
}

//-(CGSize)drawInRect:(CGRect)rect
//           withFont:(UIFont *)font
//      lineBreakMode:(UILineBreakMode)lineBreakMode
//          alignment:(UITextAlignment)alignment{
//    
//    
//}

#endif

#if 0
// 画三角
- (void)drawRect:(CGRect)rect{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ref, 0.5, 0.5, 0.5, 1.0);
    CGContextSetLineWidth(ref, 3.0); // 让线条变粗
    CGPoint points[] = { // 设置四个点画三条线让线连起来
        CGPointMake(100, 100),
        CGPointMake(50, 300),
        CGPointMake(300, 500),
        CGPointMake(100, 100),
    };
    CGContextAddLines(ref, points, sizeof(points) / sizeof(points[0]));
    CGFloat redColor[4] = {1.0, 0, 0, 1.0};
    CGContextSetFillColor(ref, redColor); // 填充颜色，这两句可使用[[UIColor redColor] setFill];
    CGContextDrawPath(ref, kCGPathFillStroke); // 画填充的图案
    
}
#endif


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
