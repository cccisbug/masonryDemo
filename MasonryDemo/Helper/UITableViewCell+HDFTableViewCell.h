//
//  UITableViewCell+HDFTableViewCell.h
//  newDoctor
//
//  Created by huangyibiao on 15/7/24.
//  Copyright © 2015年 haodf.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 获取高度前会回调，需要在此BLOCK中配置数据，才能正确地获取高度
 */
typedef void(^HDFCellConfigBlock)(UITableViewCell *cell);

/**
 * @author huangyibiao
 *
 * 此扩展是用于自动计算cell的高度
 */
@interface UITableViewCell (HDFTableViewCell)

/**
 * @author huangyibiao
 *
 * @note UI布局必须放在UITableViewCell的初始化方法中：
 *
 * - initWithStyle:reuseIdentifier:
 * 
 * 才能生效
 */

/**
 * @author huangyibiao
 *
 * 必须要调用此方法。在布局UI完成后，也就是到最后一个控件布局完成后，调用此API，设置
 * cell的最后一个控件，及该控件距离底部的偏移
 *
 * @param lastView 指定作为cell的最后一个视图
 * @param bottomOffset 指定的最后一个视图的最底部与cell的底部之间的距离
 */
- (void)hdf_setCellLastView:(UIView *)lastView
               bottomOffset:(CGFloat)bottomOffset;

/**
 * @author huangyibiao
 *
 * 必须要调用此方法。在布局UI完成后，也就是到最后一个控件布局完成后，调用此API，设置
 * cell的最后一个控件，及该控件距离底部的偏移
 *
 * @param lastView 指定最后一个view
 */
- (void)hdf_setCellLastView:(UIView *)lastView;

/**
 * @author huangyibiao
 *
 * // 调用方式二：
   return [HDFTestCell hdf_heightForIndexPath:indexPath configBlock:^(UITableViewCell *cell) {
       // 转换成对应的类型
       HDFTestCell *textCell = (HDFTestCell *)cell;
       
       // 配置数据，才能更新约束获取高度
       [textCell configCell];
   }];
 *
 *
 * @param indexPath 行
 * @param configBlock 需要在此block内调用配置数据，用于计算高度
 *
 * @return 计算得到的行高
 */
+ (CGFloat)hdf_heightForIndexPath:(NSIndexPath *)indexPath
                      configBlock:(HDFCellConfigBlock)configBlock;

/**
 * @author huangyibiao
 *
 * 需要在viewWillDisappear中调用，否则进入另一个界面也使用tableview时，可能会出现高度被重用的问题
 */
+ (void)hdf_removeCellResource;

@end
