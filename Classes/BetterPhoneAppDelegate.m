//
//  BetterPhoneAppDelegate.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BetterPhoneAppDelegate.h"
#import "DataManager.h"
#import "FaceBookContacts.h"
#import "SocialFeedViewController.h"

@implementation BetterPhoneAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{    
    // Override point for customization after application launch.
    
	[window addSubview:_tabBarController.view];
    [window makeKeyAndVisible];
		
	[self getContactsList];
	
	FaceBookContacts* facebookInfo = [[FaceBookContacts alloc] init] ;
	
	return YES;
}

- (void)getContactsList
{
	ABAddressBookRef addressBook = ABAddressBookCreate();
	
	CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
	CFIndex      nPeople = ABAddressBookGetPersonCount(addressBook);

	NSString *contactFirstLast = [[NSString alloc]init];
	
	for (int i = 0; i < nPeople; i++)
	{
		ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, i);
		
		CFStringRef firstName = ABRecordCopyValue(ref, kABPersonFirstNameProperty);
		CFStringRef lastName  = ABRecordCopyValue(ref, kABPersonLastNameProperty);
		
		ABMultiValueRef name1 =(NSString*)ABRecordCopyValue(ref,kABPersonPhoneProperty);
		NSString* mobile=@"";
		NSString* mobileLabel;
		int temp = ABMultiValueGetCount(name1);
		
		for(CFIndex i=0;i<ABMultiValueGetCount(name1);i++)
		{
			mobileLabel=(NSString*)ABMultiValueCopyLabelAtIndex(name1, i);
			if([mobileLabel isEqualToString:@"_$!<Mobile>!$_"] || [mobileLabel isEqualToString:@"_$!<Main>!$_"] )
			{
				mobile=(NSString*)ABMultiValueCopyValueAtIndex(name1,i);
			}
		}
		
		if (firstName == nil)
		{
			contactFirstLast = [NSString stringWithFormat: @"%@", lastName];
		}
		else if (lastName == nil)
		{
			contactFirstLast = [NSString stringWithFormat: @"%@", firstName];
		}
	    else  
		{
			contactFirstLast = [NSString stringWithFormat: @"%@ %@", firstName, lastName];
		}
		
		if (firstName == nil && lastName == nil && mobile != nil)
		{
			contactFirstLast = [NSString stringWithFormat: @"%@", mobile];
		}				
		
		if (firstName == nil && lastName == nil && ( mobile == nil || temp == 0 ))
		{
		}
		else
		{
			[[DataManager sharedObj].masterContactList addObject:contactFirstLast];
			[[DataManager sharedObj].recordPersonId    addObject:ref];
		}
	}
	
}

- (void)dealloc
{
    [window release];
    [super dealloc];
}


@end
