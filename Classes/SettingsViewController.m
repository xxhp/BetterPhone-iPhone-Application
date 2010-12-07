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
	//[super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddingConnectButton)   name:@"connectionResponsepositive"	object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddingLogoutButton)    name:@"connectionResponse"			object:nil]; 
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:YES];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"connectionNotice" object:nil];
}

-(void) hiddingConnectButton
{
	_connectBtn.hidden = YES;
	_logoutBtn.hidden  = NO;
}

-(void) hiddingLogoutButton
{
	_logoutBtn.hidden  = YES;
	_connectBtn.hidden = NO;
}


//sending notification to facebook for login
-(IBAction)faceBookLoginButtonTapped:(id)Sender
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"loginNotice" object:nil];
	[self viewWillAppear:YES];
}

//sending notification to facebook for logout 
-(IBAction)faceBookLogoutButtonTapped:(id)Sender
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"logoutNotice" object:nil];
	[self viewWillAppear:YES];
}

#pragma mark -
#pragma mark memory managment
- (void)dealloc 
{
    [super dealloc];
}

@end
