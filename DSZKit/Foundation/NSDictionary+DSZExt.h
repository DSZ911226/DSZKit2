//
//  NSDictionary+DSZExt.h
//  DSZ
//
//  Created by DSZ on 15/10/2.
//  Copyright © 2015年 DSZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DSZExt)

/**
 *  此方法避免字典越界导致的crach
 *  传入 key 不存在时，程序返回 nil
 *
 *  @return object
 */
- (id)objectOrNilForKey:(NSString *)key;

/**
 Returns a new array containing the dictionary's keys sorted.
 The keys should be NSString, and they will be sorted ascending.
 
 @return A new array containing the dictionary's keys,
 or an empty array if the dictionary has no entries.
 */
- (NSArray *)allKeysSorted;

/**
 Returns a new array containing the dictionary's values sorted by keys.
 
 The order of the values in the array is defined by keys.
 The keys should be NSString, and they will be sorted ascending.
 
 @return A new array containing the dictionary's values sorted by keys,
 or an empty array if the dictionary has no entries.
 */
- (NSArray *)allValuesSortedByKeys;

/**
 Returns a BOOL value tells if the dictionary has an object for key.
 
 @param key The key.
 */
- (BOOL)containsObjectForKey:(id)key;

/**
 Returns a new dictionary containing the entries for keys.
 If the keys is empty or nil, it just returns an empty dictionary.
 
 @param keys The keys.
 
 @return The entries for the keys.
 */
- (NSDictionary *)entriesForKeys:(NSArray *)keys;

/**
 Convert dictionary to json string. return nil if an error occurs.
 */
- (NSString *)jsonStringEncoded;

/**
 Convert dictionary to json string formatted. return nil if an error occurs.
 */
- (NSString *)jsonPrettyStringEncoded;


/**
 *  Json格式字符串转字典
 *
 *  @param jsonString json格式字符串
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 Try to parse an XML and wrap it into a dictionary.
 If you just want to get some value from a small xml, try this.
 
 example XML: "<config><a href="test.com">link</a></config>"
 example Return: @{@"_name":@"config", @"a":{@"_text":@"link",@"href":@"test.com"}}
 
 @param xmlDataOrPath XML in NSData or NSString format.
 
 @return Return a new dictionary, or nil if an error occurs.
 */
+ (NSDictionary *)dictionaryWithXML:(id)xmlDataOrPath;

@end


/**
 Provide some some common method for `NSMutableDictionary`.
 */
@interface NSMutableDictionary (DSZExt)

/**
 Removes and returns the value associated with a given key.
 
 @param aKey The key for which to return and remove the corresponding value.
 
 @return The value associated with aKey, or nil if no value is associated with aKey.
 */
- (id)popObjectForKey:(id)aKey;

/**
 Returns a new dictionary containing the entries for keys, and remove these
 entries from reciever. If the keys is empty or nil, it just returns an
 empty dictionary.
 
 @param keys The keys.
 
 @return The entries for the keys.
 */
- (NSDictionary *)popEntriesForKeys:(NSArray *)keys;

@end



