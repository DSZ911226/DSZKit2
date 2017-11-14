//
//  CommonMultipleSelectViewController.h
//  ls
//
//  Created by Alonezzz on 2017/6/25.
//  Copyright © 2017年 浙江智旅信息有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSZSelectModel : NSObject
/**
 显示的名称
 */
@property(nonatomic,copy)NSString * _Nullable name;
/**
 唯一的id
 */
@property(nonatomic,copy)NSString * _Nullable ID;
/**
 是否被选择 融于用于内部使用
 */
@property(nonatomic,assign)BOOL isSelected;

/**
 便利构造器

 @param name 名称
 @param ID 唯一id
 @param isSelected 是否被选择
 @return 你懂的
 */
+ (DSZSelectModel *_Nullable)initWithname:(NSString *_Nullable)name ID:(NSString *_Nullable)ID isSelected:(BOOL)isSelected;
@end


/**
 选择的返回的结果集合

 @param result 返回的选择的结果集合
 */
typedef void (^SelectResult)(NSArray * _Nullable result);
@interface DSZMultipleSelectViewController : UIViewController
/**
 滚动试图
 */
@property (nonatomic, strong)UITableView * _Nullable tableView;
/**
 存放的模型
 */
@property(nonatomic,strong)NSMutableArray * _Nullable dataSource;//
/**
 存放的的keys
 */
@property(nonatomic,strong)NSMutableArray * _Nullable currentSelecteds;
/**
 返回的结果
 */
@property(nonatomic,copy)SelectResult _Nullable result;




/**
 单选

 @param key 唯一的key model的关键字
 @param nameKey 名称所对应的model 的key
 @return 对象
 */
- (instancetype _Nullable)initWithNameKey:( NSString * _Nonnull )key nameKey:(NSString * _Nonnull)nameKey;

/**
 多选

 @param key  唯一的key model的关键字
 @param nameKey 名称所对应的model 的key
 @param maxSelectedNum 最多选的个数
 @param minSelectedNum 最少允许选的个数
 @return 对象
 */
- (instancetype _Nullable )initWithNameKey:( NSString * _Nonnull )key nameKey:(NSString * _Nonnull)nameKey maxSelectedNum:(NSInteger)maxSelectedNum minSelectedNum:(NSInteger)minSelectedNum;

@end


