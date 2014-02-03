//
//  ViewController.m
//  ValidateIt
//
//  Created by Arpi Dermardirousian on 1/28/14.
//  Copyright (c) 2014 ValidateIt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)validateMe:(id)sender {
    
    //====== Initialize The Validation Library
    validation *validate=[[validation alloc] init];
    
    //====== Pass In the textField and desired textFieldName for each validation method
    [validate Email:self.email FieldName:@"Email Address"];
    [validate Required:self.email FieldName:@"Email Address"];
    [validate Required:self.password FieldName:@"Password"];
    [validate MaxLength:12 textField:self.password FieldName:@"User Password"];
    [validate isValid];
    
    //===== Check If Text Fields Are Valid Or Not ========//
    if([validate textFiledIsValid] == TRUE){
        NSLog(@"Everything is Okay");
        self.errorLabel.hidden = TRUE;
        self.errorLabel.text = @"";
    }else{
        //=========== Show Error Messages From errorMsg Array ===============//
        NSLog(@"Error Messages From Clinet Side: %@",[validate errorMsg]);
        NSLog(@"Oops ! :( there is an error in the system");
        NSString *errorString = [[validate errorMsg] componentsJoinedByString: @"\n"];
        self.errorLabel.hidden = false;
        self.errorLabel.text = errorString;
    }
    
}

@end
