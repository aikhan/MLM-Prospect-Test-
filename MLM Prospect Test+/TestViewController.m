//
//  TestViewController.m
//  MLM Prospect Test+
//
//  Created by Asad Khan on 10/26/11.
//  Copyright (c) 2011 Semantic Notion Inc. All rights reserved.
//

#import "TestViewController.h"
#import "AppDelegate.h"
#import "Model.h"
#import "SA_OAuthTwitterEngine.h"
#import "ResultViewController.h"

//#define kOAuthConsumerKey		@"jsaV6SmYlJiuQi9U3rUKjg"
//#define kOAuthConsumerSecret	@"8WmMWLmd44Ry421pJT2D6yNW1mshZoRCV9Pe5vFWU"
//#define kOAuthConsumerKey		@"VhYYebuiRD7RQVYZ4tpj0g"//API Keys for world fisher
//#define kOAuthConsumerSecret	@"64k9nkjTtqeigMCBo8ZjIr2PosVtWNRpkGatHSBrM"

#define kOAuthConsumerKey		@"nV9Los7wQNLFCcdzfDj5g"//API Keys for World Cup Cricket APP 
#define kOAuthConsumerSecret	@"0YCtrIG904L12p4R28xNB0LAEsQNnDrDpLdlwoI6A"


@interface TestViewController (Private){
    
}
- (void)setupSlider:(CGRect)coordinates;
- (void)calculateScore;
@end

@implementation TestViewController

@synthesize slider, textView, imageView, sliderBackImage, agreeLabel, authorLabel;   
Model *model;
int count;
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
    AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;

    model = [Model sharedModel];
    count = appDelegate.count;
    // Do any additional setup after loading the view from its nib.
    NSString *questionText = [NSString stringWithFormat:@"%d. ", count];
    
    self.textView.text = [questionText stringByAppendingFormat:[model.questions objectAtIndex:count -1]];
    NSLog(@"Question number %d", count);
    CGRect dimension;
    self.agreeLabel.hidden = YES;
    self.authorLabel.hidden = YES;
    if (count >= 17) {
        self.agreeLabel.hidden = NO;
       // self.authorLabel.hidden = NO;
        self.authorLabel.text = [self.authorLabel.text stringByAppendingFormat:@" %@", [model.authors objectAtIndex:count -1]];
        self.authorLabel.frame = CGRectMake(self.authorLabel.frame.origin.x, self.authorLabel.frame.origin.y -85 , self.authorLabel.frame.size.width , self.authorLabel.frame.size.height);
        self.agreeLabel.frame = CGRectMake(self.agreeLabel.frame.origin.x, self.agreeLabel.frame.origin.y -85 , self.agreeLabel.frame.size.width , self.agreeLabel.frame.size.height); 
    }
    if (count < 18) {
        dimension = CGRectMake(self.slider.frame.origin.x, self.slider.frame.origin.y - 85 , self.slider.frame.size.width , slider.frame.size.height);
        [self setupSlider:dimension];
        self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y , self.imageView.frame.size.width , self.imageView.frame.size.height - 100);
        self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y , self.textView.frame.size.width , textView.frame.size.height - 40);
        self.sliderBackImage.frame = CGRectMake(self.sliderBackImage.frame.origin.x, self.sliderBackImage.frame.origin.y - 85 , self.sliderBackImage.frame.size.width , sliderBackImage.frame.size.height);

    }
    if (count == 18 || count == 22) {
        self.authorLabel.frame = CGRectMake(self.authorLabel.frame.origin.x, self.authorLabel.frame.origin.y +85 , self.authorLabel.frame.size.width , self.authorLabel.frame.size.height);
        self.agreeLabel.frame = CGRectMake(self.agreeLabel.frame.origin.x, self.agreeLabel.frame.origin.y +85, self.agreeLabel.frame.size.width , self.agreeLabel.frame.size.height); 
        NSLog(@"question 18");
        [self setupSlider:self.slider.frame];
        
    }
    if(count == 19 || count == 20 || count == 21){
        dimension = CGRectMake(self.slider.frame.origin.x, self.slider.frame.origin.y - 85 , self.slider.frame.size.width , slider.frame.size.height);
        [self setupSlider:dimension];
        self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y , self.imageView.frame.size.width , self.imageView.frame.size.height - 100);
        self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y , self.textView.frame.size.width , textView.frame.size.height - 40);
        self.sliderBackImage.frame = CGRectMake(self.sliderBackImage.frame.origin.x, self.sliderBackImage.frame.origin.y - 85 , self.sliderBackImage.frame.size.width , sliderBackImage.frame.size.height);
        [self setupSlider:dimension];
    }
        
        [self.slider setValue:50 animated:YES];
    
    
    fbAgent = [[FacebookAgent alloc] initWithApiKey:@"234134953312131" 
										  ApiSecret:@"2c7eb98d320438b65fd848884a7a088a" 
										   ApiProxy:nil];
    fbAgent.delegate = self;
    
    
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
/***
 ***/
