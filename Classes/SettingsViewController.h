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
	IBOutlet UIButton*		_connectBtn;
	IBOutlet UIButton*		_logoutBtn;
}	

-(IBAction) faceBookLoginButtonTapped:(id)Sender;
-(IBAction) faceBookLogoutButtonTapped:(id)Sender;

@end
