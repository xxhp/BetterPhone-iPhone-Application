//
//  DCFaceBookContacts.m
//  DC
//

#import "FBLoginDialog.h"
#import "FaceBookContacts.h"
#import "Constant.h"
#import "SharedObject.h"


	// This Facebook feature will not work until you enter your Facebook application's API key here:
static NSString*	kApiKey = kFacebookApiKey;//@"<YOUR API KEY>";

	// Enter either your API secret or a callback URL (as described in documentation):
static NSString*	kApiSecret = kFacebookSecretKey;// @"<YOUR SECRET KEY>";
static NSString*	kGetSessionProxy = kFacebookSessionProxy; // @"<YOUR SESSION CALLBACK)>";


@implementation FaceBookContacts

@synthesize     loginDialog  = _loginDialog;
@synthesize     session = _session;

- (id) init
{
	if (self = [super init])
	{
		if (kGetSessionProxy)
			_session = [[FBSession sessionForApplication:kApiKey getSessionProxy:kGetSessionProxy delegate:self] retain];
		else
			_session = [[FBSession sessionForApplication:kApiKey secret:kApiSecret delegate:self] retain];
	}
	
	[_session resume];
	return self;
}

- (void) showLoginDialog
{
	if ([_session resume] == NO)
	{
		FBLoginDialog* dialog = [[[FBLoginDialog alloc] initWithSession:_session] autorelease];
		[dialog show];
	}
	
	if ([_session resume] == YES)
	{
		NSString* msg = @"You are already logged in";
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message: msg
												   delegate:self cancelButtonTitle: @"OK" otherButtonTitles: nil];
		[alert show];
	}
}

- (void) logout
{
	[_session logout];
}

#pragma mark -

- (void) session:(FBSession*)session didLogin:(FBUID)uid
{
	//NSString* msg = @"You have sucecessfully logged in";
	//UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message: msg
	   								 //  delegate:self cancelButtonTitle: @"OK" otherButtonTitles: nil];
	//	[alert show];
	NSString* fql = [NSString stringWithFormat:
					 @"select name from user where uid in (select uid2 from friend where uid1 = %lld)", _session.uid];
	
	NSDictionary* params = [NSDictionary dictionaryWithObject:fql forKey:@"query"];
	
	[[FBRequest requestWithDelegate:self] call:@"facebook.fql.query" params:params];
}

- (void) sessionDidLogout:(FBSession*) session
{
	NSLog(@"User Logged Out");
}

#pragma mark -

- (void) request:(FBRequest*)request didLoad:(id)result
{
	if(request.method == @"facebook.status.get")
	
	{
	
		NSArray* friends = result;
    NSLog(@"hello");
	NSDictionary* friend = nil;
	for (friend in friends)
	{
		NSString* name = [[friend objectForKey:@"message"] retain];
		
		NSArray* data = [[NSArray alloc] initWithArray:[[SharedObject sharedObj] sharedContacts]];
		
		if(data.count == 0)
		{
			[[SharedObject sharedObj] addMutableArrayElements1:name];
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
			[[SharedObject sharedObj] addMutableArrayElements1:name];
		}
	}	
	//[request release];
	}
	else
	{
		NSLog(@"Not eneter");
	}

}

- (void) request:(FBRequest*)request didFailWithError:(NSError*)error
{
	NSLog(@"Error(%d) %@", error.code, error.localizedDescription);
}

- (void) requestForMessages
{
//	NSString* fql1 = [NSString stringWithFormat:
//					  @"select message from status where uid = me() "];
//	
//	NSDictionary* params1 = [NSDictionary dictionaryWithObject:fql1 forKey:@"query"];
//	
//	[[FBRequest requestWithDelegate:self] call:@"facebook.status.get" params:params1];

}

#pragma mark -
#pragma mark memory managment

- (void) dealloc
{
	[_session	release];
	//[request release];
    [super		dealloc];
}

@end
