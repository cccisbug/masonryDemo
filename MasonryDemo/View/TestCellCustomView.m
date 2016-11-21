//
//  TestCellCustomView.m
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/5/12.
//  Copyright © 2016年 hiko. All rights reserved.
//

#import "TestCellCustomView.h"
#import "Masonry.h"

@interface TestCellCustomView(){
    UILabel             *lblContent;
}

@end
@implementation TestCellCustomView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self addWidgets];
    }
    return self;
}


-(void)addWidgets{
    UIView *vTopLine = [[UIView alloc] init];
    vTopLine.backgroundColor = [UIColor grayColor];
    [self addSubview:vTopLine];
    [vTopLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@5);
    }];
    
    lblContent = [[UILabel alloc] init];
    lblContent.numberOfLines = 0;
    [self addSubview:lblContent];
    [lblContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.width.equalTo(@300);
        make.top.equalTo(vTopLine.mas_bottom);
    }];
    
    
    UIView *vTopBottom = [[UIView alloc] init];
    vTopBottom.backgroundColor = [UIColor grayColor];
    [self addSubview:vTopBottom];
    [vTopBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lblContent.mas_bottom);
        make.left.right.equalTo(@0);
        make.height.equalTo(@5);
        make.bottom.equalTo(@0);
    }];
    
    MASAttachKeys(vTopLine,lblContent,vTopBottom);
    
//    [self mas_makeConstraints:^(MASConstraintMaker *make) {
//        //ccc 这里必须加底部约束
//        make.bottom.equalTo(vTopBottom.mas_bottom);
//    }];

}


-(void)setText:(NSString *)text{
    lblContent.text = text;
}

@end
