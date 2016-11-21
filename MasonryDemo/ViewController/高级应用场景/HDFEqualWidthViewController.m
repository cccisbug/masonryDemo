//
//  HDFEqualWidthViewController.m
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/7/7.
//  Copyright © 2016年 hiko. All rights reserved.
//

#import "HDFEqualWidthViewController.h"
#import "MASCompositeConstraint+hasInstalled.h"

@interface HDFEqualWidthViewController ()
{
    //出于保密考虑，变量名不适用公司业务关键词
    UILabel     *lblNum1;
    UILabel     *lblNum2;
    UILabel     *lblNum3;
}
@end

@implementation HDFEqualWidthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWidget];
}

-(void)initWidget{
    
    //头像
    UIImageView *ivAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_doctor_head"]];
    [self.view addSubview:ivAvatar];
    [ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@5);
        make.width.height.equalTo(@80);
    }];
    
    
    lblNum1                 = [UILabel new];
    lblNum1.textAlignment   = NSTextAlignmentCenter;
    lblNum1.numberOfLines   = 0;
    lblNum1.text            = @"患者好评\n101个";
    
    lblNum2                 = [UILabel new];
    lblNum2.textAlignment   = NSTextAlignmentCenter;
    lblNum2.numberOfLines   = 0;
    lblNum2.text            = @"患者好评\n102个";
    
    lblNum3                 = [UILabel new];
    lblNum3.textAlignment   = NSTextAlignmentCenter;
    lblNum3.numberOfLines   = 0;
    lblNum3.text            = @"患者好评\n103个";

    
    [self.view addSubview:lblNum1];
    [self.view addSubview:lblNum2];
    [self.view addSubview:lblNum3];
    
    
    __block id  cons;
    [lblNum1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.left.equalTo(ivAvatar.mas_right);
        cons = make.width.mas_equalTo(@[lblNum2, lblNum3]);
    }];
//    [cons uninstall];
    
   NSLog(@"约束是否安装 %d",[(MASCompositeConstraint *)cons hasInstalled]);
    
    
    [lblNum2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.left.mas_equalTo(lblNum1.mas_right);
    }];
    [lblNum3 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(lblNum2.mas_right);
    }];
    
    UIView *splitLine1 = [UIView new];
    [self.view addSubview:splitLine1];
    splitLine1.backgroundColor = [UIColor grayColor];
    [splitLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@25);
        make.left.mas_equalTo(lblNum1.mas_right);
        make.width.mas_equalTo(0.5);
        make.height.mas_equalTo(18);
    }];
    
    UIView *splitLine2 = [UIView new];
    [self.view addSubview:splitLine2];
    splitLine2.backgroundColor = [UIColor grayColor];
    [splitLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@25);
        make.left.mas_equalTo(lblNum2.mas_right);
        make.width.mas_equalTo(0.5);
        make.height.mas_equalTo(18);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
