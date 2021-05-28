//
//  BleUtils.h
//  XRZProtocol_V1.1
//
//  Created by apple on 16/2/25.
//  Copyright © 2016年 xrz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

#import <UIKit/UIKit.h>
typedef void (^RturnBleDataBlock)(NSDictionary *dic);
//
typedef void (^ReturnBleScanBlock)(CBPeripheral *peripheral,NSString *macAddress,NSNumber *rssi);
//
typedef void (^RturnBleStateBlock)(int state);
//
typedef void (^RturnBleOtherBlock)(NSDictionary *dic);
typedef void (^RturnPhoneBleStateBlock)(int state);


@interface BleUtils : NSObject
@property (nonatomic,retain)NSString *getDeviceName;




/*
 *@discussion :得到实例(单例模式)
 */
+(BleUtils*)getBleUtilsInstance;

/*
 *@discussion :获取手机蓝牙状态
 */
-(void)getPhooneBleUtilsState:(RturnPhoneBleStateBlock)stateBlock;

/*
 *@discussion :开始扫描设备
 */
-(void)starScanningDevice:(ReturnBleScanBlock)scanBlock;

/*
 *@discussion :结束设备扫描一旦找到设备必须停止扫描
 */
-(void)stopScanningDevice;

/*
 *@discussion :连接设备
 *@param peripheral:要链接的对象
 *@param timeout:超时的时间，0为默认时间15s
 */
-(void)connectDevice:(CBPeripheral*)peripheral timeout:(int)timeout :(RturnBleStateBlock)stateBlock;

/*
 *@discussion :链接确认
 */
-(void)connectDeviceSure:(RturnBleDataBlock)stateBlock;

/*
 *@discussion :断开设备
 */
-(void)disconnectDevice:(RturnBleStateBlock)stateBlock;


/************************************************************************************************************/

/*
 *@discussion :同步时间命令
 *@param time:需要同步的时间格式：yyyy-MM-dd:HH:mm:ss
 
 *返回结果:dic{
 @"head":@"setSyncTime"
 @"result":@"Success/Fail"
 }
 */
- (void)setSyncTime:(NSString*)time :(RturnBleDataBlock)dataBlock;


/*
 *@discussion :设置设备区域号
 *@param data:区域号
 
 *返回结果:dic{
 @"head":@"setWatchZone"
 @"result":@"Success/Fail"
 }
 */
- (void)setWatchZone:(Byte*)data :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取设备区域号
 
 *返回结果:dic{
 @"head":@"getWatchZone"
 @"result":@"result"区域号
 }
 */
- (void)getWatchZone:(RturnBleDataBlock)dataBlock;


/*
 *@discussion :获取设备信息
 *返回结果:dic{
 @"head":@"getDeviceInfo "
 @"version":@"version"(固件版本号)
 @"level",@"level"(电池电量)
 @"time",@"time"(设备时间)
 @"function :{
 @"funSport":@"funSport"(运动功能,1表示有，0表示没有)
 @"funSleep":@"funSleep"(睡眠功能,1表示有，0表示没有)
 @"funTemp":@"funTemp"(温度功能,1表示有，0表示没有)
 @"funH":@"funH"(湿度功能,1表示有，0表示没有)
 @"funHR":@"funHR"(心率功能,1表示有，0表示没有)
 @"funMotor":@"funMotor"(马达功能,1表示有，0表示没有)
 @"funANCS":@"funANCS"(ANCS功能,1表示有，0表示没有)
 @"funGPS":@"funGPS"(GPS功能,1表示有，0表示没有)
 @"funScale":@"funScale"(电子秤功能,1表示有，0表示没有)
 @"funPayment":@"funPayment"(支付功能,1表示有，0表示没有)
 @"funFlash":@"funFlash"(SPIFLASH功能,1表示有，0表示没有)
 @"funScreen":@"funScreen"(屏幕功能,1表示有，0表示没有)
 @"funUV":@"funUV"(紫外线功能,1表示有，0表示没有)
 @"funWeChatSport":@"funWeChatSport"(微信运动,1表示有，0表示没有)
 @"hardwareVersion":@"hardwareVersion"(硬件版本号)
 @"funFirm":@"funFirm"（se厂商）
 @"sdkVersion":@"sdkVersion"(sdk支持的版本)
 @"masterChip":@"nordic/ti"(主控芯片nordic，ti)
 }"
 }
 */
