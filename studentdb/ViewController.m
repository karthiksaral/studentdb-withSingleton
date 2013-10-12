//
//  ViewController.m
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txtscholnam,txtstudnam,txtmak1,txtmak2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)butsave:(id)sender {
    manage=[singleton share];
    NSString *str=[NSString stringWithFormat:@"insert into studetail(schoolnam,studnam,mk1,mk2)values('%@','%@','%@','%@')",txtscholnam.text,txtstudnam.text,txtmak1.text,txtmak2.text];
    [manage insertValuesToTheDb:str];
    txtscholnam.text=@"";
    txtstudnam.text=@"";
    txtmak1.text=@"";
    txtmak2.text=@"";
    
}

- (IBAction)butvie:(id)sender {
    table *tab=[[table alloc]init];
    [self.navigationController pushViewController:tab
                                         animated:YES];
}

- (IBAction)butexit:(id)sender {
    exit(0);
}
@end
