#BPBClick

整合各种第三方统计服务，完成一次调用，自动发送多个统计服务平台的目的（可实现自己的统计服务），目前支持的平台如下：

1. Umeng统计分析
2. TalkingData统计分析

#添加第三方统计服务库
加文件夹AnalyticsSDK添加到工程中（这个文件夹中的每一个子文件夹对应一个统计服务，对于不需要的服务，可以不用添加到工程中）

#添加依赖项
在工程中添加如下依赖项

- Required:	libz.dylib
- Required:	Security.framework

- Optional:	CoreTelephony.framework
- Optional:	AdSupport.framework


#添加代码

在AppDelegate的didFinishLaunchingWithOptions里添加如下代码

```objective-c

	    // 1. 创建需要的统计服务
	    id<IBPBClickService> serviceUmeng = [[BPBClickServiceUmeng alloc] initWithAppKey:@"525d62a956240b4bce01789c"];
	    id<IBPBClickService> serviceTalkingData = [[BPBClickServiceTalkingData alloc] initWithAppKey:@"B083E38FCCA43F368148464F2CEFE91E"];
	
	    // 2. 添加统计服务到BPBClick
	    [BPBClick addClickService:serviceUmeng];
	    [BPBClick addClickService:serviceTalkingData];
	    // 3. 设置渠道
	#ifdef DEBUG
	    [BPBClick setChannelId:@"Debug"];
	#else
	    [BPBClick setChannelId:@"App Store"];
	#endif
	    // 4. 启动服务
	    [BPBClick start];
```
	    
	   
#追踪页面访问
在ViewController的viewWillAppear或viewDidAppear中，添加代码

```objective-c

	[BPBClick trackPageBegin:@"页面名称"];
```	
	
在ViewController的viewWillDisappear或viewDidDisappear中，添加代码

```objective-c

	[BPBClick trackPageEnd:@"页面名称"];
```

#自定义事件

在事件触发的位置，添加事件代码

```objective-c

	[BPBClick event:@"事件代码"
	          label:@"事件标签"
	attributesBlock:^NSDictionary *{
	                 return @{@"事件属性1":@"值1",@"事件属性2":@"值2"};
	             }];
	             
```
*注意：对于友盟平台，事件代码需事先到平台的自定义事件中先定义，并且attributes有返回值时，label的内容会忽略*
