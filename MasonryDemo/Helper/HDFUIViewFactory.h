//
//  HDFUIViewFactory.h
//  newDoctor
//  控件初始化封装类 使用Masonry
//  (思路参照的HDFKitByHuangyibiao)
//  Created by Celgold on 16/6/20.
//  Copyright © 2016年 haodf.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Masonry.h"
#import "HDFDefine.h"

@interface HDFUIViewFactory : NSObject



/**
 * 创建UIView，默认背景色为clearColor
 *
 * @param superView   所创建的控件的父视图
 * @param constraints 添加约束
 *
 * @return 调用此API的控件类型对象，如UILabel调用，生成UILabel控件
 */
+ (UIView *)viewWithSuperView:(UIView *)superView
                  constraints:(void(^)(MASConstraintMaker *make))constraints;

/**
 * 创建UILabel控件  默认左对齐，numberOfLines = 1
 *
 * @param text        文本
 * @param textColor   文本前景色
 * @param font        文本字体
 * @param superView   所创建的控件的父视图
 * @param constraints 添加约束
 *
 * @return 生成UILabel控件
 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(int)fontSize
                 superView:(UIView *)superView
               constraints:(void(^)(MASConstraintMaker *make))constraints;


/**
 * 创建UIButton控件 默认背景色为clearColor
 *
 * @param title     标题
 * @param superView 父视图
 * @param constraints 约束
 * @param touchUp 点击的回调
 *
 * @return UIButton对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                    superView:(UIView *)superView
                  constraints:(void(^)(MASConstraintMaker *make))constraints
                        click:(HDFButtonBlock)click;

/**
 * 创建UIButton控件
 *
 * @param image           图片,可以是UIImage对象，也可以是图片名称
 * @param superView       父视图
 * @param constraints     约束
 * @param touchUp         点击的回调
 *
 * @return UIButton对象
 */
+ (UIButton *)buttonWithImage:(id)image
                    superView:(UIView *)superView
                  constraints:(void(^)(MASConstraintMaker *make))constraints
                        click:(HDFButtonBlock)click;



/**
 * 创建UIImageView控件
 *
 * @param image           图片,可以是UIImage对象，也可以是图片名称
 * @param superView       父视图
 * @param constraints     约束
 *
 * @return UIImageView对象
 */
+ (UIImageView *)imageViewWithImage:(id)image
                          superView:(UIView *)superView
                        constraints:(void(^)(MASConstraintMaker *make))constraints;



/**
 * 创建UITableView控件
 *
 * @param superView   所创建的控件的父视图
 * @param style       表格样式
 * @param config      用于额外配置UITableView属性
 * @param constraints 添加约束
 *
 * @see UITableViewStyle
 * @return 生成UITableView控件
 */
+ (UITableView *)tableViewWithSuperView:(UIView *)superView
                                  style:(UITableViewStyle)style
                           customConfig:(void(^)(UITableView *tableView))config
                            constraints:(void(^)(MASConstraintMaker *make))constraints;

/**
 *  line，不用设置高度的约束
 *
 *  @param superView
 *  @param constraints
 *
 *  @return
 */
+ (UIView *)lineWithSuperView:(UIView *)superView
                          constraints:(void(^)(MASConstraintMaker *make))constraints;


/**
 * 灰色间隔条，上下各有一条线
 *
 *  @param superView
 *  @param height
 *  @param constraints
 *
 *  @return
 */
+ (UIView *)grayTowLineWithInSuperView:(UIView *)superView
                                height:(float)height
                  constraints:(void(^)(MASConstraintMaker *make))constraints;




@end
