//
//  validation.h
//  ValidateIt
//
//  Created by Arpi Dermardirousian on 1/27/14.
//  Copyright (c) 2014 Arpi Dermardirousian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface validation : NSObject <UITextFieldDelegate>{
}

- (void) Email : (NSString *) emailAddress FieldName: (NSString *) textFieldName;
- (void) Required : (NSString *) textField FieldName: (NSString *) textFieldName;
- (void) MinLength: (NSInteger ) length  textFiled: (NSString *) textField FieldName: (NSString *) textFieldName;
- (void) LettersSpaceOnly: (NSString *) textField FieldName: (NSString *) textFieldName;
- (void) MaxLength: (NSInteger) length textField: (NSString *)textField FieldName: (NSString *) textFieldName; 

- (BOOL) isValid;

@property(nonatomic) UIButton* submissionButton;
@property(nonatomic, strong) NSMutableArray * errors;
@property(nonatomic, strong) NSMutableArray * errorMsg;
@property(nonatomic, strong) NSMutableArray * emailError;
@property(nonatomic, strong) NSMutableArray * requiredError;
@property(nonatomic, strong) NSMutableArray *minLengthError;
@property(nonatomic, strong) NSMutableArray *lettersSpaceOnly;
@property(nonatomic, strong) NSMutableArray *maxLengthError;

@property(nonatomic, strong) NSMutableArray * emailErrorMsg;
@property(nonatomic, strong) NSMutableArray * requiredErrorMsg;
@property(nonatomic, strong) NSMutableArray *minLengthErrorMsg;
@property(nonatomic, strong) NSMutableArray *lettersSpaceOnlyMsg;
@property(nonatomic, strong) NSMutableArray *maxLengthErrorMsg;
@property(nonatomic, strong) NSString *errorStr;
@property(nonatomic) BOOL textFiledIsValid;

@property(nonatomic, strong) NSString *textField;


@end
