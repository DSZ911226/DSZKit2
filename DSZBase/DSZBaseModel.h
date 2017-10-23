//
//  DSZBaseModel.h
//  Demo
//
//  Created by zhilvmac on 2017/10/23.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface DSZBaseModel : JSONModel
@property (nonatomic, strong)NSString *resultcode;

@property (nonatomic, strong)NSString *reason;

-(BOOL)hasNoError;


/**
 子类需要重写的方法
 */
- (void)dsz_init;

@end
