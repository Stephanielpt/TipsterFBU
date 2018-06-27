//
//  ViewController.m
//  Tipster
//
//  Created by Stephanie Lampotang on 6/26/18.
//  Copyright © 2018 Stephanie Lampotang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentageSlider;
@property (weak, nonatomic) IBOutlet UILabel *chosenSliderPercentage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_billField becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    // self.view.endEditing(YES);
    [self.view endEditing:(YES)];
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    
    //double tipPercentage = percentages[self.tipControl.selectedSegmentIndex.doubleValue();
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}

- (IBAction)onSlide:(id)sender {
    
    double bill2 = [self.billField.text doubleValue];
    
    float tipPercentageSlide = self.tipPercentageSlider.value;
    _chosenSliderPercentage.text = [NSString stringWithFormat:@"%.0f", tipPercentageSlide];
    
    double tipPerc = tipPercentageSlide;
    
    double tip2 = (tipPerc/100) * bill2;
    double total2 = bill2 + tip2;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip2];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total2];
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.7 animations:^{self.tipControl.frame = CGRectMake(self.tipControl.frame.origin.x, self.tipControl.frame.origin.y +100, self.tipControl.frame.size.width, self.tipControl.frame.size.height);
    }];
    
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.tipControl.frame;
    newFrame.origin.y -= 100;
    
    [UIView animateWithDuration:0.7 animations:^{
        self.tipControl.frame = newFrame;
    }];
}


@end
