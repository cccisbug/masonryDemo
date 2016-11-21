//
//  HDFWorkMasonryViewController.m
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/5/5.
//  Copyright © 2016年 hiko. All rights reserved.
//

#import "HDFTextPriorityMasonryViewController.h"

@interface HDFTextPriorityMasonryViewController(){

    UILabel         *lblHorizontalName;
    UILabel         *lblHorizontalDesc;
}
@end

@implementation HDFTextPriorityMasonryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        //左右布局，左右文字优先级显示问题
    [self initHeaderTextHorizontal];

}

#pragma mark - 左右文字显示优先级

/**
 * 左右文字优先级
 */
-(void)initHeaderTextHorizontal{
    //顶部容器
    UIView *topContaier = [[UIView alloc] init];
    [self.view addSubview:topContaier];
    topContaier.backgroundColor = [UIColor lightGrayColor];
    [topContaier mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.height.equalTo(@200);
    }];
    
    //设置名字按钮
    UIButton *btnSettingName = [[UIButton alloc] init];
    [btnSettingName setTitle:@"设置名字" forState:UIControlStateNormal];
    [topContaier addSubview:btnSettingName];
    [btnSettingName addTarget:self action:@selector(setName) forControlEvents:UIControlEventTouchUpInside];
    [btnSettingName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.right.equalTo(@-100);
    }];
    
    //设置描述按钮
    UIButton *btnSettingDesc = [[UIButton alloc] init];
    [btnSettingDesc setTitle:@"设置描述" forState:UIControlStateNormal];
    [topContaier addSubview:btnSettingDesc];
    [btnSettingDesc addTarget:self action:@selector(setDesc) forControlEvents:UIControlEventTouchUpInside];
    [btnSettingDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(@0);
    }];
    
    
    //姓名优先级btn
    UIButton *btnSetNamePriority = [[UIButton alloc] init];
    [btnSetNamePriority setTitle:@"姓名优先" forState:UIControlStateNormal];
    [topContaier addSubview:btnSetNamePriority];
    [btnSetNamePriority addTarget:nil action:@selector(setNamePriority) forControlEvents:UIControlEventTouchUpInside];
    [btnSetNamePriority mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.equalTo(@-50);
    }];
    
    //描述优先级btn
    UIButton *btnSetDescPriority = [[UIButton alloc] init];
    [btnSetDescPriority setTitle:@"科室优先" forState:UIControlStateNormal];
    [topContaier addSubview:btnSetDescPriority];
    [btnSetDescPriority addTarget:nil action:@selector(setDescPriority) forControlEvents:UIControlEventTouchUpInside];
    [btnSetDescPriority mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@100);
        make.bottom.equalTo(@-50);
    }];
    
    
    [self setButtonStyle:btnSettingDesc];
    [self setButtonStyle:btnSettingName];
    [self setButtonStyle:btnSetDescPriority];
    [self setButtonStyle:btnSetNamePriority];
    
    //头像
    UIImageView *ivAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_doctor_head"]];
    [topContaier addSubview:ivAvatar];
    [ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@5);
        make.width.height.equalTo(@80);
    }];
    
    //姓名
    lblHorizontalName = [[UILabel alloc] init];
    [topContaier addSubview:lblHorizontalName];
    lblHorizontalName.text = @"杨立峰";
    lblHorizontalName.font =[UIFont systemFontOfSize:15];
    lblHorizontalName.backgroundColor =[UIColor yellowColor];
    [lblHorizontalName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ivAvatar.mas_right).offset(5);
        make.top.equalTo(ivAvatar);
    }];
    
    //职称  与姓名间隔5像素，右侧距父视图10像素
    lblHorizontalDesc = [[UILabel alloc] init];
    [topContaier addSubview:lblHorizontalDesc];
    lblHorizontalDesc.text = @"北京协和医院 主治医师";
    lblHorizontalDesc.backgroundColor = [UIColor redColor];
    [lblHorizontalDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-10));
        make.top.equalTo(lblHorizontalName);
        make.left.equalTo(lblHorizontalName.mas_right).offset(5);
    }];
}

-(void)setButtonStyle:(UIButton *)btn{
    btn.backgroundColor =[UIColor blueColor];
    btn.layer.cornerRadius  =5;
    [btn setClipsToBounds:YES];
}

-(void)setName{
    if ([lblHorizontalName.text isEqualToString:@"杨立峰"]) {
        lblHorizontalName.text = @"杨立峰.藏族医生姓名很长很长";
    }else{
        lblHorizontalName.text = @"杨立峰";
    }
}

-(void)setDesc{
    if ([lblHorizontalDesc.text isEqualToString:@"北京协和医院 主治医师"]) {
        lblHorizontalDesc.text = @"协和大夫";
    }else{
        lblHorizontalDesc.text = @"北京协和医院 主治医师";
    }
}

-(void)setNamePriority{
//    Required = 1000,
//    DefaultHigh = 750,
//    DefaultLow = 250,
//    FittingSizeLevel = 50
    
//    ContentCompressionResistance = 不许挤我！这个属性的优先级（Priority）越高，越不“容易”被压缩
//    ,也就是说，当整体的空间装不小所有的View的时候，Content Compression Resistance优先级越高的，现实的内容越完整。
    
//    Content Hugging = 抱紧！
//    这个属性的优先级越高，整个View就要越“抱紧”View里面的内容。也就是View的大小不会随着父级View的扩大而扩大。
    
    [lblHorizontalName setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [lblHorizontalName setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    
    [lblHorizontalDesc setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [lblHorizontalDesc setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
}

-(void)setDescPriority{
    [lblHorizontalName setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [lblHorizontalName setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
    [lblHorizontalDesc setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [lblHorizontalDesc setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
}


//#pragma 



@end
