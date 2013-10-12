//
//  editpage.h
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "table.h"


@interface editpage : UIViewController
{
    singleton *manage;
    
}
@property (strong, nonatomic) IBOutlet UITextField *txtschnam;
@property (strong, nonatomic) IBOutlet UITextField *txtstudnam;
@property (strong, nonatomic) IBOutlet UITextField *txtmaak1;
@property (strong, nonatomic) IBOutlet UITextField *txtmaak2;
- (IBAction)butupdate:(id)sender;
- (IBAction)butdelete:(id)sender;
- (IBAction)butback:(id)sender;

@end
