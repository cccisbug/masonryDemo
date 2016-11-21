//
//  HDFDefine.h
//  newPatient
//
//  Created by huangyibiao on 15/6/3.
//  Copyright (c) 2015年 haodf.com. All rights reserved.
//

#ifndef newPatient_HDFDefine_h
#define newPatient_HDFDefine_h

#import <UIKit/UIKit.h>

/*****************************************************************************
 *  This is a very very helpful category for layout a view's frame.
 *
 *  @author huangyibiao
 *  @email  huangyibiao520@163.com
 *  @github https://github.com/632840804
 *  @blog   http://blog.csdn.net/woaifen3344
 *
 *  @note Make friends with me.
 *        Facebook: huangyibiao520@163.com (Jacky Huang)
 *        QQ:(632840804)
 *        Weixin:(huangyibiao520)
 *        Please tell me your real name when you send message to me.3Q.
 *
 *        Don't delete me, thanks!!!!
 *****************************************************************************/

/*****************************************************************************
 *  全局通用的block声明
 *****************************************************************************/

/**
 * 只带一个error参数的失败闭包类型，主要用于处理失败回调
 *
 * @param error 错误对象
 */
typedef void (^HDFErrorBlock)(NSError *error);

/**
 * 只带一个errorMessage参数的失败闭包类型，主要用于处理失败回调
 *
 * @param errorMessage 失败的提示文本
 */
typedef void (^HDFErrorMessageBlock)(NSString *errorMessage);

/**
 * 通用的空闭包类型，无参数，无返回值
 */
typedef void (^HDFVoidBlock)(void);

/**
 * 通知的Block类型
 *
 * @param notification 回调的通知类型
 */
typedef void (^HDFNotificationBlock)(NSNotification *notification);

/**
 * 常用的返回Bool类型的Block类型
 *
 * @param result 返回结果，BOOL类型，通常是判断成功与失败
 */
typedef void (^HDFBoolBlock)(BOOL result);

/**
 * 常用的返回Bool类型和相应提示语的Block类型
 *
 * @param result 返回结果，BOOL类型，通常是判断成功与失败
 * @param errorMsg 返回提示语，通常是成功与失败对应的提示语
 */
typedef void (^HDFBoolMsgBlock)(BOOL result, NSString *errorMsg);

/**
 * 常用的返回数组类型的Block类型
 *
 * @param resultList 数组，通常是接口返回数据源为一个数组时使用
 */
typedef void (^HDFArrayBlock)(NSArray *resultList);

/**
 * 常用的返回数组类型和错误提示语的Block类型
 *
 * @param resultList 数组，通常是接口返回数据源为一个数组时使用
 * @param errorMsg 如果出现错误，可以返回对应的错误提示，否则置为nil即可
 */
typedef void (^HDFArrayMsgBlock)(NSArray *resultList, NSString *errorMsg);

/**
 * 常用的返回字典类型的Block类型
 *
 * @param resultDict 结果字典，通常是接口返回数据源为一个字典时使用
 */
typedef void (^HDFDictionaryBlock)(NSDictionary *resultDict);

/**
 * 常用的返回字典类型的Block类型
 *
 * @param resultDict 结果字典，通常是接口返回数据源为一个字典时使用
 * @param errorMsg 如果出现错误，可以返回对应的错误提示，否则置为nil即可
 */
typedef void (^HDFDictionaryMsgBlock)(NSDictionary *resultDict, NSString *errorMsg);

/**
 * 常用的返回基本类型的Block类型
 *
 * @param resultNumber 返回的结果，通常是接口返回数据源为一个基本类型时使用
 */
typedef void (^HDFNumberBlock)(NSNumber *resultNumber);

/**
 * 常用的返回基本类型的Block类型
 *
 * @param resultNumber 返回的结果，通常是接口返回数据源为一个基本类型时使用
 * @param errorMsg 如果出现错误，可以返回对应的错误提示，否则置为nil即可
 */
typedef void (^HDFNumberMsgBlock)(NSNumber *resultNumber, NSString *errorMsg);

/**
 * 常用的返回NSInteger类型的Block类型
 *
 * @param resultNumber 返回的结果，通常是接口返回数据源为一个NSInteger类型时使用
 */
typedef void (^HDFIntegerBlock)(NSInteger resultNumber);

/**
 * 常用的返回NSInteger类型的Block类型
 *
 * @param resultNumber 返回的结果，通常是接口返回数据源为一个NSInteger类型时使用
 * @param errorMsg 如果出现错误，可以返回对应的错误提示，否则置为nil即可
 */
typedef void (^HDFIntegerMsgBlock)(NSInteger resultNumber, NSString *errorMsg);

/**
 * 常用的返回NSString类型的Block类型
 *
 * @param result 返回的结果，通常是接口返回数据源为一个NSString类型时使用
 */
typedef void (^HDFStringBlock)(NSString *result);

/**
 * 常用的返回NSString类型的Block类型
 *
 * @param result 返回的结果，通常是接口返回数据源为一个NSString类型时使用
 * @param errorMsg 如果出现错误，可以返回对应的错误提示，否则置为nil即可
 */
typedef void (^HDFStringMsgBlock)(NSString *result, NSString *errorMsg);

