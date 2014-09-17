//
//  RegisterCheck.h
//  RegisterDemo
//
//  Created by 林过寒 on 9/8/14.
//  Copyright (c) 2014 Clemosn University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterCheck : NSObject
@property (strong,nonatomic) NSString* username;
@property (strong,nonatomic) NSString* email;
@property (strong,nonatomic) NSString* password1;
@property (strong,nonatomic) NSString* password2;

-(NSString*)checkName:(NSString*)username;
-(NSString*)checkPassword1:(NSString*)password1;
-(NSString*)checkPassword1:(NSString*)password1 Password2:(NSString*)password2;
-(NSString*)checkEmail:(NSString*)email;
-(void)registerWithName:(NSString *)username Password:(NSString *)password;
-(NSString*)login:(NSString*)username Password:(NSString*)password;

@end
