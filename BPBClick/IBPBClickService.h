//
//  IBPBClickService.h
//
//  Created by BigPolarBear on 13-10-15.
//  Copyright (c) 2013年 bigpolarbear.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IBPBClickService <NSObject>


#pragma mark （必选）第一步：先设置第三方平台的Key
/** 根据AppKey进行初始化 */
-(id<IBPBClickService>)initWithAppKey:(NSString*)appKey;

#pragma mark （可选）第2步：设置渠道
/** 设置渠道名称或代码 */
-(void)setChannelId:(NSString*)channelId;

#pragma mark （必选）第3步：启动统计SDK
-(void)start;


#pragma mark （可选）页面追踪

/** 开始页面追踪 */
-(void)trackPageBegin:(NSString*)pageName;
/** 结束页面追踪 */
-(void)trackPageEnd:(NSString*)pageName;

#pragma mark （可选）自定义事件


/** 发送自定义事件（这里的事件属性通过block传递，防止Key或Value为nil导致的App崩溃）
 
 @param event   事件代码
 @param label   事件标签（TalkingData都支持；友盟在传attributs时，不支持label；）
 @param attributesBlock  事件属性
 */
-(void)event:(NSString*)eventCode label:(NSString*)label attributesBlock:(NSDictionary*(^)(void))attributesBlock;


@end
