
/*
 当我们要收起的时候，只是简单地设置其高度的约束为40，但是当我们要展开时，实现起来就相对麻烦了。因为我们需要重新添加约束，要重新给所点击的视图添加约束，就需要知道前一个依赖视图和后一个依赖视图的约束，以便将相关联的都更新约束。
 
 当我们更新所点击的视图时，我们通过判断是否有前一个依赖视图来设置顶部约束：
 
 if (preView) {
 make.top.mas_equalTo(preView.mas_bottom).offset(20);
 } else {
 make.top.mas_equalTo(20);
 }
 
 除了这个之外，我们也需要更新后一个视图的约束，因为我们对所点击的视图调用了mas_remakeConstraints方法，就会移除其之前所添加的所有约束，所以我们必须重新将后者对当前点击的视图的依赖重新添加上去：
 
 if (nextView) {
 [nextView mas_updateConstraints:^(MASConstraintMaker *make) {
 make.top.mas_equalTo(view.mas_bottom).offset(20);
 }];
 }
 
 */

//!!!!!!!!!!!!!
//注意：以上思路是使用原始办法，需要重新remake约束。但其实没必要这么复杂，提取出来约束直接卸载掉就好了。。。

#import "HDFBaseViewController.h"

@interface HDFScrollComplexViewController : HDFBaseViewController

@end
