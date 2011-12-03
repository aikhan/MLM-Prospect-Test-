//
//  ResultViewController.h
//  MLMProspectTest
//
//  Created by Ghazanfar Ali on 10/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ResultViewController : UIViewController <AVAudioPlayerDelegate>{
    
    IBOutlet UILabel *percentLabel;
    IBOutlet UISlider *percentSlider;
    IBOutlet UIImageView *percentImage;
    
    AVAudioPlayer *audioPlayer;
    
    int percentage;
}

- (void)test;
-(IBAction)resetButton:(id)sender;
-(IBAction)moreButton:(id)sender;
- (IBAction)infoTappaed:(id)sender;

@end
