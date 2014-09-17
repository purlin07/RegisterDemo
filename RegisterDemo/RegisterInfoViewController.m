//
//  RegisterInfoViewController.m
//  RegisterDemo
//
//  Created by 林过寒 on 9/12/14.
//  Copyright (c) 2014 Clemosn University. All rights reserved.
//

#import "RegisterInfoViewController.h"
#import "Data.h"
@interface RegisterInfoViewController ()
@property(strong,nonatomic)Data* data;
@end

@implementation RegisterInfoViewController
-(Data*)data
{
    if (!_data)
    {
        _data = [[Data alloc]init];
    }
    return _data;
}

@end
