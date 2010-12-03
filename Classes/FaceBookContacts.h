//
// FaceBookContacts.h
// BetterPhone
//
// Created by Manish Jain  on 10/22/10.
// Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FBSession.h"
#import "FBRequest.h"
#import "FBConnect.h"

@interface FaceBookContacts : NSObject <FBSessionDelegate, FBRequestDelegate>
{
	FBSession*		_session;
	FBLoginDialog*	_loginDialog;
	FBRequest*      _req; 
	
	BOOL			_testing;  
	BOOL			_compareElement;
}

@property (nonatomic, retain) FBLoginDialog*	loginDialog;
@property (nonatomic, retain) FBSession*	    session;

- (void) showLoginDialog;
- (void) logout;
- (void) requestForMessages;

@end
