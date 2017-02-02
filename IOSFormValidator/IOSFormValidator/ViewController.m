//
//  ViewController.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "ViewController.h"
#import "FormParentView.h"
#import "FieldView.h"
#import "IsEmpty.h"
#import "IsValidEmail.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet FieldView *passwordFieldView;
@property (weak, nonatomic) IBOutlet FieldView *EmailFieldView;
@property (strong, nonatomic) IBOutlet FormParentView *formParentView;
@property (weak, nonatomic) IBOutlet FieldView *spinnerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //Email
    [self.EmailFieldView.validationFieldsArray addObjectsFromArray:[NSArray arrayWithObjects:[IsEmpty new], [IsValidEmail new], nil]];
    
    //Password
    [self.passwordFieldView.validationFieldsArray addObject:[IsEmpty new]];
  
}

- (IBAction)submitAction:(id)sender {
    
    if ([self.formParentView isFormValid]) {
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
