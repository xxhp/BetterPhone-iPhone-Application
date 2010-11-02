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


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	
	[textField resignFirstResponder];
	return YES;
}

-(IBAction)faceBookButtonTapped:(id)Sender
{
	FaceBookContacts* facebookInfo = [[FaceBookContacts alloc] init];
	
	//FaceBookContacts.posting = YES;
	// If we're not logged in, log in first...
	if (![facebookInfo.session isConnected]) 
	{
		facebookInfo.loginDialog = nil;
		facebookInfo.loginDialog = [[[FBLoginDialog alloc] initWithSession:[facebookInfo session]] autorelease];	
		[facebookInfo.loginDialog show];
	}
	// If we have a session and a name, post to the wall!
	else if ([facebookInfo.session resume]) 
	{
		NSString* msg = @"You are already logged in";
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message: msg
													   delegate:self cancelButtonTitle: @"OK" otherButtonTitles: nil];
		[alert show];
	}
}

- (void)dealloc 
{
    [super dealloc];
}


@end
