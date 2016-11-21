
/*
 添加约束的方法是：mas_makeConstraints。我们可以看到，约束可以使用链式方式，使用方法很简单，看起来像一句话。
 
 看这句话：make.top.height.bottom.mas_equalTo(greenView)，意思是：使我的顶部、高度和底部都与greenView的顶部、高度和底部相等。因此，只要greenView的约束添加好了，那么redView的顶部、高度和底部也就自动计算出来了。
 
 大多时候，我们并不会将一句话完整地写出来，而是使用简写的方式。如：
 
 make.right.mas_equalTo(-padding);
 
 其完整写法为：
 
 make.right.mas_equalTo(bludView.superView.mas_right).offset(-padding);
 
 当我们是要与父控件相对约束时，可以省略掉父视图。注意，并不是什么时候都可以省略，只有约束是同样的才可以省略。比如，约束都是right才可以。如果是一个left一个是right，那么就不能省略了。
 */

#import "HDFBaseViewController.h"

@interface HDFBasicViewController : HDFBaseViewController

@end
