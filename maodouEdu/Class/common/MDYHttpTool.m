//
//  MDYHttpTool.m
//  maodouEdu
//
//  Created by zhukeshuai on 15/10/16.
//  Copyright © 2015年 zks. All rights reserved.
//

#import "MDYHttpTool.h"
#import "AFHTTPRequestOperationManager.h"

@implementation MDYHttpTool
+ (void)getWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success
{
    [self requestWith:url parameters:parameters success:success method:@"GET"];
}
+ (void)postWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success
{
    [self requestWith:url parameters:parameters success:success method:@"POST"];
}

+ (void)requestWith:(NSString *)url parameters:(NSDictionary *)parameters success:(HTTPSuccessBlock)success method:(NSString *)method
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
        [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            if (success == nil) return ;
            if(success){
                if ([method isEqualToString:@"POST"]) {
                     NSError* error = nil;
                    if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
                        NSDictionary* lResult = (NSDictionary*)responseObject;
                        NSNumber *status=[lResult objectForKey:@"status"];
                        if (!status || ![status isEqual:@1]) {
                            //接口调用失败
                            NSString *msgFromBackEnd = [lResult objectForKey:@"message"];
                            success(false,nil,error);
                        }else{
                            success(true,responseObject,nil);
                        }
                    }else{
                        error = [self getErrorWithMessage:@"接口返回数据为空"];
                        success(false,nil,error);
                        
                    }
                }else{
                    success(true,responseObject,nil);
                }
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            success(false,nil,error);
        }];
    
}
+ (NSError *)getErrorWithMessage:(NSString *)message
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:@"毛豆牙接口异常" code:6789 userInfo:userInfo];
    return error;
}
@end
