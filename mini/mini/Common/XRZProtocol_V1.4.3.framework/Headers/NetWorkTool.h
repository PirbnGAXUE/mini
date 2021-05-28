//
//  NetWorkTool.h
//  TijiyiClone
//
//  Created by xiejunpeng on 14-7-30.
//  Copyright (c) 2014年 twohe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BleUtils.h"
@protocol NetWorkDelegate <NSObject>


-(void)getDataFromServer:(id)responseObject;


@optional


-(void)Updatafaill:(NSString*)fail;



@end


@interface NetWorkTool : NSObject{

id<NetWorkDelegate>delegate;

}


@property (strong,nonatomic) id<NetWorkDelegate>delegate;


+(NetWorkTool*)getNetWorkToolInstance;


//升级的时候请对比 正常模式的设备名前8位是否等于duf后的设备名，如果等于请选择升级 FileName升级url peripheral需要升级的设备，myself 请用self
- (void)downloadNordicFileURL:(NSString *)FileName :(CBPeripheral*)peripheral :(id)myself;

//product设备名字 是什么就传什么  fwversion固件版本x.x.x，sdkVersion sdk的版本当前是1.3
-(void)checkFWVersion:(NSString*)product fwVersion:(NSString*)fwversion sdkVersion:(NSString*)sdkVersion FinishBlock:(void (^)(NSData *, NSURLResponse *, NSError *)) block;
@end
