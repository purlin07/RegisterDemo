//
//  RegisterViewController.m
//  RegisterDemo
//
//  Created by 林过寒 on 9/8/14.
//  Copyright (c) 2014 Clemosn University. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterCheck.h"

@interface RegisterViewController ()
@property (strong,nonatomic) RegisterCheck *check;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password1;
@property (weak, nonatomic) IBOutlet UITextField *password2;
@property (weak, nonatomic) IBOutlet UILabel *checkEmailResult;
@property (weak, nonatomic) IBOutlet UILabel *checkNameResult;
@property (weak, nonatomic) IBOutlet UILabel *checkPassword1Result;
@property (weak, nonatomic) IBOutlet UILabel *checkPassword2Result;
@property (weak, nonatomic) IBOutlet UIButton *done;
@end

@implementation RegisterViewController

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

- (IBAction)checkEmail:(UITextField *)sender
{
    NSString* result = nil;
    result = [self.check checkEmail:_email.text];
    self.checkEmailResult.text = result;
    [self updateUI];
}

- (IBAction)checkUsername:(UITextField *)sender
{
    NSString* result = nil;
    result = [self.check checkName:_username.text];
    self.checkNameResult.text=result;
    [self updateUI];
}

- (IBAction)checkPassword1:(UITextField *)sender
{
    NSString* result = nil;
    result = [self.check checkPassword1: _password1.text];
    self.checkPassword1Result.text = result;
    [self updateUI];
}

- (IBAction)checkPassword2:(UITextField *)sender
{
    NSString* result = nil;
    result = [self.check checkPassword1:_password1.text Password2:_password2.text ];
    self.checkPassword2Result.text = result;
    [self updateUI];

}

-(void)updateUI
{
    if([self.checkEmailResult.text isEqualToString:@"success"]&&
       [self.checkNameResult.text isEqualToString:@"success"]&&
       [self.checkPassword1Result.text isEqualToString:@"success"]&&
       [self.checkPassword2Result.text isEqualToString:@"success"])
    {
        [self.done setBackgroundColor:[UIColor greenColor]];
        [self.done setUserInteractionEnabled:YES];
    }else{
        [self.done setBackgroundColor:[UIColor redColor]];
        [self.done setUserInteractionEnabled:NO];
    }
}

- (IBAction)registerDone:(UIButton *)sender
{
    [self.check registerWithName:_username.text Password:_password2.text];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.done setUserInteractionEnabled:NO];
}

@end
