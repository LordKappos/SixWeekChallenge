//
//  DetailViewController.m
//  SixWeekChallenge
//
//  Created by Scott on 8/12/15.
//  Copyright (c) 2015 Devmountain. All rights reserved.
//

#import "DetailViewController.h"
#import "PersonController.h"

@interface DetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateWithName:self.person];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (IBAction)clearButtonTapped:(id)sender {
    self.nameField.text = @"";
}
- (IBAction)saveButtonTapped:(id)sender {
    if (self.person) {
        self.person.name = self.nameField.text;
        [[PersonController sharedInstance] save];
    } else {
        [[PersonController sharedInstance]createPersonWithName:self.nameField.text];
        [[PersonController sharedInstance] save];
    }

}

- (void)updateWithName:(Person *)person {
    self.nameField.text = person.name;
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
        [textField resignFirstResponder];
        
        return YES;
}
    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
