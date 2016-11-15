//
//  SoundRecord.m
//  G1KWave
//
//  Created by Sobf Leo on 16/11/11.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "SoundRecord.h"

@interface SoundRecord ()

/**
 录音路径
 */
@property (nonatomic,copy) NSString * path;
@property (nonatomic,strong) AVAudioRecorder * recoder;
@property (nonatomic,strong) MBProgressHUD * progressHUD;
@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic,strong) UIImageView * imageViewAnimation;
@property (nonatomic,strong) UIImageView * timeShortImageView;
@property (nonatomic,strong) UIImageView * talkPhoneImageView;
@property (nonatomic,strong) UIImageView * cancelTalkImageView;
@property (nonatomic,strong) UILabel * textLable;
@property (nonatomic,strong) UILabel * countDownLabel;
@end


@implementation SoundRecord
X_SINGLETON_DEF(SoundRecord);

-(void)startRecordView:(UIView *)recordView saveFilePath:(NSString *)path{
    self.path = path;
    [self startRecord];
    
}

#pragma mark - 开始录音
-(void)startRecord{
    AVAudioSession * session = [AVAudioSession sharedInstance];
    NSError * error;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    if(error)return;
    int32_t t;
   
    AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof(t), &t);
    [session setActive:YES error:nil];
    
    
}




-(NSString*)filePath{
    return self.path;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    static SoundRecord *instance;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}
@end
