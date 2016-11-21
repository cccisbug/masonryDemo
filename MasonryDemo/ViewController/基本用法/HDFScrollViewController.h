
/*
 对于循环创建，我们需要记录下一个视图所依赖的控件，这里使用了lastLabel来记录。
 
 我们要想让scrollview的contentSize随内容的变化而变化，那么就我们一定要添加注意添加约束：
 
 [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
 make.edges.mas_equalTo(self.view);
 
 // 让scrollview的contentSize随着内容的增多而变化
 make.bottom.mas_equalTo(lastLabel.mas_bottom).offset(20);
 }];
 
 对于scrollview和tableview，我们不能使用bottom来计算其高，因为这个属性对于scrollview和tableview来说，不用用来计算高度的，而是用于计算contentSize.height的。我们要想随内容而变化，以便可滚动查看，就必须设置bottom约束。
 */

#import "HDFBaseViewController.h"

@interface HDFScrollViewController : HDFBaseViewController

@end
