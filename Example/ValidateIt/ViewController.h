//
//  ViewController.h
//  ValidateIt
//
//  Created by Arpi Dermardirousian on 1/28/14.
//  Copyright (c) 2014 ValidateIt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "validation.h"

@interface ViewController : UIViewController <UITextFieldDelegate>


- (IBAction)validateMe:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIView *errorView;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end
