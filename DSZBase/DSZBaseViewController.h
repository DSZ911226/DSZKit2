//
//  DSZBaseViewController.h
//  Demo
//
//  Created by zhilvmac on 2017/10/23.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSZBaseViewController : UIViewController

/**
 隐藏返回按钮.
 */
@property(nonatomic,assign)BOOL backHidden;

/**
 返回按钮的回调
 */
-(void)back;
@end
