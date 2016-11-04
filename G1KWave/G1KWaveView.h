//
//  G1KWaveView.h
//  G1KWave
//
//  Created by Sobf Leo on 16/11/4.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G1KWaveView : UIView

/**
  波浪线的颜色
 */
@property (nonatomic,strong) UIColor * lineColor;

/**
 滚动的速度
 */
@property (nonatomic,assign) NSInteger waveSpeed;

/**
 是否在滚动

 @return bool yes 滚动 no 暂停
 */
-(BOOL)wave;

/**
 停止滚动
 */
-(void)stop;

/**
 初始化波浪控件

 @param view 添加到哪个视图上
 @param frme 大小 位置

 @return 返回波浪控件的实例
 */
+(instancetype)addView:(UIView *)view rect:(CGRect)frme;
@end
