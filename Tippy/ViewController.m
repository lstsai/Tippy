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

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill= [self.billField.text doubleValue];
    NSArray *percentages= @[@(0.15), @(0.20), @(0.25)];
    
    double tipPercent= [percentages [self.tipControl.selectedSegmentIndex] doubleValue];
    double tip= tipPercent*bill;
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
