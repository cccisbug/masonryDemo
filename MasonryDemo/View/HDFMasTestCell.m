

#import "HDFMasTestCell.h"
#import "HDFTestModel.h"
#import "Masonry.h"
#import "UITableViewCell+HDFTableViewCell.h"
#import "TestCellCustomView.h"
#import "HDFDefine.h"

@interface HDFMasTestCell ()

@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UILabel       *descLabel;
@property (nonatomic, strong) UIView        *bottomView;
@property (nonatomic, strong) TestCellCustomView        *testCustomView;
@property (nonatomic, strong) UILabel *lblBottom;

@end

@implementation HDFMasTestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.mas_key = @"titleLabel";
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(15);
            make.right.mas_equalTo(self.contentView).offset(-15);
            make.top.mas_equalTo(5);
        }];
        
        self.descLabel = [[UILabel alloc] init];
        self.descLabel.textColor = [UIColor blackColor];
        self.descLabel.font = [UIFont systemFontOfSize:13];
        self.descLabel.numberOfLines = 0;
        self.descLabel.textAlignment = NSTextAlignmentLeft;
        self.descLabel.mas_key = @"descLabel";
        [self.contentView addSubview:self.descLabel];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(15);
            make.right.mas_equalTo(self.contentView).offset(-15);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        }];
        
        //ccc这里给指定一个大概的frame，如果不指定，其子控件会因为总高度是0而报约束问题
        _testCustomView = [[TestCellCustomView alloc] initWithFrame:(CGRect){0,0,0,100}];
        [self.contentView addSubview:_testCustomView];
        [_testCustomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.top.equalTo(_descLabel.mas_bottom);
           //ccc 这里也可以使用固定高度
//            make.height.equalTo(@100);
        }];
        
        self.testCustomView.mas_key = @"testCustomView";
        
        self.bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
            make.bottom.equalTo(@0);
        }];
        
        self.lblBottom = [[UILabel alloc] init];
        self.lblBottom.text = @"Cell中下方控件";
        [self.contentView addSubview:self.lblBottom];
        self.lblBottom.backgroundColor = [UIColor greenColor];
        [self.lblBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_testCustomView.mas_bottom);
            make.centerX.equalTo(@0);
        }];
        //ccc设置别名
//        MASAttachKeys(self.contentView,_titleLabel,_descLabel,_bottomView,_testCustomView);
        
        [self hdf_setCellLastView:self.lblBottom];
    }
    
    return self;
}

- (void)configCellWithModel:(HDFTestModel *)model
{
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desc;
    [_testCustomView setText:model.content];
    
    
    //ccc  这里当某个控件控制不显示时，也可以使用高度置为0，高度置为0时，如果是复杂的自定义控件，会报约束错误，如果是高度固定的自定义控件或者frame写的控件可以使用该方法
//    if ([model.title intValue]  >  5) {
//        [_testCustomView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@0);
//        }];
//    }else{
//        [_testCustomView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(@100);
//        }];
//    }
    
    
    //ccc 直接把下方控件顶部贴到要隐藏的控件顶部
    if ([model.title intValue]  >  5) {
        _testCustomView.hidden = YES;
        [self.lblBottom mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_testCustomView.mas_top);
            make.centerX.equalTo(@0);
        }];
    }else{
        _testCustomView.hidden = NO;
        
        [self.lblBottom mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_testCustomView.mas_bottom);
            make.centerX.equalTo(@0);
        }];
    }
    
    
    
}

@end
