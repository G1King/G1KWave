//
//  SoundRecord.h
//  G1KWave
//
//  Created by Sobf Leo on 16/11/11.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "KvConst.h"
/**
 录音管理器
 */
@interface SoundRecord : NSObject
//单利
X_SINGLETON_DEC(SoundRecord);

/**
 开始录音

 @param recordView 录音展示在哪个view上
 @param path       保存录音的路径
 */
-(void)startRecordView:(UIView*)recordView saveFilePath:(NSString*)path;

/**
 取消录音
 */
-(void)cancelRecord;

/**
 录音路径
 */
@property (nonatomic,copy) NSString * filePath;


@end
