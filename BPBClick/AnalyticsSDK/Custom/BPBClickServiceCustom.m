//
//  BPBClickServiceCustom.m
//
//  Created by BigPolarBear on 11/26/13.
//  Copyright (c) 2013 bigpolarbear.com. All rights reserved.
//

#import "BPBClickServiceCustom.h"


@interface BPBClickServiceCustom()

/** 渠道代码 */
@property (nonatomic,copy) NSString* channelId;
/** 统计平台Key存储*/
@property (nonatomic,copy) NSString* appKey;

@end


@implementation BPBClickServiceCustom

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
    // 启动 todo
}


#pragma mark （可选）页面追踪
-(void)trackPageBegin:(NSString*)pageName
{
    // todo
}

-(void)trackPageEnd:(NSString*)pageName
{
    // todo
}

#pragma mark （可选）自定义事件
-(void)event:(NSString*)eventCode label:(NSString*)label attributesBlock:(NSDictionary*(^)(void))attributesBlock
{
    // todo
}

-(void)event:(NSString*)eventCode
{
    [self event:eventCode label:nil attributesBlock:nil];
}

-(void)event:(NSString*)eventCode label:(NSString*)label
{
    [self event:eventCode label:label attributesBlock:nil];
}

@end
