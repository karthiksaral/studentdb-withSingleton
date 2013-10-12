//
//  showdetails.m
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "showdetails.h"

@interface showdetails ()

@end

@implementation showdetails
@synthesize lblmak1,lblmak2,lblschlnam,lblstudnam;

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
    lblschlnam.text=str;
    
    NSString *star=[manage fetchValue:[NSString stringWithFormat:@"select studnam from studetail where schoolnam='%@'",manage.select]];
    lblstudnam.text=star;
    
    NSString *strr=[manage fetchValue:[NSString stringWithFormat:@"select mk1 from studetail where schoolnam='%@'",manage.select]];
   lblmak1.text=strr;
    
    NSString *stra=[manage fetchValue:[NSString stringWithFormat:@"select mk2 from studetail where schoolnam='%@'",manage.select]];
   lblmak2.text=stra;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)butbak:(id)sender {
    table *tab=[[table alloc]init];
    [self.navigationController pushViewController:tab animated:YES];
}

- (IBAction)butedit:(id)sender {
    editpage *tab=[[editpage alloc]init];
    [self.navigationController pushViewController:tab animated:YES];
}
@end
