//
//  G1KWaveView.m
//  G1KWave
//
//  Created by Sobf Leo on 16/11/4.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "G1KWaveView.h"

@interface G1KWaveView ()

@property (nonatomic,strong) CADisplayLink * g1k_DisplayLink;//手机刷新的频率
@property (nonatomic,strong) CAShapeLayer * g1k_Shapelayer;// 波浪线
@property (nonatomic,assign) CGFloat offsetX;// y = a*sin(wx + offsetX) 右移 offsetX 减小
@property (nonatomic,assign) CGFloat sinW;
@property (nonatomic,assign) NSTimeInterval waveTime;
@end

@implementation G1KWaveView
+(instancetype)addView:(UIView *)view rect:(CGRect)frme{
    G1KWaveView * wave = [[G1KWaveView alloc]initWithFrame:frme];
    [view addSubview:wave];
    return wave;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setInit];
    }
    return self;
}
-(void)setInit{
    _waveSpeed = 9.0f;
    _waveTime = 1.5;
    _sinW = 2;
}
-(BOOL)wave{
    if (self.g1k_Shapelayer.path) {
        return NO;
    }
    self.g1k_Shapelayer = [CAShapeLayer layer];
    self.g1k_Shapelayer.fillColor = (self.lineColor == nil ? [UIColor whiteColor] :self.lineColor).CGColor;
    [self.layer addSublayer:self.g1k_Shapelayer];
    self.g1k_DisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(runWave)];
    [self.g1k_DisplayLink addToRunLoop:[NSRunLoop  mainRunLoop] forMode:NSRunLoopCommonModes];
    if (self.waveTime > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.waveTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self stop];
        });
    }
//    NSLog(@"=====>%zd",self.waveTime);
    return  YES;
}
-(void)stop{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self.g1k_DisplayLink invalidate];
        self.g1k_DisplayLink = nil;
        self.g1k_Shapelayer.path = nil;
     
        self.alpha =1;
    }];
}
-(void)runWave{
    self.offsetX -= self.waveSpeed;//减去一个固定值 使其匀速
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat y=0;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, height);
    for (CGFloat i=0; i<width; i++) {
        y = height *(sin(0.01 * ( self.sinW *i+self.offsetX)))-5;
        CGPathAddLineToPoint(path, NULL, i, y);
    }
    CGPathAddLineToPoint(path, nil, width, height);
    CGPathAddLineToPoint(path, nil, 0, height);
    CGPathCloseSubpath(path);
    self.g1k_Shapelayer.path = path;
    
    CGPathRelease(path);
}
@end

