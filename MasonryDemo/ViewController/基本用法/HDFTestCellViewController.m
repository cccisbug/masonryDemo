

#import "HDFTestCellViewController.h"
#import "UITableViewCell+HDFTableViewCell.h"
#import "HDFTestModel.h"
#import "HDFMasTestCell.h"

@interface HDFTestCellViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) NSMutableArray    *dataSource;

@end

@implementation HDFTestCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    for (int i = 0; i < 10; ++i)
    {
        HDFTestModel *model = [[HDFTestModel alloc] init];
        model.title = [NSString stringWithFormat:@"%d",i];
        model.desc = @"本文调研Xcode的版本是 7.1，基本是探索了菜单的每一个按钮。虽然从xcode4一直用到了xcode7，但是一般都只是用了一些基础的功能，说来也惭愧。在一次偶然的机遇突然发现了“显示调用层级”的选项";
        model.content = [self getSumStr:abs(i-5)];
        
        [self.dataSource addObject:model];
    }
    
    [self.tableView reloadData];
}

-(NSString *)getSumStr:(int)index{
    NSMutableString *mutableStr = [NSMutableString string];
    for (int i = 0; i <= index; i++) {
        [mutableStr appendString:@"我和上下两个灰条是封装控件，随内容改变高度。\n"];
    }
    return mutableStr;
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
    
    HDFMasTestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[HDFMasTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    HDFTestModel *model = [self.dataSource objectAtIndex:indexPath.row];
    [cell configCellWithModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HDFTestModel *model = [self.dataSource objectAtIndex:indexPath.row];
    return [HDFMasTestCell hdf_heightForIndexPath:indexPath configBlock:^(UITableViewCell *sourceCell) {
        HDFMasTestCell *cell = (HDFMasTestCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    }];
}

@end
