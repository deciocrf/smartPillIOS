//
//  SPMedicineDetailsViewController.h
//  SmartPill
//
//  Created by Dennis da Silva Nunes on 18/12/14.
//  Copyright (c) 2014 IFRN - Mobile School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Medicine.h"
#import "SPAppDelegate.h"

@interface SPMedicineDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *madeInLabel;

@property (strong,nonatomic) Medicine * medicine;

- (IBAction)BackToLastViewAction:(UIBarButtonItem *)sender;

@end
