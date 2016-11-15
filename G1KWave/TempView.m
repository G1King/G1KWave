//
//  TempView.m
//  G1KWave
//
//  Created by Sobf Leo on 16/11/11.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "TempView.h"

@implementation TempView


-(void)drawRect:(CGRect)rect{
    // // 对路径中的所有点进行二维形变, 该变化立即生效, 且为永久性改变所有点
    // 在添加 贝赛尔曲线时  一定要先滑完线 之后添加 否则立即生效  打不到效果
    CGAffineTransform transform = CGAffineTransformMakeTranslation((self.bounds.size.width-50*5)/2, 100);
    transform = CGAffineTransformScale(transform, 3, 3);
    

#pragma mark - 画一个园
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:15];
    [path1 applyTransform:transform];
    [[UIColor colorWithRed:198/255.0f green:198/255.0f blue:198/255.0f alpha:1.0f] setStroke];
    [path1 stroke];
    
#pragma mark -- 以 矩形路径 话一个 方块
    UIBezierPath * path2 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path2 applyTransform:transform];
    [[UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1.0f] setFill];
    [path2 fill];

  #pragma mark -- 三个短线
    UIBezierPath *path10 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path10 applyTransform:transform];
    [[UIColor colorWithRed:189/255.0f green:189/255.0f blue:189/255.0f alpha:1.0f] setStroke];
    [path10 stroke];

    UIBezierPath *path11 = [UIBezierPath bezierPath];
    [path11 moveToPoint:CGPointMake(28, 10)];
    [path11 addLineToPoint:CGPointMake(43, 10)];
    [path11 applyTransform:transform];
    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path11 stroke];
    
    UIBezierPath * path12 = [UIBezierPath bezierPath];
    [path12 moveToPoint:CGPointMake(28, 16)];
    [path12 addLineToPoint:CGPointMake(43, 16)];
    [path12 applyTransform:transform];
    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path12 stroke];
    
    UIBezierPath * path13 = [UIBezierPath bezierPath];
    [path13 moveToPoint:CGPointMake(28, 22)];
    [path13 addLineToPoint:CGPointMake(43, 22)];
    [path13 applyTransform:transform];
     [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path13 stroke];
    
#pragma mark -- 三个长线
    UIBezierPath * path14 = [UIBezierPath bezierPath];
    [path14 moveToPoint:CGPointMake(7, 28)];
    [path14 addLineToPoint:CGPointMake(43, 28)];
    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path14 applyTransform:transform];
    [path14 stroke];
    
    UIBezierPath * path15 = [UIBezierPath bezierPath];
    [path15 moveToPoint:CGPointMake(7, 34)];
    [path15 addLineToPoint:CGPointMake(43, 34)];
    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path15 applyTransform:transform];
    [path15 stroke];
    
    UIBezierPath * path16 = [UIBezierPath bezierPath];
    [path16 moveToPoint:CGPointMake(7, 40)];
    [path16 addLineToPoint:CGPointMake(43, 40)];
    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path16 applyTransform:transform];
    [path16 stroke];
    
   

}
@end
