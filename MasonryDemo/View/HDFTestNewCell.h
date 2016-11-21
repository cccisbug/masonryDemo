

#import <UIKit/UIKit.h>

typedef void (^TestBlock)(NSIndexPath *indexPath);

@class HDFTestModel;
@interface HDFTestNewCell : UITableViewCell

@property (nonatomic, strong) NSIndexPath   *indexPath;
@property (nonatomic, copy) TestBlock       block;

- (void)configCellWithModel:(HDFTestModel *)model;

@end
