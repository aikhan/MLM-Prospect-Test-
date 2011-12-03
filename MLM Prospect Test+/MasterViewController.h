//
//  MasterViewController.h
//  MLM Prospect Test+
//
//  Created by Asad Khan on 10/26/11.
//  Copyright (c) 2011 Semantic Notion Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UIViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

- (IBAction)startTest:(id)sender;

@end
