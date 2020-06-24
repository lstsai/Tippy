//
//  SettingsViewController.m
//  Tippy
//
//  Created by laurentsai on 6/23/20.
//  Copyright © 2020 laurentsai. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *percentOneField;
@property (weak, nonatomic) IBOutlet UITextField *percentTwoField;
@property (weak, nonatomic) IBOutlet UITextField *percentThreeField;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
- (void)viewWillAppear:(BOOL)animated {
[super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [self.percentOneField setText: [@([defaults integerForKey:@"default_tip_percentage1"]) stringValue]];
    [self.percentTwoField setText:[@([defaults integerForKey:@"default_tip_percentage2"]) stringValue]];
    [self.percentThreeField setText:[@([defaults integerForKey:@"default_tip_percentage3"]) stringValue]];

}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    int userpercent1= [self.percentOneField.text intValue];
    int userpercent2= [self.percentTwoField.text intValue];
    int userpercent3= [self.percentThreeField.text intValue];
   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:userpercent1 forKey:@"default_tip_percentage1"];
    [defaults setInteger:userpercent2 forKey:@"default_tip_percentage2"];
    [defaults setInteger:userpercent3 forKey:@"default_tip_percentage3"];
    [defaults synchronize];
    
    
}
- (IBAction)onEditBegin:(id)sender {
    [self.percentOneField setText:@""];
}
- (IBAction)onEditBegin2:(id)sender {
    [self.percentTwoField setText:@""];

}
- (IBAction)onEditBegin3:(id)sender {
    [self.percentThreeField setText:@""];

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
