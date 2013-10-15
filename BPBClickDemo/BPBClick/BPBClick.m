//
//  BPBClick.m
//  BPBClickDemo
//
//  Created by BigPolarBear on 13-10-15.
//  Copyright (c) 2013年 bigpolarbear.com. All rights reserved.
//

#import "BPBClick.h"

#pragma mark 导入统计平台头文件
#import "TalkingData.h"
#import "MobClick.h"



@interface BPBClick()

/** 单例 */
+(BPBClick*)sharedInstance;

/** 渠道代码 */
@property (nonatomic,copy) NSString* channelId;
/** 统计平台Key存储：友盟 */
@property (nonatomic,copy) NSString* appKeyUmeng;
/** 统计平台Key存储：TalkingData */
@property (nonatomic,copy) NSString* appKeyTalkingData;

@end

@implementation BPBClick

+(BPBClick*)sharedInstance
{
    static BPBClick* _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[BPBClick alloc] init];
        
    });
    
    return _sharedInstance;
}



#pragma mark （必选）第1步：先设置第三方平台的Key
+(void)connectUmengWithAppKey:(NSString*)appKey
{
    [self sharedInstance].appKeyUmeng = appKey;
}
+(void)connectTalkingDataWithAppKey:(NSString*)appKey
{
    [self sharedInstance].appKeyTalkingData = appKey;
}

#pragma mark （可选）第2步：设置渠道
+(void)setChannelId:(NSString*)channelId
{
    [self sharedInstance].channelId = channelId;
}

#pragma mark （必选）第3步：启动统计SDK
+(void)start
{
    // 启动友盟
    [MobClick startWithAppkey:[self sharedInstance].appKeyUmeng
                 reportPolicy:REALTIME
                    channelId:[self sharedInstance].channelId];
    
    // 启动TalkingData
    [TalkingData sessionStarted:[self sharedInstance].appKeyTalkingData
                  withChannelId:[self sharedInstance].channelId];
}


#pragma mark （可选）页面追踪
+(void)trackPageBegin:(NSString*)pageName
{
    // 友盟
    [MobClick beginLogPageView:pageName];
    
    // TalkingData
    [TalkingData trackPageBegin:pageName];
}

+(void)trackPageEnd:(NSString*)pageName
{
    // 友盟
    [MobClick endLogPageView:pageName];
    
    // TalkingData
    [TalkingData trackPageEnd:pageName];
}

#pragma mark （可选）自定义事件
+(void)event:(NSString*)eventCode
       label:(NSString*)label
  attributes:(NSDictionary*(^)(void))attributesBlock
{
    NSDictionary* dict = nil;
    if (attributesBlock) {
        dict = attributesBlock();
    }
    
    // 友盟
    if (dict) {
        [MobClick event:eventCode attributes:dict];
    }else if(label){
        [MobClick event:eventCode label:label];
    }else{
        [MobClick event:eventCode];
    }
    
    // TalkingData
    [TalkingData trackEvent:eventCode label:label parameters:dict];
}

#pragma mark 内部使用的方法

@end
