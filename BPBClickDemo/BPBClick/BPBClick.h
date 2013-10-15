//
//  BPBClick.h
//  BPBClickDemo
//
//  Created by BigPolarBear on 13-10-15.
//  Copyright (c) 2013年 bigpolarbear.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBPBClick.h"

/** 统一调用接口类 */
@interface BPBClick : NSObject<IBPBClick>


#pragma mark （必选）第一步：先设置第三方平台的Key
/** [设置友盟统计平台](http://www.umeng.com) */
+(void)connectUmengWithAppKey:(NSString*)appKey;
/** [设置TalkingData统计平台](https://analytics.talkingdata.net/) */
+(void)connectTalkingDataWithAppKey:(NSString*)appKey;


@end
