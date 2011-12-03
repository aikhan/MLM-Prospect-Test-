//
//  SplashViewController.h
//  MLMProspectTest
//
//  Created by Saleh Shah on 10/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SplashViewController : UIViewController {
    UIViewController *modalViewController;

    UIImageView *imageView;
}

@property(nonatomic,retain) IBOutlet UIImageView *imageView;

-(void) hideSplash;
-(void) showSplash;

@end
