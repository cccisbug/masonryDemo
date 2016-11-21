

#import "HDFBasicViewController.h"

@implementation HDFBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    [self.view addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:blueView];
    
    // 使这三个控件等高
    CGFloat padding = 30;
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(redView.mas_left).offset(-padding);
        make.bottom.mas_equalTo(blueView.mas_top).offset(-padding);
        // 三个控件等高
        make.height.mas_equalTo(@[redView, blueView]);
        // 红、绿这两个控件等宽
        make.width.mas_equalTo(redView);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.bottom.mas_equalTo(greenView);
        make.right.mas_equalTo(-padding);
        make.left.mas_equalTo(greenView.mas_right).offset(padding);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(greenView);
        make.bottom.mas_equalTo(-padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(-padding);
    }];
    
    //ccc居中及size设置
    UILabel *lblYellow = [[UILabel alloc] init];
    lblYellow.backgroundColor = [UIColor yellowColor];
    lblYellow.text = @"居中显示";
    lblYellow.textAlignment = NSTextAlignmentCenter;
    [blueView addSubview:lblYellow];
    [lblYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        // 设置居中
        make.center.equalTo(blueView);
        //ccc 设置size
        make.size.mas_equalTo(CGSizeMake(100, 100));
        //ccc 设置居中偏移
//        make.center.equalTo(blueView).centerOffset(CGPointMake(50, 50));
    }];
    
    UILabel *textLable = [[UILabel alloc] init];
    textLable.text = @"哈哈";
    [blueView addSubview:textLable];
    [textLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lblYellow.mas_right);
        make.top.equalTo(lblYellow.mas_top);
    }];
    
    //ccc edge 设置
    UILabel *lblGray = [[UILabel alloc] init];
    lblGray.backgroundColor = [UIColor grayColor];
    lblGray.text = @"设置边距";
    lblGray.textAlignment = NSTextAlignmentCenter;
    [greenView addSubview:lblGray];
    [lblGray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(greenView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];

    
}

@end
