//
//  ViewController.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "ViewController.h"
#import "Field.h"
#import "Form.h"
#import "IsEmpty.h"
#import "IsValidEmail.h"
#import "IsValidPan.h"

@interface ViewController ()
//Email field
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *errorButtonEmail;
@property (weak, nonatomic) IBOutlet UILabel *emaildMessageLabel;

//Password field
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *errorPasswordLabel;
@property (weak, nonatomic) IBOutlet UIButton *errorPassIcon;

@property (strong, nonatomic)  Form * form ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //Create new form
    self.form = [Form new];
    
    //Form element - email
    NSArray * arrayValidationEmail = [NSArray arrayWithObjects:[IsEmpty new], [IsValidEmail new], nil];
    Field * fieldEmail = [[Field alloc] initWithField:self.emailField errorMessageView:self.emaildMessageLabel errorHintView:self.errorButtonEmail validationsArray:arrayValidationEmail];
    [self.form addNewField:fieldEmail];

    
    //Form element - password.
    NSArray * arrayValidationPassword = [NSArray arrayWithObjects:[IsEmpty new], [IsValidPan new], nil];
    Field * fieldPassword = [[Field alloc] initWithField:self.passwordField errorMessageView:self.errorPasswordLabel errorHintView:self.errorPassIcon validationsArray:arrayValidationPassword];
    
    [self.form addNewField:fieldPassword];
  
}

- (IBAction)submitAction:(id)sender {
    
    if ([self.form isFormValid]) {
        //Do after valid
        NSLog(@"********* FORM IS VALID ************");
        
        UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Successfull validation" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [successAlert show];
        
    }
    else{
        //Do when not valid
        NSLog(@"********* FORM IS NOT VALID ************");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