#pragma -
#pragma Actions



- (IBAction)rightButtonTapped:(id)sender{
    
    AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    [self calculateScore];
    if (appDelegate.count > [[Model sharedModel].questions count]) {
        NSLog(@"TEst ended");
        ResultViewController *resultView = [[ResultViewController alloc]initWithNibName:@"ResultViewController" bundle:[NSBundle mainBundle]];
       // resultView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self.navigationController pushViewController:resultView animated:YES];
      
    }else{
        NSLog(@"Right button tapped");
        TestViewController *testVC = [[TestViewController alloc] init];
        [self.navigationController pushViewController:testVC animated:YES];
        appDelegate.count++;
    }
    
}

- (IBAction)leftButtonTapped:(id)sender{
    NSLog(@"left button tapped");
    AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    appDelegate.count--;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma -
#pragma UI Setup
- (void)setupSlider:(CGRect)coordinates{
    NSLog(@"setup slider");
    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"transparent.png"] forState:UIControlStateNormal];
	[self.slider setMaximumTrackImage:[UIImage imageNamed:@"transparent.png"] forState:UIControlStateNormal];
	[self.slider setThumbImage:[UIImage imageNamed:@"sliderbar.png"] forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"sliderbar.png"] forState:UIControlStateHighlighted];
	[self.slider setOpaque:NO];
    
	self.slider.minimumValue = 0.0;
	self.slider.maximumValue = 100.0;
	self.slider.continuous = NO;
    self.slider.value = 0.0;
    self.slider.frame = coordinates;
}

