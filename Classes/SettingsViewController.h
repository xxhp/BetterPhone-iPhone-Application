//
//  SettingsViewController.h
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceBookContacts.h"


@interface SettingsViewController : UIViewController
{
	IBOutlet UIScrollView*  _scrollview;
	IBOutlet UISwitch*      _switchBtn;
}

-(IBAction)faceBookLoginButtonTapped:(id)Sender;
-(IBAction)faceBookLogoutButtonTapped:(id)Sender;

@end
