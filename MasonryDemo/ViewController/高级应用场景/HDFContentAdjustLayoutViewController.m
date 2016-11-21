//
//  HDFContentAdjustLayoutViewController.m
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/7/7.
//  Copyright © 2016年 hiko. All rights reserved.
//

#import "HDFContentAdjustLayoutViewController.h"

@interface HDFContentAdjustLayoutViewController ()
{
    UILabel         *lblVerticalDesc;
}
@end

@implementation HDFContentAdjustLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //上下布局，底部控件距离头像和描述最少间距
    [self initHeaderTextVetical];
}

#pragma mark - 内容高度不固定，但下方控件距离

/**
 *  头像，描述文字，底部控件距离描述文字
 */
-(void)initHeaderTextVetical{
    //顶部容器
    UIView *topContaier = [[UIView alloc] init];
    [self.view addSubview:topContaier];
    [topContaier mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.height.equalTo(@200);
    }];
    
    //右侧设置按钮
    UIButton *btnSetting = [[UIButton alloc] init];
    [btnSetting setTitle:@"设置多科室" forState:UIControlStateNormal];
    btnSetting.backgroundColor = [UIColor blueColor];
    [topContaier addSubview:btnSetting];
    [btnSetting addTarget:self action:@selector(verticalSettingAction) forControlEvents:UIControlEventTouchUpInside];
    [btnSetting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(@0);
    }];
    
    //头像
    UIImageView *ivAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_doctor_head"]];
    [topContaier addSubview:ivAvatar];
    [ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@5);
        make.width.height.equalTo(@80);
    }];
    
    //姓名
    UILabel *lblName = [[UILabel alloc] init];
    [topContaier addSubview:lblName];
    lblName.text = @"好大夫";
    lblName.font =[UIFont systemFontOfSize:15];
    [lblName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ivAvatar.mas_right).offset(5);
        make.top.equalTo(ivAvatar);
    }];
    
    //文字
    lblVerticalDesc = [[UILabel alloc] init];
    [topContaier addSubview:lblVerticalDesc];
    lblVerticalDesc.numberOfLines = 0;
    [lblVerticalDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lblName.mas_bottom).offset(5);
        make.left.equalTo(lblName);
        make.width.equalTo(@150);
    }];
    lblVerticalDesc.font =[UIFont systemFontOfSize:14];
    lblVerticalDesc.text = @"科室1\n科室2\n科室3\n科室4\n科室5";
    
    //底部控件
    UILabel *lblButtom = [UILabel new];
    lblButtom.backgroundColor = [UIColor greenColor];
    lblButtom.text = @"我距离头像15间距,如果描述文字比头像高，则距离文字15间距";
    lblButtom.numberOfLines = 0;
    [topContaier addSubview:lblButtom];
    [lblButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ivAvatar);
        make.width.equalTo(@250);
        
        //ccc重点来了，如果你想要desc文字上对齐，则都设置为greaterThanOrEqualTo
        make.top.greaterThanOrEqualTo(ivAvatar.mas_bottom).offset(15);
        make.top.equalTo(lblVerticalDesc.mas_bottom).offset(15);
    }];
    
}

-(void)verticalSettingAction{
    if ([@"科室1\n科室2\n科室3\n科室4\n科室5" isEqualToString:lblVerticalDesc.text]) {
        lblVerticalDesc.text = @"科室1";
    }else{
        lblVerticalDesc.text = @"科室1\n科室2\n科室3\n科室4\n科室5";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
