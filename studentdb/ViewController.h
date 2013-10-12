//
//  ViewController.h
//  studentdb
//
//  Created by Admin on 8/6/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "table.h"

@interface ViewController : UIViewController
{
    singleton *manage;
    
}
@property (strong, nonatomic) IBOutlet UITextField *txtscholnam;
@property (strong, nonatomic) IBOutlet UITextField *txtstudnam;
@property (strong, nonatomic) IBOutlet UITextField *txtmak1;
@property (strong, nonatomic) IBOutlet UITextField *txtmak2;
- (IBAction)butsave:(id)sender;
- (IBAction)butvie:(id)sender;
- (IBAction)butexit:(id)sender;

@end
