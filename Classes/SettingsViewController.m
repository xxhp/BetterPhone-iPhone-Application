//
//  SettingsViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "FaceBookContacts.h"


@implementation SettingsViewController


-(void)viewDidLoad
{
	_scrollview.contentSize = self.view.frame.size;
	_scrollview.scrollEnabled = YES;
}


-(IBAction)faceBookLoginButtonTapped:(id)Sender
{
	//sending notification to facebook
	[[NSNotificationCenter defaultCenter] postNotificationName:@"loginNotice" object:nil];
}

-(IBAction)faceBookLogoutButtonTapped:(id)Sender
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"logoutNotice" object:nil];
}

#pragma mark -
#pragma mark memory managment
- (void)dealloc 
{
    [super dealloc];
}


@end
