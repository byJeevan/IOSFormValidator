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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *errorButtonEmail;
@property (weak, nonatomic) IBOutlet UILabel *emaildMessageLabel;

@property (strong, nonatomic)  Form * form ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.form = [Form new];
    Field * field = [Field makeWithBuilder:^(FieldBuilder * builder) {
            builder.field = self.emailField;
            builder.messageLabel = self.emaildMessageLabel;
            builder.hintView = self.errorButtonEmail;
            builder.validationArray = [NSArray arrayWithObjects:[IsEmpty new], [IsValidEmail new], nil];
    }];
    [self.form addNewField:field];
 
    [self.errorButtonEmail setBackgroundImage:[UIImage imageNamed:@"error_default.png"] forState:UIControlStateNormal];
  
}



- (IBAction)submitAction:(id)sender {
    
    
    if ([self.form isFormValid]) {
        //Do after valid
        NSLog(@"********* FORM IS VALID ************");
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
