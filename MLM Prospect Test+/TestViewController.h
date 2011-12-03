//
//  TestViewController.h
//  MLM Prospect Test+
//
//  Created by Asad Khan on 10/26/11.
//  Copyright (c) 2011 Semantic Notion Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FacebookAgent.h"
#import "FBConnect.h"
#import "SA_OAuthTwitterEngine.h"
#import "SA_OAuthTwitterController.h"

@interface TestViewController : UIViewController <AVAudioPlayerDelegate, FacebookAgentDelegate,FBDialogDelegate,FBSessionDelegate,FBRequestDelegate, SA_OAuthTwitterControllerDelegate>{
    
    UIButton *leftButton;
    UISlider *slider;
    
    FBLoginButton			*fbButton;
	FacebookAgent			*fbAgent;
    
    SA_OAuthTwitterEngine	*_engine;
     AVAudioPlayer *audioPlayer;
    
}
@property (nonatomic, strong) IBOutlet UISlider *slider;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UIImageView *sliderBackImage;
@property (nonatomic, strong) IBOutlet UILabel *agreeLabel;
@property (nonatomic, strong) IBOutlet UILabel *authorLabel;
- (IBAction)shareOnfacebook;
- (IBAction)shareOnTwitter;
- (IBAction)rightButtonTapped:(id)sender;
- (IBAction)leftButtonTapped:(id)sender;
- (IBAction)sliderAction;
@end
