//
//  DialPadViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DialPadViewController.h"
#import <CoreTelephony/CTCall.h>
#import <CoreTelephony/CTCallCenter.h>
#import "DataManager.h"
#import "ContactsViewController.h"

NSString * const notifying = @"DataComplete";

@interface DialPadViewController (private)

-(void)fifteenBttonTapped:(NSNotification *)notif;
-(void) createNewContactScreen;

@end

@implementation DialPadViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
	_phoneNOString      = [[NSMutableArray alloc] init];
	_text.textColor     = [UIColor whiteColor];
	_text.font          = [UIFont systemFontOfSize:44];

	[[DataManager sharedObj] setRepetion:YES];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fifteenBttonTapped:) name:@"notifying" object:nil]; 
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:YES];
	[[DataManager sharedObj] setIsShowAddScreen:YES];
}

-(IBAction)firstBttonTapped:(id)Sender
{
	NSString* first = @"1";
	[_phoneNOString addObject:first];
	
	NSMutableString* display = [[NSMutableString alloc] init];	
		
	for (int i = 0; i < _phoneNOString.count ; i++)
		[display appendString:[_phoneNOString objectAtIndex:i]]; 
	
	
	_text.text = @"";
	_text.text = display;
	
	[display release];
}

-(IBAction)secondBttonTapped:(id)Sender
{
	NSString* first = @"2";
	[_phoneNOString addObject:first];
	
	NSMutableString* display1 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
		[display1 appendString:[_phoneNOString objectAtIndex:i]]; 
	
	_text.text = @"";
	_text.text = display1;
	[display1 release];
}

