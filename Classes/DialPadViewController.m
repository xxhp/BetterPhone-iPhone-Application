//
//  DialPadViewController.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DialPadViewController.h"
#import "CTCall.h"
#import "CTCallCenter.h"
#import "SharedObject.h"

NSString * const notifying = @"DataComplete";

@interface DialPadViewController (private)

-(void)fifteenBttonTapped:(NSNotification *)notif;

@end

@implementation DialPadViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
	str = [[NSMutableArray alloc] init];
	_text.textColor     = [UIColor whiteColor];
	_text.font          = [UIFont systemFontOfSize:44];

	[[SharedObject sharedObj] setRepetion:YES];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fifteenBttonTapped:) name:@"notifying" object:nil]; 
}


-(IBAction)firstBttonTapped:(id)Sender
{
	NSString* first = @"1";
	[str addObject:first];
	
	NSMutableString* display = [[NSMutableString alloc] init];	
		
	for (int i = 0; i < str.count ; i++)
	{
		[display appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display;
	
	[display release];
}

-(IBAction)secondBttonTapped:(id)Sender
{
	NSString* first = @"2";
	[str addObject:first];
	
	NSMutableString* display1 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display1 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display1;
	[display1 release];
}

-(IBAction)thirdBttonTapped:(id)Sender
{
	NSString* first = @"3";
	[str addObject:first];
	
	NSMutableString* display3 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display3 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display3;
	[display3 release];
}

-(IBAction)fourthBttonTapped:(id)Sender
{
	NSString* first = @"4";
	[str addObject:first];
	
	NSMutableString* display4 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display4 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display4;
	[display4 release];

}	
	
-(IBAction)fifthBttonTapped:(id)Sender
{
	NSString* first = @"5";
	[str addObject:first];
	
	NSMutableString* display5 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display5 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display5;
	[display5 release];

}
-(IBAction)sixthBttonTapped:(id)Sender
{
	NSString* first = @"6";
	[str addObject:first];
	
	NSMutableString* display6 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display6 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display6;
	[display6 release];

}
-(IBAction)sevenBttonTapped:(id)Sender
{
	NSString* first = @"7";
	[str addObject:first];
	
	NSMutableString* display7 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display7 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display7;
	[display7 release];

}
-(IBAction)eitghtBttonTapped:(id)Sender
{
	NSString* first = @"8";
	[str addObject:first];
	
	NSMutableString* display8 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display8 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display8;
	[display8 release];
}
-(IBAction)ninthBttonTapped:(id)Sender
{
	NSString* first = @"9";
	[str addObject:first];
	
	NSMutableString* display9 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display9 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display9;
	[display9 release];
}
-(IBAction)tenthBttonTapped:(id)Sender
{
	NSString* first = @"*";
	[str addObject:first];
	
	NSMutableString* display10 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display10 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display10;
	[display10 release];

}
-(IBAction)elevenBttonTapped:(id)Sender
{
	NSString* first = @"0";
	[str addObject:first];
	
	NSMutableString* display11 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display11 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display11;
	[display11 release];
}
-(IBAction)tweleveBttonTapped:(id)Sender
{
	NSString* first = @"#";
	[str addObject:first];
	
	NSMutableString* display12 = [[NSMutableString alloc] init];	
	
	for (int i = 0; i < str.count ; i++)
	{
		[display12 appendString:[str objectAtIndex:i]]; 
	}
	
	_text.text = @"";
	_text.text = display12;
	[display12 release];
}

-(IBAction)therteenBttonTapped:(id)Sender
{
	UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Create New Contact", @"Add to Existing contact" ,nil ];
	//[actionSheet addButtonWithTitle:@"Add to existing contact"];
	//[actionSheet cancelButtonIndex:2];
	
	[actionSheet showInView:self.view.superview];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
//	switch (buttonIndex)
//	{
//		case 0:
//			
//			break;
//		default:
//			break;
//	}
//	int i = buttonIndex;
	
}

-(IBAction)fourteenBttonTapped:(id)Sender
{
    NSMutableString* call = [[NSMutableString alloc] init];
	
	for (int i = 0; i < str.count ; i++)
	{
		[call appendString:[str objectAtIndex:i]]; 
	}
	
	NSLog(@"hello");
	
	NSString *phoneNumberScheme = [NSString stringWithFormat:@"tel:%@",call];
   	phoneNumberScheme = [phoneNumberScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberScheme]];
	[call release];
}

-(void)fifteenBttonTapped:(NSNotification *)notif
{
	if (str.count == 0)
	{
		NSLog(@"Hello");
		BOOL repeat = NO;
		
		[[SharedObject sharedObj] setRepetion:repeat];
	}
	else 
	{
		[str removeLastObject];
		
		NSMutableString* display15 = [[NSMutableString alloc] init];	
		
		for (int i = 0; i < str.count ; i++)
		{
			[display15 appendString:[str objectAtIndex:i]]; 
		}

		_text.text = @"";
		_text.text = display15;
		[display15 release];
		
		BOOL repeat = YES;
		
		[[SharedObject sharedObj] setRepetion:repeat];
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
	if ([_holdTimer isValid]) {
		[_holdTimer invalidate];
	}
}

- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{	
	if ([_holdTimer isValid]) 
	{
		[_holdTimer invalidate];
	}
	
	if ([_holdAnother isValid]) 
	{
		[_holdAnother invalidate];
	}
}

- (void)doSomething:(NSTimer *)theTimer
{
	_holdAnother = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(dontice:) userInfo:nil repeats:YES];
	[_holdAnother retain];
}

- (void)dontice:(NSTimer *)theTimer
{
	BOOL testing = [[SharedObject sharedObj] repetion];	
	if (testing == NO)
	{
		
	}
	else
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:@"notifying" object:nil];
	}

	
}

@end

