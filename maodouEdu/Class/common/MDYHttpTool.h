//
//  MDYHttpTool.h
//  maodouEdu
//
//  Created by zhukeshuai on 15/10/16.
//  Copyright © 2015年 zks. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^HTTPSuccessBlock)(BOOL successed,id JSON,NSError *error);
//typedef void (^HTTPFailureBlock)(NSError *error);
@interface MDYHttpTool : NSObject
+ (void)getWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success;
+ (void)postWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success;
@end
