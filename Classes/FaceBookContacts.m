//
// FaceBookContacts.m
// BetterPhone
//
// Created by Manish Jain  on 10/22/10.
// Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FBLoginDialog.h"
#import "FaceBookContacts.h"
#import "Constant.h"
#import "DataManager.h"
#import "SocialFeedViewController.h"


// This Facebook feature will not work until you enter your Facebook application's API key here:
static NSString*	kApiKey = kFacebookApiKey;//@"<YOUR API KEY>";

// Enter either your API secret or a callback URL (as described in documentation):
static NSString*	kApiSecret = kFacebookSecretKey;// @"<YOUR SECRET KEY>";
static NSString*	kGetSessionProxy = kFacebookSessionProxy; // @"<YOUR SESSION CALLBACK)>";


@implementation FaceBookContacts

@synthesize     loginDialog  = _loginDialog;
@synthesize     session      = _session;

- (id) init
{
	if (self = [super init])
	{
		if (kGetSessionProxy)
			_session = [[FBSession sessionForApplication:kApiKey getSessionProxy:kGetSessionProxy delegate:self] retain];
		else
			_session = [[FBSession sessionForApplication:kApiKey secret:kApiSecret delegate:self] retain];
	}
	
	_compareElement = YES;
	
	[_session resume];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callingViewMethod:) name:@"loginNotice" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout) name:@"logoutNotice" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callingRequestMethod:) name:@"noticeFromSocialFeed" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkingConnection:) name:@"connectionNotice" object:nil];
	
	
	return self;
}

#pragma mark -
#pragma mark IBAction method

-(IBAction)checkingConnection:(id)Sender
{
	if (![_session isConnected])
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:@"connectionResponse" object:nil];
	}
	else
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:@"connectionResponsepositive" object:nil];
	}

}


-(IBAction)callingViewMethod:(id)Sender
{
	[self showLoginDialog];
}

-(IBAction)callingRequestMethod:(id)Sender
{
	if ([_session isConnected])
	{
		[self requestForMessages];
	}
}

#pragma mark -
#pragma mark sessionForApplication

- (void) showLoginDialog
{
	if ([_session resume] == NO)
	{
		FBLoginDialog* dialog = [[[FBLoginDialog alloc] initWithSession:_session] autorelease];
		[dialog show];
	}
	
	if ([_session resume] == YES)
	{
		NSString* msg = @"You are logged in";
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message: msg
									   		   delegate:self cancelButtonTitle: @"OK" otherButtonTitles:nil , nil ];
		[alert show];
	}
}

- (void) logout
{
	[_session logout];
}

#pragma mark -
#pragma mark seesion login method

- (void) session:(FBSession*)session didLogin:(FBUID)uid
{
	_compareElement = YES;
	
	NSString* fql = [NSString stringWithFormat:
					 @"select name from user where uid in (select uid2 from friend where uid1 = %lld)", _session.uid];
	
	NSDictionary* params = [NSDictionary dictionaryWithObject:fql forKey:@"query"];
	
    [[FBRequest requestWithDelegate:self] call:@"facebook.fql.query" params:params];
	
}

#pragma mark -

- (void) request:(FBRequest*)request didLoad:(id)result
{
    if(_compareElement == YES)
	{
	    NSArray* friends = result;
		NSDictionary* friend = nil;
		
		for (friend in friends)
		{
			NSString* name = [[friend objectForKey:@"name"] retain];
			NSArray* data = [[NSArray alloc] initWithArray:[[DataManager sharedObj] sharedContacts]];
			
			if(data.count == 0)
			{
				[[DataManager sharedObj].sharedContacts addObject:name]; 
			}
			else
			{
				for (int i = 0; i < data.count ; i++)
				{
					NSString* str = [data objectAtIndex:i];
					
					if (![str isEqualToString:name])
					{
						NSLog(@"%d",i);
						_testing = YES;
					}
					else
					{
						_testing = NO;
						break;
					}
				}
			}
			
			if (_testing == YES)
			{
				[[DataManager sharedObj].sharedContacts addObject:name]; 
			}
		}
	}
	else
	{		
		[[DataManager sharedObj] setMessageData:result];
		
		[[NSNotificationCenter defaultCenter] postNotificationName:@"notify" object:nil];
		
		_compareElement = YES;
	}
}

- (void)request:(FBRequest*)request didReceiveResponse:(NSURLResponse*)response
{
	
}


- (void) request:(FBRequest*)request didFailWithError:(NSError*)error
{
	NSLog(@"Error(%d) %@", error.code, error.localizedDescription);
}

#pragma mark -
#pragma mark request method


- (void) requestForMessages
{
	_compareElement = NO;
	
	NSString* fql = [NSString stringWithFormat:
					 @"SELECT name, status FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = %lld) ", _session.uid];
	
	NSDictionary* params = [NSDictionary dictionaryWithObject:fql forKey:@"query"];
	FBRequest* last20FriendsStatusRequest = [FBRequest requestWithDelegate:self];
	[last20FriendsStatusRequest call:@"facebook.fql.query" params:params];
	
}




#pragma mark -
#pragma mark memory managment

- (void) dealloc
{
	[super	dealloc];
}

@end
