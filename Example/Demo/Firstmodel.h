//
//  Firstmodel.h
//  Demo
//
//  Created by zhilvmac on 2017/8/28.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import <DSZKit/DSZKit.h>
#import "DSZBaseModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface Firstmodel : DSZBaseModel
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *ID;
+ (RACSignal *)buzhidao;
@end
