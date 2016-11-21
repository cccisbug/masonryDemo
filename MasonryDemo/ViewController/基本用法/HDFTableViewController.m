

#import "HDFTableViewController.h"
#import "UITableViewCell+HDFTableViewCell.h"
#import "HDFTestModel.h"
#import "HDFTestCell.h"
#import "HDFTestNewCell.h"

@interface HDFTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *dataSource;

@end

@implementation HDFTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"圣诞节法律考试都放假了");
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    for (NSUInteger i = 0; i < 10; ++i)
    {
        HDFTestModel *model = [[HDFTestModel alloc] init];
        model.title = @"对 Xcode 菜单选项的详细探索";
        model.desc = @"本文调研Xcode的版本是 7.1，基本是探索了菜单的每一个按钮。虽然从xcode4一直用到了xcode7，但是一般都只是用了一些基础的功能，说来也惭愧。在一次偶然的机遇突然发现了“显示调用层级”的选项才知道菜单了的按钮并不都是没有用，而是很有用只是你不知道罢了。 本想这种东西仔细总结了也不一定有价值还耽误时间，但是两个想法最终还是驱动了我仔细弄完，一是xcode7.1才刚更新没多久，这个时效性还行（xcode每年菜单变化都不小）；二是这种文章属于干货性质，自己有时在大项目中不确定或者害怕一下点错了的时候可以来回看一下，并且其他博友也可以查询。 ";
        
        [self.dataSource addObject:model];
    }
    
    [self.tableView reloadData];
}

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [[NSMutableArray alloc] init];
    }
    
    return _dataSource;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    
    HDFTestNewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[HDFTestNewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.indexPath = indexPath;
    cell.block = ^(NSIndexPath *path) {
        [tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    HDFTestModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [cell configCellWithModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    HDFTestModel *model = [self.dataSource objectAtIndex:indexPath.row];
    
    return [HDFTestCell heightWithModel:model];
     */
    HDFTestModel *model = [self.dataSource objectAtIndex:indexPath.row];
    return [HDFTestNewCell hdf_heightForIndexPath:indexPath configBlock:^(UITableViewCell *sourceCell) {
        HDFTestNewCell *cell = (HDFTestNewCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    }];
}

@end
