#BPBClick

整合各种第三方统计平台，完成一次调用，发送多个平台的目的，目前支持的平台

1. Umeng统计分析
2. TalkingData统计分析

#添加第三方平台
加文件夹AnalyticsSDK添加到工程中

#添加依赖项
在工程中添加如下依赖项

- Required:	libz.dylib
- Required:	Security.framework

- Optional:	CoreTelephony.framework
- Optional:	AdSupport.framework


#添加代码

在AppDelegate的didFinishLaunchingWithOptions里添加如下代码

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
	    
	   
#追踪页面访问
todo

#自定义事件
todo

