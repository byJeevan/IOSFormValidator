//
//  RegistrationViewController.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "RegistrationViewController.h"
#import "Form.h"

@interface RegistrationViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
    NSArray * pickerArray;
    UIPickerView*  myPickerView;
}

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
@property (weak, nonatomic) IBOutlet UITextField *startDateField;
@property (weak, nonatomic) IBOutlet UITextField *endDateField;
@property (weak, nonatomic) IBOutlet UILabel *dateErrorMessage;
@property (weak, nonatomic) IBOutlet UIButton *dateErrorIcon;

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
    Field * fieldFirstName = [[Field alloc] initWithView:self.firstNameField errorMessageView:self.errorLabelFirstName errorHintView:self.errorIconFirstName validationsArray:arrayValidationFirstName];
    [self.form addNewField:fieldFirstName];
    
    //Form element - Last name.
    NSArray * arrayValidationLastName = [NSArray arrayWithObjects:[IsEmpty new] ,nil];
    Field * fieldLastMName = [[Field alloc] initWithView:self.lastName   errorMessageView:self.errorLabelLastName errorHintView:self.errorIconLasteName validationsArray:arrayValidationLastName];
    [self.form addNewField:fieldLastMName];
    
    
    NSArray * arrayValidationStartDate = [NSArray arrayWithObjects:[IsValidDate new], nil];
    Field * fieldStartDate = [[Field alloc] initWithView:self.startDateField errorMessageView:self.dateErrorMessage errorHintView:self.dateErrorIcon validationsArray:arrayValidationStartDate];

    NSArray * arrayValidationEndDate = [NSArray arrayWithObjects: [IsEmpty new], [IsValidDate new], nil];
    Field * fieldEndDate = [[Field alloc] initWithView:self.endDateField errorMessageView:self.dateErrorMessage errorHintView:self.dateErrorIcon validationsArray:arrayValidationEndDate];
    
    [self.form addNewField:fieldEndDate withDependencyField:fieldStartDate];
    
    //Form Birthdate
    NSArray * arrayOfBithDateValidation = [NSArray arrayWithObjects:[IsEmpty new], [IsValidDate new], nil];
    Field * birthdateField= [[Field alloc] initWithView:self.birthDateField errorMessageView:self.birthdateErrorLabel errorHintView:self.birthdateErrorIcon validationsArray:arrayOfBithDateValidation];
    [self.form addNewField:birthdateField];
    
    //Form element - email
    NSArray * arrayValidationEmail = [NSArray arrayWithObjects:[IsEmpty new], [IsValidEmail new], nil];
    Field * fieldEmail = [[Field alloc] initWithView:self.emailField errorMessageView:self.emailErrorLabel errorHintView:self.emailErrorIcon validationsArray:arrayValidationEmail];
    [self.form addNewField:fieldEmail];
    
    //Form field - Mobile
    NSArray * arrayValidationMobile = [NSArray arrayWithObjects:[IsEmpty new], [IsNumber new], nil];
    Field * fieldMobile = [[Field alloc] initWithView:self.mobileField errorMessageView:self.mobileErrorLabel errorHintView:self.mobileErrorIcon validationsArray:arrayValidationMobile];
    
    [self.form addNewField:fieldMobile];
    
    //Form element - password.
    NSArray * arrayValidationPassword = [NSArray arrayWithObjects:[IsEmpty new], nil];
    Field * fieldPassword = [[Field alloc] initWithView:self.passwordField errorMessageView:self.passwordErrorLabel errorHintView:self.passwordErrorIcon validationsArray:arrayValidationPassword];
    
    [self.form addNewField:fieldPassword];
    
    //Form field - Picker
    [self addPickerView];
    
    //Keyboard type
    self.emailField.keyboardType = UIKeyboardTypeEmailAddress;
    self.mobileField.keyboardType = UIKeyboardTypeNamePhonePad;
    
    self.firstNameField.delegate =
    self.lastName.delegate =
    self.mobileField.delegate =
    self.emailField.delegate =
    self.passwordField.delegate =
    self.birthDateField.delegate = self;
    self.startDateField.delegate = self;
    self.endDateField.delegate = self;
    
}


-(void)addPickerView {
    pickerArray = [[NSArray alloc]initWithObjects:@"02/02/2017",
                   @"03/02/2017",@"04/02/2017",@"05/02/2017",@"06/02/2017", nil];
 
    myPickerView = [[UIPickerView alloc]init];
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(done:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     myPickerView.frame.size.height-50, 320, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.birthDateField.inputView = myPickerView;
    self.birthDateField.inputAccessoryView = toolBar;
    
}

-(void) done:(id) picker {
    
    [self.birthDateField resignFirstResponder];
}

#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.birthDateField setText:[pickerArray objectAtIndex:row]];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text field delegates
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [self.view endEditing:YES];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([textField.text isEqualToString:@""]) {
        //[self dateChanged:nil];
    }
}

@end