-(void)getDeviceInfo:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取电池电量
 *返回结果:dic{
 @"head":@"getDeviceBattery "
 @"level":@"level"
 }
 */
-(void)getDeviceBattery:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :设置个人信息
 *@param iheight:身高
 *@param iweight:体重
 *@param isex:性别
 *@param iwalkingStep:走路步长
 *@param ijogStep:健步步长
 *@param irunningStep:跑步步长
 *@param iage:年龄
 *返回结果:dic{
 @"head":@"setPersionInfo"
 @"result":@"Success/Fail"
 }
 */
-(void)setPersionInfo:(int)iheight :(int)iweight :(int)isex :(int)iwalkingStep :(int)ijogStep :(int)irunningStep :(int)iage :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取个人信息
 *返回结果:dic{
 @"head":@"getPersionInfo "
 @"height":@"height"
 @"weight":@"weight"
 @"sex":@"sex"
 @"walkingStep":@"walkingStep"
 @"jogingStep":@"jogingStep"
 @"runningStep":@"runningStep"
 @"age":@"age"
 }
 */
-(void)getPersionInfo:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :设置运动目标
 *@param iStepNum:步数
 *返回结果:dic{
 @"head":@"setSportTarget "
 @"result":@"Success/Fail"
 }
 */
-(void)setSportTarget:(int)iStepNum :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取运动目标
 *返回结果:dic{
 @"head":@"getSportTarget "
 @"sportTarget":@"sportTargetl"
 }
 */
-(void)getSportTarget:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取目标
 *@param idayIndex:0表示今天，1表示前一天，以此类推，最多保存7天
 *返回结果:dic{
 @"head":@"getSportData "
 @"steps":@"steps"总步数
 @"distance":@"distance"总距离
 @"calories":@"calories"总卡路里
 @"sleepTime":@"sleepTime"总睡眠时间
 @"walkTime":@"walkTime"总走路时间
 @"jogTime":@"jogTime"总健步时间
 @"runTime":@"runTime"总跑步时间
 @"resetTime":@"resetTime"其他时间
 @"walk":@"walk"走路步数
 @"jog":@"jog"健步步数
 @"run":@"run"跑步步数
 @"time":@"time"当前的时间
  @"currentDay":@"currentDay"当前天
  @"totalDay":@"totalDay"总天数
 }
 */
-(void)getSportData:(int) idayIndex :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取每小时的运动步数
 *@param idayIndex:0表示今天，1表示前一天，以此类推，最多保存7天
 *返回结果:dic{
 @"head":@"getOneHourSportData "
 @"oneHourSepts":@"oneHourSepts" 125，333，200.... 每小时的运动步数 共24个小时
 }
 */
-(void)getOneHourSportData:(int)idayIndex :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取睡眠数据
 *@param idayIndex:0表示今天，1表示前一天，以此类推，最多保存7天
 *返回结果:dic{
 @"head":@"getSleepData "
 @"sleepData":@"sleepData"0,1,2,3...(每个点15分钟 共24小时，0表示深睡，1浅睡，2意识睡，3其它（无）)
 }
 */
-(void)getSleepData:(int)idayIndex :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :设置闹钟
 *@param ialarmIndex:0表示第一个闹钟，1表示第二个闹钟，以此类推，最多保存3个
 *@param ialarmState:开关状态，0表示关，1表示开
 *@param imode:先把重复的日期0+1010010(1表示重复，0表示不重复，他们的顺序是周末。周一。。。。周六)，然后再转换成10进制
 *@param ihour:闹钟时间的小时
 *@param imin:闹钟时间的分钟
 *返回结果:dic{
 @"head":@"setAlarm"
 @"result":@"Success/Fail"
 }
 */
