validateIt
==========

Validation Library for IOS apps



## Options
Validation for <br/>
    <b>email address</b> , required text field, minimum length, maximum length, and lettwers and space only. 

## Examples

```objc
//====== Initialize The Validation Library
    validation *validate=[[validation alloc] init];
    
//====== Pass In the textField and desired textFieldName for each validation method
    [validate Email:self.email FieldName:@"Email Address"];
    [validate Required:self.email FieldName:@"Email Address"];
    [validate Required:self.password FieldName:@"Password"];
    [validate MaxLength:12 textField:self.password FieldName:@"User Password"];
    [validate isValid];
```
## Usage

Check out the xCode sample project for this validation plugin.

## Contact

Email : arpiderm@gmail.com
