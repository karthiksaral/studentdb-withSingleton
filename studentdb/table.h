//
//  table.h
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "tablecell.h"
#import "showdetails.h"

@interface table : UIViewController
{
    singleton *manage;
    NSMutableArray *arr;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tabvie;

@end