-(void)setAlarm:(int)ialarmIndex :(int)ialarmState :(int)imode :(int)ihour :(int)imin :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取闹钟
 *返回结果:dic{
 
 @"head":@"getAlarm "
 @"oneAlarmSwitch":@"oneAlarmSwitch" 第一个闹钟状态
 @"oneAlarmHour":@"oneAlarmHour" 第一个闹钟时
 @"oneAlarmMinutes":@"oneAlarmMinutes" 第一个闹钟分
 @"oneAlarmWeek":@"oneAlarmWeek" 第一个闹钟重复的天数 (取出来是10进制0-256，你自己转换成8位2进制的数字01111111，(0,周末，周一，周二，周三，周四，周五，周六))
 
 @"twoAlarmSwitch":@"twoAlarmSwitch" 第二个闹钟状态
 @"twoAlarmHour":@"twoAlarmHour" 第二个闹钟时
 @"twoAlarmMinutes":@"twoAlarmMinutes" 第二个闹钟分
 @"twoAlarmWeek":@"twoAlarmWeek" 第二个闹钟重复的天数 (取出来是10进制0-256，你自己转换成8位2进制的数字01111111，(0,周末，周一，周二，周三，周四，周五，周六))
 
 @"threeAlarmSwitch":@"threeAlarmSwitch" 第三个闹钟状态
 @"threeAlarmHour":@"threeAlarmHour" 第三个闹钟时
 @"threeAlarmMinutes":@"threeAlarmMinutes" 第三个闹钟分
 @"threeAlarmWeek":@"threeAlarmWeek" 第三个闹钟重复的天数 (取出来是10进制0-256，你自己转换成8位2进制的数字01101011，(0,周末，周一，周二，周三，周四，周五，周六)，1重复，0不重复)
 
 }
 */
-(void)getAlarm:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :设置开关状态
 *@param call:来电开关
 *@param sms：短信
 *@param notify：通知
 *@param disconnect：断开
 *@param raise：手势
 *@param press 按键亮屏
 *@param sedentary 久坐提醒
 *返回结果:dic{
 @"head":@"setSwitchState "
 @"result":@"Success/Fail"
 }
 */
-(void)setSwitchState:(int)call :(int)sms :(int)notify :(int)disconnect : (int)raise :(int)press :(int)sedentary :(RturnBleDataBlock)dataBlock;//0 关 1开

/*
 *@discussion :获取开关状态
 *返回结果:dic{
 @"head":@"getSwitchState "
 @"callSwitch":@"callSwitch"(电话)
 @"smsSwitch":@"smsSwitch"(短信)
 @"notifySwitch":@"notifySwitch"(通知)
 @"disconnectSwitch":@"disconnectSwitch"(断开提醒)
 @"riseHandSwitch":@"riseHandSwitch"(抬手亮屏)
 @"pressSwitch":@"pressSwitch"(按键震动)
 @"sedentary":@"sedentary"(久坐提醒)
 }
 */
-(void)getSwitchState:(RturnBleDataBlock)dataBlock;//0 关 1开

/*
 *@discussion :设置提醒
 *@param itype:0表示来电提醒，1表示短信提醒，2表示其他提醒。
 *返回结果:dic{
 @"head":@"setRemind "
 @"result":@"Success/Fail"
 }
 */
-(void)setRemind:(int)itype :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :电话挂断提醒
 */
-(void)setCallMiss:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :进入升级模式
 *返回结果:dic{
 @"head":@"setDUF"
 @"result":@"Success/Fail"
 }
 */
-(void)setDUF :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :设备按键功能
 *返回结果:dic{
 @"head":@"keyFunction"
 }
 */
-(void)keyFunction:(RturnBleOtherBlock)otherBlock;

/*
 *@discussion :查找设备
 *返回结果:dic{
 @"head":@"setFindDevice "
 @"result":@"Success"
 }
 */
