//
//  ViewController.m
//  Tippy
//
//  Created by laurentsai on 6/23/20.
//  Copyright © 2020 laurentsai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"View will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *up1 = [@([defaults integerForKey:@"default_tip_percentage1"]) stringValue];
    NSString *up2 = [@([defaults integerForKey:@"default_tip_percentage2"]) stringValue];
    NSString *up3 = [@([defaults integerForKey:@"default_tip_percentage3"]) stringValue];

    up1 = [up1 stringByAppendingString:@"%"];
    up2 = [up2 stringByAppendingString:@"%"];
    up3 = [up3 stringByAppendingString:@"%"];

    [self.tipControl setTitle:up1 forSegmentAtIndex:0];
    [self.tipControl setTitle:up2 forSegmentAtIndex:1];
    [self.tipControl setTitle:up3 forSegmentAtIndex:2];

}
- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill= [self.billField.text doubleValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *percentages= @[@([defaults integerForKey:@"default_tip_percentage1"]), @([defaults integerForKey:@"default_tip_percentage2"]), @([defaults integerForKey:@"default_tip_percentage3"])];
    
    double tipPercent= [percentages [self.tipControl.selectedSegmentIndex] doubleValue];
    double tip= tipPercent*0.01*bill;
    double total= bill + tip;
    
    self.tipLabel.text= [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text=[NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditBegin:(id)sender {
   
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y+30, self.billField.frame.size.width,  self.billField.frame.size.height);
        self.tipLabel.alpha=0;
    }];
    
    
}
- (IBAction)onEditEnd:(id)sender {
    CGRect newframe=self.billField.frame;
    newframe.origin.y-=30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame=newframe;
        self.tipLabel.alpha=1;
    }];
}

@end
