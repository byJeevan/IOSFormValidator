//
//  RegistrationViewController.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "RegistrationViewController.h"

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

@end

@implementation RegistrationViewController
- (IBAction)backAction:(id)sender {
}
- (IBAction)submitAction:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //Make placeholder color white
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