-(void)setFindDevice :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :链接提醒
 *返回结果:dic{
 @"head":@"setConnectRemind "
 @"result":@"Success/Fail"
 }
 */
-(void)setConnectRemind :(RturnBleDataBlock)dataBlock;
/*
 *@discussion :查余
 *返回结果:dic{
 @"head":@"SEQueryBalances "
 @"result":@"Success／Fail"
 @"balances":@"balances"余额
 }
 */
-(void)SEQueryBalances :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :查消费记录
 *@param index:0表示最近10条记录，1表示第一条，2表示第二条，以此类推上限10条
 
 *返回结果:dic{
 @"head":@"SEQueryRecond "
 @"result":@"Success／Fail"
 @"recond":@"recond"交易记录
 }
 */
-(void)SEQueryRecond:(int)index block:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :充值
 *@param money:充值金钱
 *返回结果:dic{
 @"head":@"SERecharge "
 @"result":@"Success／Fail"
 }
 */
-(void)SERecharge:(NSString*)money :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :SE通信数据
 *@param SEData ：数据
 *返回结果:dic{
 @"head":@"SEAPDU"
 @"result":@"result"
 }
 */
-(void)SEAPDU:(NSData*)SEData :(RturnBleDataBlock)dataBlcok;

/*
 *@discussion :脚本下发
 *@param data ：下发内容
 *返回结果:dic{
 
 @"head":@"SEAPDUScript"
 @"allIndex":@""
 @"currentIndex":@""
 @"result":@"Success/Fail"
 }
 */
-(void)SEAPDUScript:(NSData*)data :(RturnBleDataBlock)dataBlock;


/*
 *@discussion :传递apdu指令
 *@param apdu ：数据
 *返回结果:dic{
 @"head":@"sendAPDU"
 @"result":@"result"
 }
 */
-(void)sendAPDU:(NSData*)apdu :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取设备时间
 *返回结果:dic{
 @"head":@"getDeviceTime"
 @"result":@"result"
 }
 */
-(void)getDeviceTime :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :恢复出厂设置
 *返回结果:dic{
 @"head":@"restoreFactorySettings"
 @"result":@"result"
 }
 */
-(void)restoreFactorySettings :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :进入测试模式
 *返回结果:dic{
 @"head":@"setTestModel"
 @"result":@"Success/Fail"
 }
 */
-(void)setTestModel :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :SPIFlash字库测试
 *@param data ：格式0x??,16进制
 
 *返回结果:dic{
 @"head":@"setSPIFlash"
 @"result":@"Success/Fail"
 }
 */
-(void)setSPIFlash :(Byte)data : (RturnBleDataBlock)dataBlock;

/*
 *@discussion :屏幕与马达的老化
 *@param screenState ：屏幕状态
 *@param MotorState ：马达状态
 
 *返回结果:dic{
 @"head":@"setAgingTest"
 @"result":@"Success/Fail"
 }
 */
-(void)setAgingTest:(int)screenState :(int)MotorState :(RturnBleDataBlock)dataBlock;

/*
 *@discussion :上电,下电
 *@param state ：0是下电，1是上电
 *返回结果:dic{
 @"head":@"SEPowerState"
 @"result":@"Success/Fail"
 }
 */
-(void)SEPowerState:(int)state :(RturnBleDataBlock)dataBlock;

/* 上电
 *返回结果:dic{
 @"head":@"SEPowerOn"
 @"result":@"Success/Fail"
 }
 **/
