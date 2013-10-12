//
//  editpage.m
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "editpage.h"

@interface editpage ()

@end

@implementation editpage
@synthesize txtmaak1,txtmaak2,txtschnam,txtstudnam;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    manage=[singleton share];
    
    NSString *str=[manage fetchValue:[NSString stringWithFormat:@"select schoolnam from studetail where schoolnam='%@'",manage.select]];
    txtschnam.text=str;
    
    NSString *star=[manage fetchValue:[NSString stringWithFormat:@"select studnam from studetail where schoolnam='%@'",manage.select]];
    txtstudnam.text=star;
    
    NSString *strr=[manage fetchValue:[NSString stringWithFormat:@"select mk1 from studetail where schoolnam='%@'",manage.select]];
    txtmaak1.text=strr;
    
    NSString *stra=[manage fetchValue:[NSString stringWithFormat:@"select mk2 from studetail where schoolnam='%@'",manage.select]];
    txtmaak2.text=stra;

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)butupdate:(id)sender {
    
    
    [manage insertValuesToTheDb:[NSString stringWithFormat:@"update studetail set schoolnam='%@',studnam='%@',mk1='%@',mk2='%@' where schoolnam='%@'",txtschnam.text,txtstudnam.text,txtmaak1.text,txtmaak2.text,manage.select]];
    
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"successfully updated"
                                                    message:@"Press OK"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
    table *tab=[[table alloc]init];
    [self.navigationController pushViewController:tab animated:YES];

    
}

- (IBAction)butdelete:(id)sender {
    manage=[singleton share];
    
    [manage insertValuesToTheDb:[NSString stringWithFormat:@"DELETE FROM studetail where schoolnam='%@'", manage.select]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"successfully Deleted"
                                                    message:@"Press OK"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];

    table *tab=[[table alloc]init];
    [self.navigationController pushViewController:tab animated:YES];

}

- (IBAction)butback:(id)sender {
    table *tab=[[table alloc]init];
    [self.navigationController pushViewController:tab animated:YES];
}
@end
