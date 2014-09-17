//
//  RegisterCheck.m
//  RegisterDemo
//
//  Created by 林过寒 on 9/8/14.
//  Copyright (c) 2014 Clemosn University. All rights reserved.
//

#import "RegisterCheck.h"
#import "Data.h"
@interface RegisterCheck()
@property(strong,nonatomic)Data* data;

@end

@implementation RegisterCheck

-(Data*)data
{
    if (!_data) {
        _data = [[Data alloc]init];
    }
    return _data;
}

-(NSString*) checkName:(NSString*)username
{
    NSString* checkResult = nil;
    if(username == nil || username == NULL || [username isKindOfClass:[NSNull class]] || ([[username stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0))
    {
        checkResult = [self.data.errorInfo objectForKey:@"3"];
    }else if ([self.data.userInfo objectForKey:username]) {
        checkResult = [self.data.errorInfo objectForKey:@"4"];
    }else{
        checkResult = [self.data.errorInfo objectForKey:@"0"];
    }
    return checkResult;
}

- (NSString *)checkPassword1:(NSString*)password1
{
    NSString* checkResult = nil;
    if(password1 == nil || password1 == NULL || [password1 isKindOfClass:[NSNull class]] || ([[password1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0))
    {
        checkResult = [self.data.errorInfo objectForKey:@"5"];
    }else if (password1.length < 6 ) {
        checkResult = [self.data.errorInfo objectForKey:@"6"];
    }else{
        checkResult = [self.data.errorInfo objectForKey:@"0"];
    }
    return checkResult;
}

-(NSString*)checkPassword1:(NSString *)password1 Password2:(NSString *)password2
{
    NSString* checkResult = nil;
    // first check the password1 before check password2
    checkResult = [self checkPassword1:password1];
    if ([checkResult isEqualToString:@"success"])
    {
        // check password2 and password1 是不是一样
        if([password2 isEqualToString:password1] )
            {
                checkResult = [self.data.errorInfo objectForKey:@"0"];
            }else{
                checkResult = [self.data.errorInfo objectForKey:@"7"];
            }
    }
    return checkResult;
}

-(NSString*)checkEmail:(NSString*)email
{
    NSString* checkResult = nil;
    if(email == nil || email == NULL || [email isKindOfClass:[NSNull class]] || ([[email stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0))
    {
        checkResult = [self.data.errorInfo objectForKey:@"1"];
    }else {
        NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        if(![emailTest evaluateWithObject:email])
        {
            checkResult = [self.data.errorInfo objectForKey:@"2"];
        }
    }
    if (! checkResult) {
        checkResult = [self.data.errorInfo objectForKey:@"0"];
    }
    return checkResult;
}

-(NSString*)login:(NSString*)username Password:(NSString*)password
{
    NSString* checkResult = nil;
    if(username == nil || username == NULL || [username isKindOfClass:[NSNull class]] || ([[username stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0)) {
        checkResult = [self.data.errorInfo objectForKey:@"3"];
    }else if(password == nil || password == NULL || [password isKindOfClass:[NSNull class]] || ([[password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0)){
        checkResult = [self.data.errorInfo objectForKey:@"5"];
    } else if (![self.data.userInfo objectForKey:username]){
        checkResult = [self.data.errorInfo objectForKey:@"8"];
    }else if ([[self.data.userInfo objectForKey:username] isEqualToString:password]){
        checkResult = [self.data.errorInfo objectForKey:@"0"];
    } else{
        checkResult = [self.data.errorInfo objectForKey:@"9"];
    }
    return checkResult;
}

-(void)registerWithName:(NSString *)username Password:(NSString *)password
{
    [self.data.userInfo setObject:password forKey:username];
}
@end
