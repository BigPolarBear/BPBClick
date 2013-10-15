//
//  BPBClickServiceTalkingData.m
//
//  Created by BigPolarBear on 10/15/13.
//  Copyright (c) 2013 bigpolarbear.com. All rights reserved.
//

#import "BPBClickServiceTalkingData.h"


@interface BPBClickServiceTalkingData()

/** 渠道代码 */
@property (nonatomic,copy) NSString* channelId;
/** 统计平台Key存储*/
@property (nonatomic,copy) NSString* appKey;

@end


@implementation BPBClickServiceTalkingData


#pragma mark （必选）第一步：先设置第三方平台的Key
/** 根据AppKey进行初始化 */
-(id<IBPBClickService>)initWithAppKey:(NSString*)appKey
{
    self = [super init];
    if(self){
        self.appKey = appKey;
    }

    return self;
}

#pragma mark （可选）第2步：设置渠道
-(void)setChannelId:(NSString*)channelId
{
    _channelId = channelId;
}

#pragma mark （必选）第3步：启动统计SDK
-(void)start
{
    [TalkingData sessionStarted:self.appKey withChannelId:self.channelId];
}


#pragma mark （可选）页面追踪
-(void)trackPageBegin:(NSString*)pageName
{
    [TalkingData trackPageBegin:pageName];
}

-(void)trackPageEnd:(NSString*)pageName
{
    [TalkingData trackPageEnd:pageName];
}

#pragma mark （可选）自定义事件
-(void)event:(NSString*)eventCode
       label:(NSString*)label
  attributes:(NSDictionary*(^)(void))attributesBlock
{
    NSDictionary* dict = nil;
    if (attributesBlock) {
        dict = attributesBlock();
    }

    [TalkingData trackEvent:eventCode label:label parameters:dict];
}

@end
