//
//  SplashViewController.m
//  MLMProspectTest
//
//  Created by Saleh Shah on 10/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SplashViewController.h"
#import "AppDelegate.h"

@implementation SplashViewController
@synthesize imageView;

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

-(void) showSplash
{
    self.imageView.image = [UIImage imageNamed:@"splash.png"];
    [self performSelector:@selector(changeImage) withObject:nil afterDelay:4.0];
    [self performSelector:@selector(hideSplash) withObject:nil afterDelay:6.0];
}

-(void) hideSplash
{
//    [self.view removeFromSuperview];
//    
//    introController = [[InformationViewController alloc] initWithNibName:@"InformationViewController" bundle:[NSBundle mainBundle]];
   
    AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = appDelegate.navigationController;
    NSLog(@"inside hide");
}

-(void) changeImage{
    
    self.imageView.image = [UIImage imageNamed:@"Default.png"];
    NSLog(@"inside chnage image");
}

@end
