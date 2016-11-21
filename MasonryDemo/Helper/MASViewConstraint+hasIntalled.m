//
//  MASViewConstraint+hasIntalled.m
//  MasonryDemo
//
//  Created by CuiGuiXiang on 16/7/11.
//  Copyright © 2016年 hiko. All rights reserved.
//

#import "MASViewConstraint+hasIntalled.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation MASViewConstraint (hasIntalled)

-(BOOL)hasInstalled{
//    u_int methodCount = 0;
    
    SEL itemSel = sel_registerName("hasBeenInstalled");
//    class_getClassMethod([MASViewConstraint class], itemSel);
    BOOL hasInstalled = ((BOOL (*)(id, SEL))objc_msgSend)((id)self, itemSel);
    return hasInstalled;
    
//    Method *methods = class_copyMethodList([MASViewConstraint class], &methodCount);
//    for (int i = 0; i< methodCount; i++) {
//        Method itemMethod = methods[i];
//        SEL itemSel = method_getName(itemMethod);
////        NSLog(@"方法: %@",[NSString stringWithUTF8String:sel_getName(itemSel)]);
//        if ([@"hasBeenInstalled" isEqualToString:[NSString stringWithUTF8String:sel_getName(itemSel)]]) {
//            BOOL hasInstalled = ((BOOL (*)(id, SEL))objc_msgSend)((id)self, itemSel);
//            return hasInstalled;
//        };
//    }
//    return NO;
};

@end