-(IBAction)thirdBttonTapped:(id)Sender
{
	NSString* first = @"3";
	[_phoneNOString addObject:first];
	
	NSMutableString* display3 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
		[display3 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display3;
	[display3 release];
}

-(IBAction)fourthBttonTapped:(id)Sender
{
	NSString* first = @"4";
	[_phoneNOString addObject:first];
	
	NSMutableString* display4 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
		[display4 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display4;
	[display4 release];

}	
	
-(IBAction)fifthBttonTapped:(id)Sender
{
	NSString* first = @"5";
	[_phoneNOString addObject:first];
	
	NSMutableString* display5 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
		[display5 appendString:[_phoneNOString objectAtIndex:i]]; 
	
	_text.text = @"";
	_text.text = display5;
	[display5 release];

}

-(IBAction)sixthBttonTapped:(id)Sender
{
	NSString* first = @"6";
	[_phoneNOString addObject:first];
	
	NSMutableString* display6 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
		[display6 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display6;
	[display6 release];

}

-(IBAction)sevenBttonTapped:(id)Sender
{
	NSString* first = @"7";
	[_phoneNOString addObject:first];
	
	NSMutableString* display7 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
			[display7 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display7;
	[display7 release];

}

-(IBAction)eitghtBttonTapped:(id)Sender
{
	NSString* first = @"8";
	[_phoneNOString addObject:first];
	
	NSMutableString* display8 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
			[display8 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display8;
	[display8 release];
}

-(IBAction)ninthBttonTapped:(id)Sender
{
	NSString* first = @"9";
	[_phoneNOString addObject:first];
	
	NSMutableString* display9 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
			[display9 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display9;
	[display9 release];
}

-(IBAction)tenthBttonTapped:(id)Sender
{
	NSString* first = @"*";
	[_phoneNOString addObject:first];
	
	NSMutableString* display10 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
			[display10 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display10;
	[display10 release];

}

-(IBAction)elevenBttonTapped:(id)Sender
{
	NSString* first = @"0";
	[_phoneNOString addObject:first];
	
	NSMutableString* display11 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
			[display11 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display11;
	[display11 release];
}

-(IBAction)tweleveBttonTapped:(id)Sender
{
	NSString* first = @"#";
	[_phoneNOString addObject:first];
	
	NSMutableString* display12 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < _phoneNOString.count ; i++)
			[display12 appendString:[_phoneNOString objectAtIndex:i]]; 
		
	_text.text = @"";
	_text.text = display12;
	[display12 release];
}

-(IBAction)therteenBttonTapped:(id)Sender
{
	UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:nil 
															 delegate:self 
													cancelButtonTitle:@"Cancel"
											   destructiveButtonTitle:nil 
													otherButtonTitles:@"Create New Contact", @"Add to Existing contact" ,nil];
	[actionSheet showInView:self.view.superview];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch (buttonIndex)
	{
		case 0:
			    [self createNewContactScreen];
			    break;
		case 1:
			  {
				[[DataManager sharedObj] setIsShowAddScreen:YES];
				
				ContactsViewController* contactView = [[ContactsViewController alloc] init];	
				
				UINavigationController *navigation1 = [[UINavigationController alloc] initWithRootViewController:contactView];
				[DataManager sharedObj].canAddToContacts = YES;
				
				NSMutableString* callno = [[NSMutableString alloc] init];
				
				for (int i = 0; i < _phoneNOString.count ; i++)
				{
					[callno appendString:[_phoneNOString objectAtIndex:i]]; 
				}
			
				[DataManager sharedObj].mobileNumber = callno;
				
				[self presentModalViewController:navigation1 animated:YES];
			 }	    
			   break;
		default:
			   break;
	}
}

-(void) createNewContactScreen
{
	ABNewPersonViewController *newPerson = [[ABNewPersonViewController alloc] init];
	ABRecordRef aRecord = ABPersonCreate();
	CFErrorRef anError = NULL;
	NSMutableString* callno = [[NSMutableString alloc] init];
	
	for (int i = 0; i < _phoneNOString.count ; i++)
	{
		[callno appendString:[_phoneNOString objectAtIndex:i]]; 
	}
	
	ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
	ABMultiValueAddValueAndLabel(multiPhone, callno, kABPersonPhoneMobileLabel, NULL);            
	ABRecordSetValue(aRecord, kABPersonPhoneProperty, multiPhone, &anError);
	CFRelease(multiPhone);
	
	newPerson.displayedPerson = aRecord;
	newPerson.newPersonViewDelegate = self;
	
	UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:newPerson];
	
	[self presentModalViewController:navigation animated:YES];
	
	[newPerson release];
	[navigation release];
}


- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person
{
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)fourteenBttonTapped:(id)Sender
{
    NSMutableString* call = [[NSMutableString alloc] init];
	
	for (int i = 0; i < _phoneNOString.count ; i++)
	{
		[call appendString:[_phoneNOString objectAtIndex:i]]; 
	}
	
	NSLog(@"hello");
	
	NSString *phoneNumberScheme = [NSString stringWithFormat:@"tel:%@",call];
   	phoneNumberScheme = [phoneNumberScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberScheme]];
	[call release];
}

-(void)fifteenBttonTapped:(NSNotification *)notif
{
	if (_phoneNOString.count == 0)
	{
		BOOL repeat = NO;
		[[DataManager sharedObj] setRepetion:repeat];
	}
	else 
	{
		[_phoneNOString removeLastObject];
		
		NSMutableString* display15 = [[NSMutableString alloc] init];	
		
		for (int i = 0; i < _phoneNOString.count ; i++)
		{
			[display15 appendString:[_phoneNOString objectAtIndex:i]]; 
		}

		_text.text = @"";
		_text.text = display15;
		[display15 release];
		
		BOOL repeat = YES;
		[[DataManager sharedObj] setRepetion:repeat];
    }
}

- (void)dealloc
{
    [super dealloc];
}


@end

@implementation myButton


- (void) touchesBegan:(NSSet*) touches withEvent:(UIEvent*)event
{	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"notifying" object:nil];
	_holdTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(doSomething:) userInfo:nil repeats:NO];
	[_holdTimer retain];
}

- (void) touchesMoved:(NSSet*) touches withEvent:(UIEvent*)event
{	
	if ([_holdTimer isValid])
			[_holdTimer invalidate];
}

- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{	
	if ([_holdTimer isValid]) 
		[_holdTimer invalidate];
		
	if ([_holdAnother isValid]) 
		[_holdAnother invalidate];
}

- (void)doSomething:(NSTimer *)theTimer
{
	_holdAnother = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(dontice:) userInfo:nil repeats:YES];
	[_holdAnother retain];
}

- (void)dontice:(NSTimer *)theTimer
{
	BOOL testing = [[DataManager sharedObj] repetion];	
	
	if (testing == YES)
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:@"notifying" object:nil];
	}
}

@end

