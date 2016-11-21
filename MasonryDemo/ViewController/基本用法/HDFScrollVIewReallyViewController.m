//
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/7/6.
//  Copyright © 2016年 hdf. All rights reserved.
//

#import "HDFScrollVIewReallyViewController.h"

@interface HDFScrollVIewReallyViewController ()
{
    UILabel *tipLabel;
}
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation HDFScrollVIewReallyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    //重要----scrollView 约束
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    UIView *scrollContentView = [[UIView alloc] init];
    [self.scrollView addSubview:scrollContentView];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    [scrollContentView addSubview:imgView];
    imgView.backgroundColor = [UIColor greenColor];
    imgView.layer.cornerRadius = 50;
    imgView.layer.masksToBounds = YES;
    
    tipLabel = [[UILabel alloc] init];
    tipLabel.text = @"UIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = [UIColor blackColor];
    tipLabel.backgroundColor = [UIColor clearColor];
    tipLabel.numberOfLines = 0;
    [scrollContentView addSubview:tipLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"显示超多文字" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(setText) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 6;
    button.clipsToBounds = YES;
    button.layer.masksToBounds = YES;
    
    [scrollContentView addSubview:button];
    
    //重要----容器 约束
    [scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
        make.height.greaterThanOrEqualTo(self.scrollView).offset(1);
    }];
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.centerX.mas_equalTo(scrollContentView);
        make.width.height.mas_equalTo(100);
    }];
    
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(imgView.mas_bottom).offset(40);
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_greaterThanOrEqualTo(tipLabel.mas_bottom).offset(80);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(45);
        
    }];
    
    //ccc 重要 container要知道自己到底多高，所以最后一个控件要加底部约束
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(scrollContentView.mas_bottom).offset(-80);
    }];
    
}


-(void)setText{
    tipLabel.text = @"UIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动\nUIScrollView使用Masonry约束的正确用法，无论内容多少，UIScrollView都可以滑动,";
}

@end
