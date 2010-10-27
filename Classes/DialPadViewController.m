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


@implementation DialPadViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	str = [[NSMutableArray alloc] init];
	_text.textAlignment = UITextAlignmentCenter;
	_text.textColor = [UIColor whiteColor];
		
}

- (void)addstring:(NSString*)string
{
  // [str stringByAppendingString:string];

	NSLog(@"%@",str);
}
	 
-(IBAction)firstBttonTapped:(id)Sender
{
	NSString* first = @"1";
	[str addObject:first];
	
	NSMutableArray* display = [[NSMutableString alloc] init];	
		
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
	//NSString* second = @"2";
}
-(IBAction)therteenBttonTapped:(id)Sender
{
	//NSString* second = @"2";
}
-(IBAction)fourteenBttonTapped:(id)Sender
{
   // NSString *phoneNumber=@"9540359506"; 
	
	NSMutableString* call = [[NSMutableString alloc] init];
	
	for (int i = 0; i < str.count ; i++)
	{
		[call appendString:[str objectAtIndex:i]]; 
	}
	
	NSString *phoneNumberScheme = [NSString stringWithFormat:@"tel:%@",call];
    //NSlog(phoneNumberScheme);                      
	phoneNumberScheme = [phoneNumberScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberScheme]];
	[call release];
}
-(IBAction)fifteenBttonTapped:(id)Sender
{
	if (str.count == 0)
	{
		NSLog(@"Hello");
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
	
	}
}





- (void)dealloc
{
    [super dealloc];
}

-(IBAction)bttonTapped:(id)Sender
{
	
//    NSString *phoneNumber=@"9540359506";                                       
//	NSString *phoneNumberScheme = [NSString stringWithFormat:@"tel:%@",phoneNumber];
//	//NSlog(phoneNumberScheme);                      
//	phoneNumberScheme = [phoneNumberScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//	
//	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberScheme]];
//	
//	
//	str = @"1";
//	
//	_text.textColor = [UIColor whiteColor];
//	_text.textAlignment = UITextAlignmentCenter;
//	
//	NSMutableArray* sample = [[NSMutableArray alloc] init];
//    
//	[sample addObject:str];	
//	
//	
//	
//	_text.text = 
	
	
	//	CTCall* call = [[CTCall alloc] init];
	//
	//	
	//	CTCallCenter* c = [[CTCallCenter alloc] init];
	//	
	//	//c.callEventHandler = ^(CTCall* call)
	//	//{
	//		
	//	NSSet* a = c.currentCalls;
	//	
	//	NSArray* aa = [[NSArray alloc] initWithArray:[a allObjects]]; 
	//	
	//	call = [aa objectAtIndex:0];
	//	
	//	if (call.callState == CTCallStateDisconnected)
	//	{
	//		NSLog(@"%@",call.callState);
	//	}
	
	//	c.callEventHandler = ^(CTCall* call)
	//	{//		
	//		if (call.callState == CTCallStateDialing) 
	//		{
	//		CTCallDisconnect(call); //this do not end call
	//		}
	//	};
	//CFStringRef* ref = call.callState;
}



@end
