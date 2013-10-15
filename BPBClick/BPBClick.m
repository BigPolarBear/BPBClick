//
//  BPBClick.m
//
//  Created by BigPolarBear on 13-10-15.
//  Copyright (c) 2013年 bigpolarbear.com. All rights reserved.
//

#import "BPBClick.h"

#pragma mark 导入统计平台头文件
#import "TalkingData.h"
#import "MobClick.h"


@interface BPBClick()

/** 渠道代码 */
@property (nonatomic,copy) NSString* channelId;
@property (nonatomic,strong) NSMutableArray* listService;


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

-(NSMutableArray*)listService
{
    if (!_listService) {
        _listService = [[NSMutableArray alloc] initWithCapacity:0];
    }

    return _listService;
}

#pragma mark （必选）第1步：添加支持的统计平台（可添加多个）
+(void)addClickService:(id<IBPBClickService>)service
{
    if ([[self sharedInstance].listService indexOfObject:service] == NSNotFound) {
        [[self sharedInstance].listService addObject:service];
    }
}


#pragma mark （可选）第2步：设置渠道
+(void)setChannelId:(NSString*)channelId
{
    [self sharedInstance].channelId = channelId;
}

#pragma mark （必选）第3步：启动统计SDK
+(void)start
{
    [[self sharedInstance].listService enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id<IBPBClickService> service = obj;
        [service setChannelId:[self sharedInstance].channelId];
        [service start];
    }];
}


#pragma mark （可选）页面追踪
+(void)trackPageBegin:(NSString*)pageName
{
    [[self sharedInstance].listService enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id<IBPBClickService> service = obj;
        [service trackPageBegin:pageName];
    }];
}

+(void)trackPageEnd:(NSString*)pageName
{
    [[self sharedInstance].listService enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id<IBPBClickService> service = obj;
        [service trackPageEnd:pageName];
    }];
}

#pragma mark （可选）自定义事件
+(void)event:(NSString*)eventCode
       label:(NSString*)label
  attributes:(NSDictionary*(^)(void))attributesBlock
{

    [[self sharedInstance].listService enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id<IBPBClickService> service = obj;
        [service event:eventCode label:label attributes:attributesBlock];
    }];
}

@end