-(void)SEPowerOn:(RturnBleDataBlock)dataBlock;
/* 下电
 *返回结果:dic{
 @"head":@"SEPowerOff"
 @"result":@"Success/Fail"
 }
**/
-(void)SEPowerOff:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :回滚数据
 *@param step ：总步数
 *@param kilomiter ：距离
 *@param calarie ：卡路里
 *@param sleepTime ：睡眠时间
 *@param otherTime ：其它时间
 *@param walkSteps ：走路步数
 *@param jogSteps ：健步步数
 *@param runSteps ：跑步步数
 *@param hourSportArray ：每小时运动步数(23,35,166,177)每个元素代表1个小时步数，共24小时
 *@param hourSleepArray ：每小时睡眠时间(0,1,2,3)每个元素代表15分钟睡眠状态，共24小时，0表示深睡，1浅睡，2意识睡，3其它(无)
 总步数=走路+健步+跑步=每小时运动之和
 *返回结果:dic{
 @"head":@"setDataRewind"
 @"result":@"Success/Fail"
 }
 */
-(void)setDataRewind:(int)steps distance:(int)metres calarie:(int)calaries sleepTime:(int)sleepTime walkTime:(int)walkTime jogTime:(int)jogTime runTime:(int)runTime restTime:(int)restTime walkStep:(int)walkSteps jogStep:(int)jogSteps runStep:(int)runSteps hourSportArray:(NSArray*)hourSportArray hourSleepArray:(NSArray*)hourSleepArray block:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取卡列表
 *返回结果:dic{
 @"head":@"getCardList"
 @"result":@"result"
 }
 */
-(void)getCardList:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :设置当前卡
 *返回结果:dic{
 @"head":@"setCurrentCard"
 @"result":@"Success/Fail"
 }
 */
-(void)setCurrentCard:(NSString*)aid blcok:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取当前卡
 *返回结果:dic{
 @"head":@"getCurrentCard"
 @"result":@"result"
 }
 */
-(void)getCurrentCard:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :添加卡包信息
 *@param aid ：卡的aid
 *@param cardName ：卡名
 *返回结果:dic{
 @"head":@"addCardInformation"
 @"result":@"Success/Fail"
 }
 */
-(void)addCardInformation:(NSString*)aid cardName:(NSString*)cardName blcok:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :删除卡包信息
 *@param aid ：卡的aid
 *返回结果:dic{
 @"head":@"removeCardInformation"
 @"result":@"Success/Fail"
 }
 */
-(void)removeCardInformation:(NSString*)aid blcok:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :清除脚本
 *返回结果:dic{
 @"head":@"clearScript"
 @"result":@"Success/Fail"
 }
 */
-(void)clearScript:(RturnBleDataBlock)dataBlock;
/*
 *@discussion :设置久坐提醒
 *imode 周期，跟设置闹钟周期类似 循环模式（从低位到高位，星期天~星期六）
 *time 久坐时长 久坐时长:单位分钟，范围0-255
 *startTime  开始时间  XX:XX
 *endTime  截至时间   XX:XX
 *@"head":@"setSedentaryRemind"
 */

-(void)setSedentaryRemind:(int)imode :(int)time :(NSString *)startTime :(NSString *)endTime block:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取久坐提醒
 @"head":@"clearScript"
 *@"head":@"getSedentaryRemind"
 */

-(void)getSedentaryRemind:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :设置生产日期
 *只需要传年月日 格式 @“2016-11-04”
 *@"head":@"setProuctDate"
 **/
-(void)setProductionDate:(NSString *)time block:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :获取生产日期
 *@"head":@"clearScript"
 *@"result":@"2016-11-04"
 */
-(void)getProductionDate:(RturnBleDataBlock)dataBlock;

/*
 *@discussion :开始ota升级
 */
-(void)beginOTA;

//mac地址 dic
-(void)getDeviceMac:(RturnBleDataBlock)dataBlock;
/*####################################################################################################*/


/*
 *@discussion :获取晚上22点到早上8点的睡眠
 *返回结果:dic{
 @"head":@"get22to8SleepData"
 @"result":@"sleepData22to8"
 }
 */

-(void)get22to10SleepData:(int)idayIndex :(RturnBleDataBlock)dataBlock;

-(int)getCalorie:(bool)sex height:(int)height weight:(int)weight age:(int)age run:(int)run walk:(int)walk;

//打开ancs通道,只有打开此通道才可以进行来电通知提醒
-(void)openAncsChannel;


@end
