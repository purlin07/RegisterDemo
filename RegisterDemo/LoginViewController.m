//
//  LoginViewController.m
//  RegisterDemo
//
//  Created by 林过寒 on 9/12/14.
//  Copyright (c) 2014 Clemosn University. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterCheck.h"
#import "RegisterInfoViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *errorInfo;
@property (strong,nonatomic) RegisterCheck *check;
@property (weak, nonatomic) IBOutlet UIButton *login;

@end

@implementation LoginViewController

-(IBAction)textFiledReturnEditing:(id)sender
{
    [sender resignFirstResponder];
}

-(RegisterCheck *)check
{
    if (!_check)
    {
        _check = [[RegisterCheck alloc]init];
    }
    return _check;
}

- (IBAction)login:(UIButton *)sender
{
    NSString* result = nil;
    result = [self.check login:_username.text Password:_password.text];
    self.errorInfo.text = result;
    if ([result isEqualToString:@"success"])
    {
       [self performSegueWithIdentifier:@"login" sender:self];
    }
}


@end
