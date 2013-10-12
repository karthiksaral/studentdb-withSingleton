//
//  showdetails.h
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "tablecell.h"
#import "table.h"
#import "editpage.h"

@interface showdetails : UIViewController
{
    NSMutableArray *arr;
    singleton *manage;
    
}
@property (strong, nonatomic) IBOutlet UILabel *lblschlnam;
@property (strong, nonatomic) IBOutlet UILabel *lblstudnam;
@property (strong, nonatomic) IBOutlet UILabel *lblmak1;
@property (strong, nonatomic) IBOutlet UILabel *lblmak2;
- (IBAction)butbak:(id)sender;
- (IBAction)butedit:(id)sender;

@end
