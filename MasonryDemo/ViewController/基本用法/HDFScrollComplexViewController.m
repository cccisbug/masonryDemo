

#import "HDFScrollComplexViewController.h"
#import "MASViewConstraint+hasIntalled.h"

@interface HDFScrollComplexViewController ()

@property (nonatomic, strong) UIScrollView      *scrollView;
@property (nonatomic, strong) NSMutableArray    *expandStates;

@end

@implementation HDFScrollComplexViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.pagingEnabled = NO;
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *lastLabel = nil;
    for (NSUInteger i = 0; i < 10; ++i)
    {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.layer.borderColor = [UIColor greenColor].CGColor;
        label.layer.borderWidth = 2.0;
        label.text = [self randomText];
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
        [label addGestureRecognizer:tap];
        
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [self randomColor];
        [self.scrollView addSubview:label];
        
      __block  MASViewConstraint  *itemConstraint;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(self.view).offset(-15);
            
            if (lastLabel)
            {
                make.top.mas_equalTo(lastLabel.mas_bottom).offset(20);
            }
            else
            {
                make.top.mas_equalTo(self.scrollView).offset(20);
            }
            //指定约束赋值
            itemConstraint =  (MASViewConstraint *)make.height.mas_equalTo(40);
        }];
//        [itemConstraint install];
        
        NSLog(@"约束是否已安装 %d",[itemConstraint hasInstalled]);
        
//        [itemConstraint install];
        
        lastLabel = label;
        
        [self.expandStates addObject:[@[label, @(NO),itemConstraint] mutableCopy]];
    }
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        
        // 让scrollview的contentSize随着内容的增多而变化
        make.bottom.mas_equalTo(lastLabel.mas_bottom).offset(20);
    }];
}

- (NSMutableArray *)expandStates
{
    if (_expandStates == nil)
    {
        _expandStates = [[NSMutableArray alloc] init];
    }
    
    return _expandStates;
}

- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (NSString *)randomText
{
    CGFloat length = arc4random() % 150 + 5;
    
    NSMutableString *str = [[NSMutableString alloc] init];
    for (NSUInteger i = 0; i < length; ++i)
    {
        [str appendString:@"测试数据很长，"];
    }
    
    return str;
}

- (void)onTap:(UITapGestureRecognizer *)sender
{
    UIView *tapView = sender.view;
    
    NSUInteger index = 0;
    for (NSMutableArray *array in self.expandStates)
    {
        UILabel *view = [array firstObject];
        
        if (view == tapView)
        {
            NSNumber *state = [array objectAtIndex:1];
            MASViewConstraint    *itemConstraint = [array objectAtIndex:2];
            if ([state boolValue] == YES)
            {
                [itemConstraint install];
            }
            else
            {
                [itemConstraint uninstall];
            }
            
            [array replaceObjectAtIndex:1 withObject:@(!state.boolValue)];
            
            [self.view setNeedsUpdateConstraints];
            [self.view updateConstraintsIfNeeded];
            
            [UIView animateWithDuration:0.35 animations:^{
                [self.view layoutIfNeeded];
            } completion:^(BOOL finished) {
                
            }];
            break;
        }
        
        index++;
    }
}

@end
