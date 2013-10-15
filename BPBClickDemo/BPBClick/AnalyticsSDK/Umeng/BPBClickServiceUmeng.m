//
//  BPBClickServiceUmeng.m
//
//  Created by BigPolarBear on 10/15/13.
//  Copyright (c) 2013 bigpolarbear.com. All rights reserved.
//

#import "BPBClickServiceUmeng.h"


@interface BPBClickServiceUmeng()

/** 渠道代码 */
@property (nonatomic,copy) NSString* channelId;
/** 统计平台Key存储*/
@property (nonatomic,copy) NSString* appKey;

@end


@implementation BPBClickServiceUmeng

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
    // 启动友盟
    [MobClick startWithAppkey:self.appKey
                 reportPolicy:REALTIME
                    channelId:self.channelId];
}


#pragma mark （可选）页面追踪
-(void)trackPageBegin:(NSString*)pageName
{
    // 友盟
    [MobClick beginLogPageView:pageName];
}

-(void)trackPageEnd:(NSString*)pageName
{
    // 友盟
    [MobClick endLogPageView:pageName];
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

    // 友盟
    if (dict) {
        [MobClick event:eventCode attributes:dict];
    }else if(label){
        [MobClick event:eventCode label:label];
    }else{
        [MobClick event:eventCode];
    }
}

@end