/**
 * 常用的返回id类型的Block类型
 *
 * @param result 返回的结果，通常是接口返回数据源为一个id类型时使用
 */
typedef void (^HDFIdBlock)(id result);

/**
 * 常用的返回id类型的Block类型
 *
 * @param result 返回的结果，通常是接口返回数据源为一个id类型时使用
 * @param errorMsg 如果出现错误，可以返回对应的错误提示，否则置为nil即可
 */
typedef void (^HDFIdMsgBlock)(id result, NSString *errorMsg);

/**
 * 常用的单个按钮点击回调的Block类型
 *
 * @param sender 响应的按钮
 */
typedef void(^HDFButtonBlock)(UIButton *sender);

/**
 * 常用的多个按钮点击回调的Block类型
 *
 * @param index  响应的按钮对应的索引
 * @param sender 响应的按钮
 */
typedef void(^HDFButtonIndexBlock)(NSUInteger index, UIButton *sender);

/**
 * 常用的手势回调的Block类型
 *
 * @param sender 所触发的手势
 */
typedef void(^HDFGestureBlock)(UIGestureRecognizer *sender);

/**
 * 用于普通的字符串格式化
 */
#define kStringFormat(format, params) ([NSString stringWithFormat:(format), (params)])

/**
 * 快速生成weak/strong类型的对象
 */
#define kWeakObject(object) __weak __typeof(object) weakObject = object;
#define kWeak(caller, object) __weak __typeof(object) caller = object;
#define kStrongObject(object) __strong __typedef(object) strongObject = object;

/**
 * 快速生成main thread / global thread
 */
#define kMainThread (dispatch_get_main_queue())
#define kGlobalThread dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

/**
 * 角度与弧度的快速转换
 */
#define kRadiansToDegrees(radians) ((radians) * (180.0 / M_PI))
#define kDegreesToRadians(angle) ((angle) / 180.0 * M_PI)

/**
 * 快速获取IOS system version
 */
#define kIsIOS6OrLater ([UIDevice currentDevice].systemVersion.integerValue >= 6 ? YES : NO)
#define kIsIOS7OrLater ([UIDevice currentDevice].systemVersion.integerValue >= 7 ? YES : NO)
#define kIsIOS8OrLater ([UIDevice currentDevice].systemVersion.integerValue >= 8 ? YES : NO)
#define kSystemVersion ([UIDevice currentDevice].systemVersion.floatValue)
#define kIOSVersion ((float)[[[UIDevice currentDevice] systemVersion] doubleValue])

/**
 *  Screen width and height
 */
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

/**
 * 快速判断device类型
 */
#define kIs5OrLater ([[UIScreen mainScreen] currentMode].size.height >= 960)
#define kScreenBounds ([UIScreen mainScreen].bounds)
#define kIs6Plus (kScreenHeight >= 667)
#define kIs6 (kScreenHeight > 568 && kScreenHeight < 667)
#define kIsIphone4or4s (kScreenHeight <= 480)
#define kIsIPad \
([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]\
&& [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define kIsLandscape (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))

/**
 * tab bar / navigation bar
 */
#define kNavBarHeight  (44.0)
#define kStatusBarHeight (20.0)
#define kTabBarHeight (49.0)
#define kNavHeight (64.0)

// 获取宽、高缩放比例
#define kWidthScale (kScreenWidth / 320.0)
#define kHeightScale (kScreenHeight / 568.0)

/**
 * 快速生成字体
 */
#define kFontWithSize(size) [UIFont systemFontOfSize:size]
#define kBoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]

/**
 * 快速生成颜色
 */
// color
///< format：0xFFFFFF
#define k16RGBColor(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
///< format：22,22,22
#define kRGBColor(r, g, b) ([UIColor colorWithRed:(r) / 255.0  \
green:(g) / 255.0  \
blue:(b) / 255.0  \
alpha:1])
///< format：22,22,22,0.5
#define kRGBAColor(r, g, b, a) ([UIColor colorWithRed:(r) / 255.0  \
green:(g) / 255.0  \
blue:(b) / 255.0  \
alpha:(a)])
#define kColorWith16RGB(rgb) k16RGBColor(rgb)
#define kColorWithRGB(r,g,b) kRGBColor(r,g,b)
#define kColorWithRGBA(r,g,b,a) kRGBAColor(r, g, b, a)

/**
 * 快速加载图片
 */
#define kImageWithName(Name) ([UIImage imageNamed:Name])
#define kBigImageWithName(Name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:Name ofType:nil]])

/**
 * 快速访问系统自带的singleton
 */
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kNotificationCenter  [NSNotificationCenter defaultCenter]

/**
 * 快速发送通知API
 */
#define kPostNotificationWithName(notificationName) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:nil]
#define kPostNotificationWithNameAndUserInfo(notificationName, userInfo) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:userInfo]

// empty
#define kIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))

// 判断对象是否为null
#define kIsNull(obj) ([obj isKindOfClass:[NSNull class]])
// 是否是无效字典
#define kIsInvalidDict(objDict) (objDict == nil || ![objDict isKindOfClass:[NSDictionary class]])
// 是否是无效数组
#define kIsInvalidArray(objArray) (objArray == nil || ![objArray isKindOfClass:[NSArray class]])

#endif

