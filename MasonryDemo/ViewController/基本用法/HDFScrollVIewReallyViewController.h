//
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/7/6.
//  Copyright © 2016年 hdf. All rights reserved.
//

/*
 scrollview使用masonry正确用法
 scrorllView 使用Masonry时，尽量不要在scrollview上直接addview。而应该使用一个viewContainer，所有的控件放在contaienr上。
 关键是设置container与scrollView之间的约束。
 scrollView的width或者bottom不能用来计算其Frame，因为这个属性对于scrollview和tableview来说，不用用来计算高度的，而是用于计算contentSize.height的
设置办法简单来说，
 1、设置scrollview的大小为屏幕大小
 2、设置viewContainer宽度为scrollview宽，高度为内容高，但还要填充scrollview
 */

#import "HDFBaseViewController.h"

@interface HDFScrollVIewReallyViewController : HDFBaseViewController

@end
