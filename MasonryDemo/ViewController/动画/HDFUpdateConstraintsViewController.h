
/*
 更新约束的方法是：mas_updateConstraints。下面笔者一行行代码说明。
 
 让控件始终居中显示：
 
 make.center.mas_equalTo(self.view);
 
 让控件的宽和高相等且设置其优先级最低。关于优先级，这里先不细讲，后续文章会专门讲解。
 
 make.width.height.mas_equalTo(100 * self.scacle).priorityLow();
 
 让控件的宽和高小于或者等于self.view的宽和高，因此这个控件的最多能放大到全屏幕。
 
 make.width.height.lessThanOrEqualTo(self.view);
 
 将这三行代码放在一起，形成的话就是：使控件与父视图始终保持居中，控件的宽和高最大不能超过屏幕，且控件的宽和高可以变化。由于我们设置了第二行的代码优先级为priorityLow，因此其优先级是最低的，所以就可以保证宽高不能超过屏幕。
 
 其实，当我们将更新代码放到updateViewConstraints这个方法中时，我们在viewDidLoad方法中写的：
 
 [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
 make.center.mas_equalTo(self.view);
 
 // 初始宽、高为100，优先级最低
 make.width.height.mas_equalTo(100 * self.scacle).priorityLow();
 // 最大放大到整个view
 make.width.height.lessThanOrEqualTo(self.view);
 }];
 
 就不需要了。这里写上去的目的只是想说明用与不用都没有关系。
 
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

@interface HDFUpdateConstraintsViewController : HDFBaseViewController

@end
