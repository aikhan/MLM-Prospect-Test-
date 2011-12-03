//
//  MoreViewController.m
//  MLMProspectTest
//
//  Created by Saleh Shah on 10/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"

@implementation MoreViewController

@synthesize moreImages,moreLinks,moreTable,moreDesc,moreNames;

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
    
    
    self.moreNames = [[NSMutableArray alloc] initWithObjects:@"Angry Birds", @"Scanner Pro",@"Scribblenauts Remix",@"Words with Friends",@"Splashtop Remote for iPod and iPhone",nil];
	
	self.moreDesc = [[NSMutableArray alloc] initWithObjects:@"The survival of the Angry Birds is at stake…", @"Scan multipage docs, email and upload to Dropbox…",@"Play Words with Friends…",@"Your PC or MAC in your pocket…",@"Scan multipage docs, email and upload to Dropbox…",nil];
	
	self.moreImages = [[NSMutableArray alloc] initWithObjects:@"bird.jpg", @"proscanner.png",@"2.png",@"3.png",@"4.png",nil];
    
    self.moreLinks = [[NSMutableArray alloc]initWithObjects:
                      @"http://click.linksynergy.com/fs-bin/stat?id=jsaAs1PJ0Ug&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fangry-birds%252Fid343200656%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30",
                      @"http://click.linksynergy.com/fs-bin/stat?id=jsaAs1PJ0Ug&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fscanner-pro-scan-multipage%252Fid333710667%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30",
                      @"http://click.linksynergy.com/fs-bin/stat?id=jsaAs1PJ0Ug&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fscribblenauts-remix%252Fid444844790%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30",
                      @"http://click.linksynergy.com/fs-bin/stat?id=jsaAs1PJ0Ug&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fwords-with-friends%252Fid322852954%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30",
                      @"http://click.linksynergy.com/fs-bin/stat?id=jsaAs1PJ0Ug&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fitunes.apple.com%252Fus%252Fapp%252Fsplashtop-remote-desktop-for%252Fid402056323%253Fmt%253D8%2526uo%253D4%2526partnerId%253D30",nil];
    
    
    self.moreTable.delegate = self;
    self.moreTable.dataSource = self;
    self.moreTable.backgroundColor = [UIColor clearColor];
    
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

#pragma mark UITableView Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return  [self.moreNames count];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
	
	
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) 
	{
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
    
    
    CGRect iconRect=CGRectMake(0, 5, 50, 50);
	UIImageView *next1=[[UIImageView alloc]initWithFrame:iconRect];
	UIImage *logo1=[UIImage imageNamed:[self.moreImages objectAtIndex:indexPath.row]];
	next1.image=logo1;
	[cell addSubview:next1];
	
	
	CGRect nameValue1=CGRectMake(55,20,250 ,30); 
	UILabel *namVal1=[[UILabel alloc] initWithFrame:nameValue1];	
	[cell addSubview:namVal1];

	namVal1.text=[self.moreDesc objectAtIndex:indexPath.row];
	namVal1.font=[UIFont systemFontOfSize:12];
	namVal1.numberOfLines=2;
	namVal1.backgroundColor = [UIColor clearColor];
    
	
	
	CGRect nameValue2=CGRectMake(55,0,180 ,20); 
	UILabel *namVal2=[[UILabel alloc] initWithFrame:nameValue2];	
	[cell addSubview:namVal2];
	namVal2.text=[self.moreNames objectAtIndex:indexPath.row];
	namVal2.font=[UIFont boldSystemFontOfSize:16];
	namVal2.backgroundColor = [UIColor clearColor];
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.moreTable deselectRowAtIndexPath:indexPath animated:YES];
    
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.moreLinks objectAtIndex:indexPath.row]]];
	
}


-(IBAction)backButton:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


@end
