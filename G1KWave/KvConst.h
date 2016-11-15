//
//  KvConst.h
//  G1KWave
//
//  Created by Sobf Leo on 16/11/11.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#ifndef KvConst_h
#define KvConst_h
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#undef    X_SINGLETON_DEC
#define X_SINGLETON_DEC( __class ) \
+ (__class *)sharedInstance;

#undef    X_SINGLETON_DEF
#define X_SINGLETON_DEF( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}



#import "MBProgressHUD.h"
#import "PureLayout.h"
#endif /* KvConst_h */
