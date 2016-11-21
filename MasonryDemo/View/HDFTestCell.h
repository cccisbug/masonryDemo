

#import <UIKit/UIKit.h>

typedef void (^TestBlock)(NSIndexPath *indexPath);

@class HDFTestModel;
@interface HDFTestCell : UITableViewCell

@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UILabel       *descLabel;
@property (nonatomic, strong) NSIndexPath   *indexPath;

@property (nonatomic, copy) TestBlock       block;

- (void)configCellWithModel:(HDFTestModel *)model;
+ (CGFloat)heightWithModel:(HDFTestModel *)model;

@end
