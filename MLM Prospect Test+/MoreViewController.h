//
//  MoreViewController.h
//  MLMProspectTest
//
//  Created by Saleh Shah on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView * moreTable;
    NSArray * moreLinks;
    NSArray * moreImages;
    NSArray * moreDesc;
    NSArray * moreNames;
}

@property(nonatomic,retain) IBOutlet UITableView * moreTable;
@property(nonatomic,retain) NSArray * moreLinks;
@property(nonatomic,retain) NSArray * moreImages;
@property(nonatomic,retain) NSArray * moreDesc;
@property(nonatomic,retain) NSArray * moreNames;

-(IBAction)backButton:(id)sender;

@end
