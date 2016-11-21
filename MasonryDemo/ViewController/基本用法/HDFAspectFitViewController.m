

#import "HDFAspectFitViewController.h"

@implementation HDFAspectFitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create views
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [redView addSubview:greenView];
    
    UILabel *hintLabel = [[UILabel alloc] init];
    hintLabel.text = @"绿色宽度是自身高度的2倍";
    [greenView addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
    }];
    
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.equalTo(self.view).dividedBy(2);
        make.centerY.equalTo(self.view);
    }];
    
    // width = height / 3
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(greenView.mas_height).multipliedBy(2);
        make.center.mas_equalTo(redView);
        // 设置优先级
        make.width.height.mas_equalTo(redView).priorityLow();
        make.width.height.lessThanOrEqualTo(redView);
    }];
}

@end
