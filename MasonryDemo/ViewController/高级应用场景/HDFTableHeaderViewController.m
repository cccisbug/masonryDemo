//
//  HDFTableHeaderViewController.m
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/7/7.
//  Copyright © 2016年 hiko. All rights reserved.
//

#import "HDFTableHeaderViewController.h"
#import "HDFDefine.h"

@interface HDFTableHeaderViewController ()
{
 
    UITableView     *tableView;
    UIView          *customeHeaderView;
    UILabel         *tableLblDesc;
}
@end

@implementation HDFTableHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UItableView的haderview使用约束
    [self initWidgetWithTableHeader];
}


#pragma mark - tableView的headerView使用Masonry

/**
 *  customeHeaderView 使用Masonry
 */
-(void)initWidgetWithTableHeader{
    
    //初始化tableview
    tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    //headerView
    customeHeaderView = [[UIView alloc] initWithFrame:(CGRect){0,0,kScreenWidth,100}];
    //ccc 此处写0也可以
    customeHeaderView.backgroundColor = [UIColor yellowColor];
    tableView.tableHeaderView = customeHeaderView;
    //ccc 一定不可以对customeHeaderView添加约束,虽然其superview就是tableview
    
    //说明文字
    tableLblDesc = [UILabel new];
    [customeHeaderView addSubview:tableLblDesc];
    [tableLblDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@20);
        make.width.equalTo(@200);
    }];
    tableLblDesc.numberOfLines = 0;
    tableLblDesc.text = @"tableHeaderView使用Masonry";
    
    
    UIButton *btnReSetContent = [UIButton new];
    [customeHeaderView addSubview:btnReSetContent];
    [btnReSetContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(@0);
    }];
    [btnReSetContent setBackgroundColor:[UIColor blueColor]];
    btnReSetContent.layer.cornerRadius = 4;
    [btnReSetContent setClipsToBounds:YES];
    [btnReSetContent setTitle:@"设置文字" forState:UIControlStateNormal];
    [btnReSetContent addTarget:self action:@selector(resetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self updateTabelHeaderHeight];
}

-(void)resetBtnClick:(id)sender{
    if ([tableLblDesc.text isEqualToString:@"tableHeaderView使用Masonry"]) {
        tableLblDesc.text = @"文字很长文字很长文字很长文字很长文字很长文字很长文字很长文字很长文字很长文字很长文字很长文字很长";
    }else{
        tableLblDesc.text = @"tableHeaderView使用Masonry";
    }
    
    [self updateTabelHeaderHeight];
}

-(void)updateTabelHeaderHeight{
    //ccc 因为headerView使用的是frame
    [customeHeaderView layoutIfNeeded];
    CGRect headerRect = customeHeaderView.frame;
    headerRect.size.height = tableLblDesc.frame.origin.y+ tableLblDesc.frame.size.height;
    customeHeaderView.frame  = headerRect;
    tableView.tableHeaderView = customeHeaderView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
