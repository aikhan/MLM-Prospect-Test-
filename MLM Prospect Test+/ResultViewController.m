//
//  ResultViewController.m
//  MLMProspectTest
//
//  Created by Ghazanfar Ali on 10/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ResultViewController.h"
#import "AppDelegate.h"
#import "PDColoredProgressView.h"
#import "MoreViewController.h"
#import "Contact.h"

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
- (void)dealloc
{
    [super dealloc];
    [audioPlayer release];
}
*/
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Action methods

- (void)test{
    
    
    NSString *newAudioFile;
    
    if (percentage >= 50 && percentage <=75) {
        
        newAudioFile = [[NSBundle mainBundle] pathForResource:@"3" ofType:@"mp3"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:newAudioFile];
        
        audioPlayer =	[[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
        
        [audioPlayer setDelegate:self]; 
        [audioPlayer prepareToPlay]; 
        [audioPlayer play]; 
        audioPlayer.volume = 0.5;
    }
    
    if (percentage >= 75 ) {
        newAudioFile = [[NSBundle mainBundle] pathForResource:@"hallelujah chorus" ofType:@"mp3"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:newAudioFile];
        
        audioPlayer =	[[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
        
        [audioPlayer setDelegate:self]; 
        [audioPlayer prepareToPlay]; 
        [audioPlayer play]; 
        audioPlayer.volume = 0.5;
    }
    else
    {
        NSLog(@"test");
        newAudioFile = [[NSBundle mainBundle] pathForResource:@"cartoontimpani" ofType:@"aif"];
        NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:newAudioFile];
        
        audioPlayer =	[[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
        
        [audioPlayer setDelegate:self]; 
        [audioPlayer prepareToPlay]; 
        [audioPlayer play]; 
        audioPlayer.volume = 0.5;
    }
        
    
    
	
	
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    int total;
    total = 0;
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    for (int i = 0; i < [appDelegate.marksArray count]; i++) {
        total = total + [[appDelegate.marksArray objectAtIndex:i] intValue];
        
    }
    
    total = total * 100;
    percentage = total/2100;
    NSString *percentString = [NSString stringWithFormat:@"%d%%", percentage];
    percentLabel.text = percentString;
    
    float width = percentage * 2.7;
    [percentImage setFrame:CGRectMake(28, 319, width, 25)];
    
    [self test];
    
    

}

-(IBAction)resetButton:(id)sender
{
    [audioPlayer stop];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    appDelegate.count = 1;
   // [self dismissModalViewControllerAnimated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(IBAction)moreButton:(id)sender
{
    MoreViewController * moreView = [[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:[NSBundle mainBundle]];
    [self presentModalViewController:moreView animated:YES];
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

- (IBAction)infoTappaed:(id)sender{
    Contact *contact = [[Contact alloc] init];
    [self.navigationController pushViewController:contact animated:YES];
}

@end