-(IBAction)sliderAction
{
    NSLog(@"slider value: %f", self.slider.value);
    NSString *newAudioFile;
    newAudioFile = [[NSBundle mainBundle] pathForResource:@"Cartoon Accent 17" ofType:@"caf"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:newAudioFile];
    
    audioPlayer =	[[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    
    [audioPlayer setDelegate:self]; 
    [audioPlayer prepareToPlay]; 
    [audioPlayer play]; 
    audioPlayer.volume = 1;
   
     /*if (count < 14) {
        
        if (self.slider.value > 50) {
            
            [self.slider setValue:100 animated:YES];
            
        }
        else if (self.slider.value <= 50) {
            [self.slider setValue:0 animated:YES];
        }
    }
    else
    {
      */
        if (self.slider.value > 0 && self.slider.value <= 12.5) {
            [self.slider setValue:0 animated:YES];
        }
        else if (self.slider.value > 12.5 && self.slider.value <= 37.5) {
            [self.slider setValue:22 animated:YES];
        }
        else if (self.slider.value > 37.5 && self.slider.value <= 62.5) {
            [self.slider setValue:50 animated:YES];
        }
        else if (self.slider.value > 62.5 && self.slider.value <= 87.5) {
            [self.slider setValue:78 animated:YES];
        }
        else if (self.slider.value > 87.5 && self.slider.value <= 100) {
            [self.slider setValue:100 animated:YES];
        }
   // }
    
}


-(void)calculateScore
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    int answer = self.slider.value;
    NSString *ansString = [NSString stringWithFormat:@"%d ", answer];
    NSLog(@"ANSWER %d", answer);
    if ((count-1) == 16 || (count-1) == 10 || (count-1) == 13) {
     NSString *newAnsString = [NSString stringWithFormat:@"%d ", 100 - [ansString intValue]];
        NSLog(@"%@ value AND qyestion number %d", newAnsString, count-1);
    }
    [appDelegate.marksArray replaceObjectAtIndex:(count -1) withObject:ansString];
    
}

#pragma mark -
#pragma Social Media



- (IBAction)shareOnfacebook{
	NSLog(@"facebook button is tapped");
    
    
    NSString * update = [[Model sharedModel].questions objectAtIndex:count];
    NSLog(@"update text %@", update);
    [fbAgent setStatus:update];
    
}
- (void) facebookAgent:(FacebookAgent*)agent requestFaild:(NSString*) message{
	fbAgent.shouldResumeSession = NO;
}
- (void) facebookAgent:(FacebookAgent*)agent statusChanged:(BOOL) success
{
    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations" message:@"Question has been shared on facebook" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
	
	
}
- (void) facebookAgent:(FacebookAgent*)agent loginStatus:(BOOL) loggedIn{
}
- (void) facebookAgent:(FacebookAgent*)agent dialog:(FBDialog*)dialog didFailWithError:(NSError*)error{
    NSLog(@"status change failed");
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error posting app info to your profile please try back in a while" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
	
	NSLog(@"Error : %@", [error description]);
}
- (void)session:(FBSession*)session didLogin:(FBUID)uid{
    
}

# pragma -
# pragma - Twitter Share Methods
# pragma - 


- (IBAction)shareOnTwitter
{
    NSString * update = [[Model sharedModel].questions objectAtIndex:count];
    NSLog(@"twitter tapped");
    if (_engine) return;
	_engine = [[SA_OAuthTwitterEngine alloc] initOAuthWithDelegate: self];
	_engine.consumerKey = kOAuthConsumerKey;
	_engine.consumerSecret = kOAuthConsumerSecret;
	
	UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: _engine delegate: self];
	
	if (controller) 
		[self presentModalViewController: controller animated: YES];
	else {
		[_engine sendUpdate:update];
        NSLog(@"send update");
		//TODO: Change this behaviour create a seprate Catch Object & set its properties
	}
}


#pragma mark SA_OAuthTwitterEngineDelegate
- (void) storeCachedTwitterOAuthData: (NSString *) data forUsername: (NSString *) username {
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject: data forKey: @"authData"];
	[defaults synchronize];
}

- (NSString *) cachedTwitterOAuthDataForUsername: (NSString *) username {
	return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData"];
}

//=============================================================================================================================
#pragma mark SA_OAuthTwitterControllerDelegate
- (void) OAuthTwitterController: (SA_OAuthTwitterController *) controller authenticatedWithUsername: (NSString *) username {
    NSString * update = [[Model sharedModel].questions objectAtIndex:count];
	NSLog(@"Authenicated for %@", username);
	[_engine sendUpdate:update];
}

- (void) OAuthTwitterControllerFailed: (SA_OAuthTwitterController *) controller {
	NSLog(@"Authentication Failed!");
}

- (void) OAuthTwitterControllerCanceled: (SA_OAuthTwitterController *) controller {
	NSLog(@"Authentication Canceled.");
}

//=============================================================================================================================
#pragma mark TwitterEngineDelegate
- (void) requestSucceeded: (NSString *) requestIdentifier {
	NSLog(@"Request %@ succeeded", requestIdentifier);
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations" message:@"You have successfully tweeted" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
}
- (void)requestFailed:(NSString *)connectionIdentifier withError:(NSError *)error{
    NSLog(@"failed with error %@", [error description]);
}
@end
