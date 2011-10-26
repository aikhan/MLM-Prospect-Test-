//
//  DetailViewController.h
//  MLM Prospect Test+
//
//  Created by Asad Khan on 10/26/11.
//  Copyright (c) 2011 Semantic Notion Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
