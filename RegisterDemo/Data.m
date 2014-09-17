//
//  Data.m
//  RegisterDemo
//
//  Created by 林过寒 on 9/12/14.
//  Copyright (c) 2014 Clemosn University. All rights reserved.
//

#import "Data.h"
@implementation Data

-(NSDictionary*)errorInfo
{
    if (!_errorInfo) {
        _errorInfo = [[NSDictionary alloc]init];
        _errorInfo = @{@"0":@"success",
                       @"1":@"email is null",
                       @"2":@"email format wrong",
                       @"3":@"username is null",
                       @"4":@"username is exist",
                       @"5":@"password is null",
                       @"6":@"password so short",
                       @"7":@"password mismacthing",
                       @"8":@"user is not exist",
                       @"9":@"passward is wrong"};
    }
    return _errorInfo;
}

-(NSMutableDictionary*)userInfo
{
    if (!_userInfo) {
        _userInfo = [NSMutableDictionary dictionaryWithCapacity:10];
        [_userInfo setObject:@"123456" forKey:@"user1"];
        [_userInfo setObject:@"654321" forKey:@"user2"];
    }
    return _userInfo;
}

-(void)adduser:(NSString*) username Password:(NSString*)password;
{
    
}

@end
