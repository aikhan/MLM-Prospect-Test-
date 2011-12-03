//
//  Contact.m
//  MLM Prospect Test+
//
//  Created by Asad Khan on 10/27/11.
//  Copyright (c) 2011 Semantic Notion Inc. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)blog:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.kimklaverblogs.com"]];
    
}
- (IBAction)email:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://kimklaver@mac.com"]];

}

@end
