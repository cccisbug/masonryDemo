
/*
 移除之前的所有约束，然后添加新约束的方法是：mas_remakeConstraints。
 
 这里展开与收起的关键代码在这里.设置最大最小值，这样就不会超出我们预期的范围。
 
 // 最大值为250
 make.width.height.lessThanOrEqualTo(@250);
 
 // 最小值为90
 make.width.height.greaterThanOrEqualTo(@90);
 
 我们设置其固定的宽高，并且设置其优先级为最低，以保证我们所设置的最大最小值始终生效。
 
 想要更新约束时添加动画，就需要调用关键的一行代码：setNeedsUpdateConstraints，这是选择对应的视图中的约束需要更新。
 
 对于updateConstraintsIfNeeded这个方法并不是必须的，但是有时候不调用就无法起到我们的效果。但是，官方都是这么写的，从约束的更新原理上讲，这应该写上。我们要使约束立即生效，就必须调用layoutIfNeeded此方法。看下面的方法，就是动画更新约束的核心代码：
 
 // 告诉self.view约束需要更新
 [self.view setNeedsUpdateConstraints];
 // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
 [self.view updateConstraintsIfNeeded];
 
 [UIView animateWithDuration:0.3 animations:^{
 [self.view layoutIfNeeded];
 }];
 */

#import "HDFBaseViewController.h"

@interface HDFTotalUpdateViewController : HDFBaseViewController

@end
