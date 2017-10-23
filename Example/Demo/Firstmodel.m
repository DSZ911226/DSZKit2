//
//  Firstmodel.m
//  Demo
//
//  Created by zhilvmac on 2017/8/28.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import "Firstmodel.h"
#import <MJExtension.h>
@implementation Firstmodel
- (void)dsz_init {
}

+ (RACSignal *)buzhidao {
    
    
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:RACTuplePack(@"1", @"2")];
        [subscriber sendCompleted];
        
        return nil;
    }];
    return signal;

    
    
    
}


@end
