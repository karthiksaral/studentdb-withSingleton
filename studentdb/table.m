//
//  table.m
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "table.h"

@interface table ()

@end

@implementation table
@synthesize tabvie;

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
    arr=[manage fetchFromDB:@"select schoolnam from studetail"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arr count];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    manage=[singleton share];
    manage.select=[arr objectAtIndex:indexPath.row];
    
    showdetails *show=[[showdetails alloc]init];
    [self.navigationController pushViewController:show animated:YES];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str=@"karthik";
    tablecell *cell=[tabvie dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
    {
        NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"tablecell" owner:nil options:nil ];
        for(UIView *vie in arr1)
        {
            if([vie isKindOfClass:[UITableViewCell class]])
            {
                cell=(tablecell*)vie;
                cell.lblcell.text=[arr objectAtIndex:indexPath.row];
                manage=[singleton share];
                manage.select=cell.lblcell.text;
            }
        }
    }
    
    return cell;
        
}






@end
