//
//  HDFUIViewFactory.m
//  newDoctor
//  控件初始化封装类
//  Created by Celgold on 16/6/20.
//  Copyright © 2016年 haodf.com. All rights reserved.
//

#import "HDFUIViewFactory.h"

@implementation HDFUIViewFactory

#pragma mark - UIView

+ (UIView *)viewWithSuperView:(UIView *)superView
                  constraints:(void(^)(MASConstraintMaker *make))constraints {
    UIView *view = [[UIView alloc] init];
    [superView addSubview:view];
    view.backgroundColor = kCColor;
    if (superView && constraints) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    return view;
}

#pragma mark - UILabel

+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(int)fontSize
                 superView:(UIView *)superView
               constraints:(void(^)(MASConstraintMaker *make))constraints{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = kCColor;
    label.textColor = textColor;
    label.font = kFontWithSize(fontSize);
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 1;
    [superView addSubview:label];
    
    if (superView && constraints) {
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    } else {
        HDFAppLog(@"superView为nil或者constraints为nil，无法在内部自动添加约束");
    }
    return label;
}

#pragma mark - UIButton
+ (UIButton *)buttonWithTitle:(NSString *)title
                    superView:(UIView *)superView
                  constraints:(void(^)(MASConstraintMaker *make))constraints
                        click:(HDFButtonBlock)click {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = kCColor;
    if (superView) {
        [superView addSubview:button];
    }
//    button.hdf_touchUp = click;
    
    if (superView) {
        if (constraints) {
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                constraints(make);
            }];
        }
    }
    
    return button;
}

+ (UIButton *)buttonWithImage:(id)image
                    superView:(UIView *)superView
                  constraints:(void(^)(MASConstraintMaker *make))constraints
                        click:(HDFButtonBlock)click{
    UIButton *button = [HDFUIViewFactory buttonWithTitle:nil
                                               superView:superView
                                             constraints:constraints
                                                   click:click];
    if (image != nil) {
        if ([image isKindOfClass:[NSString class]]) {
            [button setImage:kImageWithName(image) forState:UIControlStateNormal];
        } else {
            [button setImage:image forState:UIControlStateNormal];
        }
    }
    return button;
}

#pragma mark - UIImageView

// image 可以是UIImage对象也可以是图片名称
+ (UIImageView *)imageViewWithImage:(id)image
                            superView:(UIView *)superView
                          constraints:(void(^)(MASConstraintMaker *make))constraints {
    UIImageView *imgView = [[UIImageView alloc] init];;
    if (image != nil) {
        if ([image isKindOfClass:[NSString class]]) {
            imgView.image = kImageWithName(image);
        } else {
            imgView.image = image;
        }
    }
    [superView addSubview:imgView];
    if (constraints) {
        if (superView) {
            [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                constraints(make);
            }];
        }
    }
    return imgView;
}

#pragma mark - UITableView

+ (UITableView *)tableViewWithSuperView:(UIView *)superView
                                  style:(UITableViewStyle)style
                          customConfig:(void(^)(UITableView *tableView))config
                            constraints:(void(^)(MASConstraintMaker *make))constraints{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    if (config) {
        config(tableView);
    }
    [superView addSubview:tableView];
    
    if (superView && constraints) {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
        }];
    }
    return tableView;
}


#pragma mark -常用封装
//灰色线
+ (UIView *)lineWithSuperView:(UIView *)superView
                          constraints:(void(^)(MASConstraintMaker *make))constraints{
    UIView *view = [[UIView  alloc] init];
    [superView addSubview:view];
    view.backgroundColor = kColorWith16RGB(0xdcdcdc);
    
    if (superView && constraints) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
            make.height.equalTo(@0.5);
        }];
    }
    return view;
}


//灰色间隔条，上下各有一条线
+ (UIView *)grayTowLineWithInSuperView:(UIView *)superView
                                height:(float)height
                           constraints:(void(^)(MASConstraintMaker *make))constraints{
    UIView *view = [[UIView  alloc] init];
    [superView addSubview:view];
//    view.backgroundColor = kG6Color;
    
    
    if (superView && constraints) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            constraints(make);
            make.height.mas_equalTo(height);
        }];
    }
    [HDFUIViewFactory lineWithSuperView:view constraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
    }];
    [HDFUIViewFactory lineWithSuperView:view constraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
    }];
    
    return view;

}



@end
