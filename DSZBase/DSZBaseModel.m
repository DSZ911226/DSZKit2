//
//  DSZBaseModel.m
//  Demo
//
//  Created by zhilvmac on 2017/10/23.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import "DSZBaseModel.h"
#import <DSZKitMacro.h>
@implementation DSZBaseModel
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"ID",@"description":@"m_description"}];
}
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

-(BOOL)hasNoError
{
    if ([self.resultcode intValue] != 200) {
        return NO;
    }
    return YES;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self dsz_init];
    }
    return self;
}

- (void)dsz_init {
    DAssert(0)
    DSZLog(@"必须重写父类方法");
}

- (void)dealloc {
    DSZLog(@"DSZBaseModel");
}

@end
