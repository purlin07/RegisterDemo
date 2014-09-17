//
//  Data.h
//  RegisterDemo
//
//  Created by 林过寒 on 9/12/14.
//  Copyright (c) 2014 Clemosn University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject
@property (strong,nonatomic) NSDictionary* errorInfo;
@property (strong,nonatomic) NSMutableDictionary* userInfo;

-(void)adduser:(NSString*) username Password:(NSString*)password;
@end
