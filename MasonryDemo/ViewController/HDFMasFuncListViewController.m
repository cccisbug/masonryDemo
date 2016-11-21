

#import "HDFMasFuncListViewController.h"
#import "HDFBasicViewController.h"
#import "HDFUpdateConstraintsViewController.h"
#import "HDFRemakeContraintsViewController.h"
#import "HDFTotalUpdateViewController.h"
#import "HDFAspectFitViewController.h"
#import "HDFScrollViewController.h"
#import "HDFScrollComplexViewController.h"
#import "HDFTableViewController.h"
#import "HDFScrollVIewReallyViewController.h"
#import "HDFTestCellViewController.h"
#import "HDFTextPriorityMasonryViewController.h"
#import "HDFTableHeaderViewController.h"
#import "HDFContentAdjustLayoutViewController.h"
#import "HDFEqualWidthViewController.h"

@interface HDFMasFuncListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray       *arrViewCtrl;  //!<具体功能视图控制器
@property (nonatomic, strong) UITableView   *tableView;  //!<表格

@end

@implementation HDFMasFuncListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    self.arrViewCtrl = @[@[
                         [[HDFBasicViewController alloc] initWithTitle:@"基础使用"],
                         [[HDFAspectFitViewController alloc] initWithTitle:@"约束百分比"],
                         [[HDFScrollViewController alloc] initWithTitle:@"ScrollView布局"],
                         [[HDFScrollComplexViewController alloc] initWithTitle:@"单个约束启用禁用"],
                         [[HDFTableViewController alloc] initWithTitle:@"简单tableview布局"],
                         [[HDFScrollVIewReallyViewController alloc] initWithTitle:@"ScrollView约束正确用法"],
                         [[HDFTestCellViewController alloc] initWithTitle:@"Cell中隐藏控件更新布局"],
                         ],
                         
                         @[[[HDFUpdateConstraintsViewController alloc] initWithTitle:@"动画更新约束"],
                           [[HDFRemakeContraintsViewController alloc] initWithTitle:@"动画重新添加约束"],
                           [[HDFTotalUpdateViewController alloc] initWithTitle:@"整体动画更新约束"],
                          ],
                         
                         @[
                         [[HDFTableHeaderViewController alloc] initWithTitle:@"项目应用：tableHeaderView使用Masonry"],
                         [[HDFContentAdjustLayoutViewController alloc] initWithTitle:@"项目应用：垂直动态布局"],
                         [[HDFEqualWidthViewController alloc] initWithTitle:@"项目应用：文字区域等宽"],
                         ],
                         
                         @[[[HDFTextPriorityMasonryViewController alloc] initWithTitle:@"同向文字优先级"]]
                         ];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellIdentifier = @"CellIdentifier";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    
    cell.textLabel.text = [self getViewController:indexPath].title;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrViewCtrl[section] count];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title;
    switch (section) {
        case 0:
            title  = @"1、基础篇";
            break;
        case 1:
            title  = @"2、masonry使用动画篇";
            break;
        case 2:
            title  = @"3、项目高级应用篇";
            break;
        case 3:
            title  = @"4、第三方高级应用";
            break;
        default:
            break;
    }
    return title;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrViewCtrl.count;
}

-(UIViewController *)getViewController:(NSIndexPath *)indexPath{
    return  self.arrViewCtrl[indexPath.section][indexPath.row];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = [self getViewController:indexPath];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
