//
//  MASCompositeConstraint+hasInstalled.m
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/7/11.
//  Copyright © 2016年 hiko. All rights reserved.
//

#import "MASCompositeConstraint+hasInstalled.h"
#import <objc/runtime.h>
#import "MASViewConstraint+hasIntalled.h"
//#import <objc/message.h>

@implementation MASCompositeConstraint (hasInstalled)

-(BOOL)hasInstalled{
//    NSMutableArray *arr =  [self valueForKey:@"childConstraints"];
    
    Ivar itemIvar =  class_getInstanceVariable([MASCompositeConstraint class], "_childConstraints");
    NSMutableArray *arr = object_getIvar(self, itemIvar);
    
    for (MASViewConstraint *itemCons in arr) {
         BOOL hasInstall =  [itemCons hasInstalled];
        if (hasInstall == NO) {
            return NO;
        }
    }
    return YES;
}
@end
