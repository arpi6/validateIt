//
//  validation.m
//  ValidateIt
//
//  Created by Arpi Dermardirousian on 1/27/14.
//  Copyright (c) 2014 Arpi Dermardirousian. All rights reserved.
//

#import "validation.h"

@implementation validation

- (id)init {
    self = [super init];
    if (self) {
        self.errorMsg = [[NSMutableArray alloc]init];
        self.requiredErrorMsg = [[NSMutableArray alloc]init];
        self.emailErrorMsg = [[NSMutableArray alloc]init];
        self.lettersSpaceOnlyMsg = [[NSMutableArray alloc]init];
        self.maxLengthErrorMsg = [[NSMutableArray alloc]init];
        self.minLengthErrorMsg = [[NSMutableArray alloc]init];
    }
    return self;
}

//===========  Email Address ========//
-(void) Email: (UITextField *) emailAddress FieldName: (NSString *) textFieldName{
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    self.emailError = [NSMutableArray arrayWithObjects:@"0",nil];
    NSString *msg = @"Email address is invalid.";
    if ([emailTest evaluateWithObject:emailAddress.text] == NO) {
        [self.emailError replaceObjectAtIndex:0 withObject:@"1"];
        [self.emailErrorMsg addObject:msg];
        return;
    }else{
        [self.emailError replaceObjectAtIndex:0 withObject:@"0"];
        [emailAddress resignFirstResponder];
        return;
    }
}

//=========== Letters And Space Only ========//
-(void) LettersSpaceOnly: (UITextField *) textField FieldName: (NSString *) textFieldName {
    
    NSString *lettersSpaceRegex = @"[a-zA-z]+([ '-][a-zA-Z]+)*$";
    NSPredicate *lettersSpaceTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", lettersSpaceRegex];
    self.lettersSpaceOnly = [NSMutableArray arrayWithObjects:@"0", nil];
    
    if([lettersSpaceTest evaluateWithObject:textField.text] == NO){
        [self.lettersSpaceOnly replaceObjectAtIndex:0 withObject:@"1"];
        NSString *msg = [NSString stringWithFormat:@"%@%s",textFieldName," should contain letters and space only."];
        [self.lettersSpaceOnlyMsg addObject:msg];
        return;
    }else{
        [self.lettersSpaceOnly replaceObjectAtIndex:0 withObject:@"0"];
        [textField restorationIdentifier];
        return;
    }
}

//=========== Required ========//
-(void) Required: (UITextField *) textField FieldName: (NSString *) textFieldName {
    
    self.requiredError = [NSMutableArray arrayWithObjects:@"0",nil];
    
    if (textField.text.length == 0) {
        [self.requiredError replaceObjectAtIndex:0 withObject:@"1"];
        NSString *msg = [NSString stringWithFormat:@"%@%s",textFieldName, " is required."];
        [self.requiredErrorMsg addObject:msg];
        return;
    }else{
        [textField resignFirstResponder];
        [self.requiredError replaceObjectAtIndex:0 withObject:@"0"];
        return;
    }
}

//=========== MinLength ========//
-(void) MinLength: (NSInteger) length  textFiled: (UITextField *)textField FieldName: (NSString *) textFieldName{
    
    self.minLengthError = [NSMutableArray arrayWithObjects:@"0", nil];
    
    if(textField.text.length > length || textField.text.length == length){
        [self.minLengthError replaceObjectAtIndex:0 withObject:@"0"];
        return ;
    }else{
        [self.minLengthError replaceObjectAtIndex:0 withObject:@"1"];
        NSString *msg = [NSString stringWithFormat:@"%@%s%i%s",textFieldName," should have minimum of ", length , " characters."];
        [self.minLengthErrorMsg addObject:msg];
        return;
    }
}

//=========== MaxLength ========//
-(void) MaxLength: (NSInteger) length textField: (UITextField *)textField FieldName: (NSString *) textFieldName {
    
    self.maxLengthError = [NSMutableArray arrayWithObjects:@"0", nil];
    
    if(textField.text.length < length || textField.text.length == length) {
        [self.maxLengthError replaceObjectAtIndex:0 withObject:@"0"];
        return;
    }else{
        [self.maxLengthError replaceObjectAtIndex:0 withObject:@"1"];
        NSString *msg = [NSString stringWithFormat:@"%@%s%i%s",textFieldName," should have maximum of ", length , " characters."];
        [self.maxLengthErrorMsg addObject:msg];
    }
}


