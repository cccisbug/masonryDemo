
/*
 关键的代码是：
 
 make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);
 
 我们就说说bottomInnerView的约束如何添加。 我们希望width/height比为1/3.0，首先，我们设置了其top和bottom与父视图一致且始终在父视图中居中显示：
 
 make.top.bottom.mas_equalTo(bottomView);
 make.center.mas_equalTo(bottomView);
 
 然后我们通过make.width.height.lessThanOrEqualTo设置了宽、高的最大值与父视图相同，然后设置了宽和高与父视图相等，但是优先级为最低，以保证子视图的宽高不超过父视图。
 
 make.width.height.mas_equalTo(bottomView).priorityLow();
 make.width.height.lessThanOrEqualTo(bottomView);
 
 最后，我们设置了bottomInnerView的高为宽的3倍。
 
 make.height.mas_equalTo(bottomInnerView.mas_width).multipliedBy(3);
 
 */

#import "HDFBaseViewController.h"

@interface HDFAspectFitViewController : HDFBaseViewController

@end
