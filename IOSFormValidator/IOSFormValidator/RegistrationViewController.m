//
//  RegistrationViewController.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "RegistrationViewController.h"
#import "Form.h"


@interface RegistrationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UIButton *errorIconFirstName;
@property (weak, nonatomic) IBOutlet UILabel *errorLabelFirstName;

@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UIButton *errorIconLasteName;
@property (weak, nonatomic) IBOutlet UILabel *errorLabelLastName;

@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *emailErrorIcon;
@property (weak, nonatomic) IBOutlet UILabel *emailErrorLabel;

@property (weak, nonatomic) IBOutlet UITextField *mobileField;

@property (weak, nonatomic) IBOutlet UILabel *mobileErrorLabel;

@property (weak, nonatomic) IBOutlet UIButton *mobileErrorIcon;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UILabel *passwordErrorLabel;
@property (weak, nonatomic) IBOutlet UIButton *passwordErrorIcon;
@property (weak, nonatomic) IBOutlet UISwitch *agreementSwitch;
@property (weak, nonatomic) IBOutlet UITextField *birthDateField;
@property (weak, nonatomic) IBOutlet UIButton *birthdateErrorIcon;

@property (weak, nonatomic) IBOutlet UILabel *birthdateErrorLabel;


@property (strong, nonatomic)  Form * form ;

@end

@implementation RegistrationViewController

- (IBAction)backAction:(id)sender {

    [self dismissViewControllerAnimated:NO completion:nil];

}


- (IBAction)submitAction:(id)sender {
    
    if ([self.form isFormValid]) {
        //Do after valid
        NSLog(@"********* FORM IS VALID ************");
        
        UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Successfull Registration" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [successAlert show];
        
    }
    else{
        //Do when not valid
        NSLog(@"********* FORM IS NOT VALID ************");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Create new form
    self.form = [Form new];
    
    //Form element - FirstName
    NSArray * arrayValidationFirstName = [NSArray arrayWithObjects:[IsEmpty new], [IsAlphabet new], nil];
    Field * fieldFirstName = [[Field alloc] initWithField:self.firstNameField errorMessageView:self.errorLabelFirstName errorHintView:self.errorIconFirstName validationsArray:arrayValidationFirstName];
    [self.form addNewField:fieldFirstName];
    
    
    //Form element - Last name.
    NSArray * arrayValidationLastName = [NSArray arrayWithObjects:[IsEmpty new] ,nil];
    Field * fieldLastMName = [[Field alloc] initWithField:self.lastName   errorMessageView:self.errorLabelLastName errorHintView:self.errorIconLasteName validationsArray:arrayValidationLastName];
    
    [self.form addNewField:fieldLastMName];
    
    //Form Birthdate
    NSArray * arrayOfBithDateValidation = [NSArray arrayWithObjects:[IsEmpty new], [IsValidDate new], nil];
    Field * birthdateField= [[Field alloc] initWithField:self.birthDateField errorMessageView:self.birthdateErrorLabel errorHintView:self.birthdateErrorIcon validationsArray:arrayOfBithDateValidation];
    [self.form addNewField:birthdateField];
    
    //Form element - email
    NSArray * arrayValidationEmail = [NSArray arrayWithObjects:[IsEmpty new], [IsValidEmail new], nil];
    Field * fieldEmail = [[Field alloc] initWithField:self.emailField errorMessageView:self.emailErrorLabel errorHintView:self.emailErrorIcon validationsArray:arrayValidationEmail];
    [self.form addNewField:fieldEmail];
    
    
    //Form element - password.
    NSArray * arrayValidationPassword = [NSArray arrayWithObjects:[IsEmpty new], nil];
    Field * fieldPassword = [[Field alloc] initWithField:self.passwordField errorMessageView:self.passwordErrorLabel errorHintView:self.passwordErrorIcon validationsArray:arrayValidationPassword];
    
    [self.form addNewField:fieldPassword];
    
    //Form field - Mobile
    NSArray * arrayValidationMobile = [NSArray arrayWithObjects:[IsEmpty new], [IsNumber new], nil];
    Field * fieldMobile = [[Field alloc] initWithField:self.mobileField errorMessageView:self.mobileErrorLabel errorHintView:self.mobileErrorIcon validationsArray:arrayValidationMobile];
    
    [self.form addNewField:fieldMobile];
    
    
    //Form field - Segment
    
    
    //Form field - Switch
    
    
    //Form field - Picker
    
    
    
    //Keyboard type
    self.emailField.keyboardType = UIKeyboardTypeEmailAddress;
    self.mobileField.keyboardType = UIKeyboardTypeNamePhonePad;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