//=========== Check If TextFields Are Valid ========//

-(BOOL) isValid {
    
    [self.errors removeAllObjects];
    self.errors = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0", nil];
    
    for (NSString *email in self.emailError) {
        if([email isEqualToString:@"1"]){
            [self.errors replaceObjectAtIndex:0 withObject:@"1"];
            for(NSString *msg in self.emailErrorMsg){
                [self.errorMsg addObject:msg];
            }
        }else{
            [self.errors replaceObjectAtIndex:0 withObject:@"0"];
        }
    }
    
    for (NSString *required in self.requiredError){
        if([required isEqualToString:@"1"]){
            [self.errors replaceObjectAtIndex:1 withObject:@"1"];
            for(NSString *msg in self.requiredErrorMsg){
               [self.errorMsg addObject:msg];
            }
        }else{
            [self.errors replaceObjectAtIndex:1 withObject:@"0"];
        }
    }
    
    for (NSString *minLength in self.minLengthError){
        if([minLength isEqualToString:@"1"]){
            [self.errors replaceObjectAtIndex:2 withObject:@"1"];
            for(NSString *msg in self.minLengthErrorMsg){
                [self.errorMsg addObject:msg];
            }

        }else{
            [self.errors replaceObjectAtIndex:2 withObject:@"0"];
        }
    }
    
    for (NSString *lettersSpace in self.lettersSpaceOnly){
        if([lettersSpace isEqualToString:@"1"]){
            [self.errors replaceObjectAtIndex:3 withObject:@"1"];
            for(NSString *msg in self.lettersSpaceOnlyMsg){
                [self.errorMsg addObject:msg];
            }

        }else{
            [self.errors replaceObjectAtIndex:3 withObject:@"0"];
        }
    }
    
    for (NSString *maxLength in self.maxLengthError){
        if([maxLength isEqualToString:@"1"]){
            [self.errors replaceObjectAtIndex:4 withObject:@"1"];
            for(NSString *msg in self.maxLengthErrorMsg){
                [self.errorMsg addObject:msg];
            }

        }else{
            [self.errors replaceObjectAtIndex:4 withObject:@"0"];
        }
    }
    
    for (NSString *item in self.errors) {
        if([[self.errors objectAtIndex:1]isEqualToString:@"1"] || [[self.errors objectAtIndex:2]isEqualToString:@"1"] || [[self.errors objectAtIndex:0]isEqualToString:@"1"] || [[self.errors objectAtIndex:3]isEqualToString:@"1"] || [[self.errors objectAtIndex:4]isEqualToString:@"1"]){
            self.textFiledIsValid = FALSE;
        }else{
            self.textFiledIsValid = TRUE;
        }
    }
    
    return self.textFiledIsValid;
}

-(void) successLabel: (UITextField *) textField {
    
    UILabel *successLabel = [[UILabel alloc] initWithFrame:CGRectMake(-5, -5, 30, 40)];
    successLabel.backgroundColor = [UIColor colorWithRed:83.0f/255.0f green:179.0f/255.0f blue:84.0f/255.0f alpha:1.0f];
    successLabel.textAlignment = NSTextAlignmentCenter;
    [successLabel setText:@"√"];
    [successLabel setFont:[UIFont fontWithName:@"Verdana" size:15]];
    [successLabel setTextColor:[UIColor whiteColor]];
    [textField setLeftView:successLabel];
    [textField setLeftViewMode: UITextFieldViewModeAlways];

}

-(void) errorLabel: (UITextField *) textField {
    
    UILabel *errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(-5, -5, 30, 40)];
    errorLabel.backgroundColor = [UIColor colorWithRed:217.0f/255.0f green:33.0f/255.0f blue:35.0f/255.0f alpha:1.0f];
    errorLabel.textAlignment = NSTextAlignmentCenter;
    [errorLabel setText:@"!"];
    [errorLabel setFont:[UIFont fontWithName:@"Verdana" size:15]];
    [errorLabel setTextColor:[UIColor whiteColor]];
    
    [textField setLeftView:errorLabel];
    [textField setLeftViewMode: UITextFieldViewModeAlways];
}


@end
