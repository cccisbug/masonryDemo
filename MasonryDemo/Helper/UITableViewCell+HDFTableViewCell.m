//
//  UITableView+HDFAutoCalculateHeight.m
//  MasonryDemo
//
//  Created by huangyibiao on 15/7/24.
//  Copyright © 2015年 huangyibiao. All rights reserved.
//

#import "UITableViewCell+HDFTableViewCell.h"
#import <objc/runtime.h>

@interface HDFTableViewAssitantObject : NSObject

@property (nonatomic, strong) UIView *hdf_lastView;
@property (nonatomic, assign) CGFloat hdf_offset;

@end

@implementation HDFTableViewAssitantObject


@end

static HDFTableViewAssitantObject *s_hdf_rowHeightAssitant;

@interface UITableViewCell ()

@property (nonatomic, strong) HDFTableViewAssitantObject *hdf_heightAssitant;
@property (nonatomic, strong) UIView *hdf_cellLastView;
@property (nonatomic, assign) CGFloat hdf_bottomOffsetToCellLastView;

@end

@implementation UITableViewCell (HDFTableViewCell)

#pragma mark - Public
+ (CGFloat)hdf_heightForIndexPath:(NSIndexPath *)indexPath configBlock:(HDFCellConfigBlock)configBlock {
  UITableViewCell *cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
  
  if (configBlock) {
    configBlock(cell);
  }
  
  return [cell hdf_heightForIndexPath:indexPath];
}

- (CGFloat)hdf_heightForIndexPath:(NSIndexPath *)indexPath {

  
  NSAssert(self.hdf_cellLastView != nil, @"您未指定cell排列中最后一个视图对象，无法计算cell的高度");
  
  [self layoutIfNeeded];
  
  CGFloat rowHeight = self.hdf_cellLastView.frame.size.height + self.hdf_cellLastView.frame.origin.y;
  rowHeight += self.hdf_bottomOffsetToCellLastView;
  
  return rowHeight;
}

- (void)hdf_setCellLastView:(UIView *)lastView bottomOffset:(CGFloat)bottomOffset {
  self.hdf_heightAssitant.hdf_lastView = lastView;
  self.hdf_heightAssitant.hdf_offset = bottomOffset;
}

- (void)hdf_setCellLastView:(UIView *)lastView {
  [self hdf_setCellLastView:lastView bottomOffset:0];
}

+ (void)hdf_removeCellResource {
  // 清空数据
  s_hdf_rowHeightAssitant = nil;
}

#pragma mark - Private
- (void)setHdf_bottomOffsetToCellLastView:(CGFloat)hdf_bottomOffsetToCellLastView {
  self.hdf_heightAssitant.hdf_offset = hdf_bottomOffsetToCellLastView;
}

- (CGFloat)hdf_bottomOffsetToCellLastView {
  return self.hdf_heightAssitant.hdf_offset;
}

- (void)setHdf_cellLastView:(UIView *)hdf_cellLastView {
  self.hdf_heightAssitant.hdf_lastView = hdf_cellLastView;
}

- (UIView *)hdf_cellLastView {
  return self.hdf_heightAssitant.hdf_lastView;
}

- (void)setHdf_heightAssitant:(HDFTableViewAssitantObject *)hdf_heightAssitant {
  s_hdf_rowHeightAssitant = hdf_heightAssitant;
}

- (HDFTableViewAssitantObject *)hdf_heightAssitant {
  HDFTableViewAssitantObject *obj = s_hdf_rowHeightAssitant;
  
  if (obj == nil || ![obj isKindOfClass:[HDFTableViewAssitantObject class]]) {
    obj = [[HDFTableViewAssitantObject alloc] init];
    self.hdf_heightAssitant = obj;
  }
  
  return obj;
}

@end
