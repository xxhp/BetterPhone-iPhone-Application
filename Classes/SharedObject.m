//
//  SharedObject.m
//  BetterPhone
//
//  Created by Manish Jain  on 10/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SharedObject.h"

static SharedObject*	sDataManager = nil;

@implementation SharedObject

@synthesize repetion = _repetion;


+ (SharedObject*) sharedObj
{
	@synchronized(self) 
	{
		if (sDataManager == nil)
		{
			sDataManager = [[SharedObject alloc] init];
		}
	}
	return sDataManager;
}

- (id) init
{
	if (self = [super init])
	{
//		//-- Init the shared objects
//		_partnerData				= [[NSMutableArray alloc] init];
//		_slideshowPresentationData  = [[NSMutableArray alloc] init];
//		_csvFileName                = [[NSMutableArray alloc] init];
//		_topicNames                 = [[NSString alloc] initWithString:@"Topic1"];
//		_currentDate                = [[NSDate alloc] init]; 
//		_bookMarkData               = [[NSMutableArray alloc] init];
//		
//		NSArray* filesPath	        = [ [NSBundle mainBundle] pathsForResourcesOfType:@".csv"  inDirectory:nil];
//		
//		for (int i = 0; i < filesPath.count; i++)
//		{
//			NSArray* fielddata  = [[filesPath objectAtIndex:i] componentsSeparatedByString:@"/"];
//			
//			NSString* str1 = [fielddata lastObject];
//			NSString* str2 = @"Sample_Partner_Data.csv";
//			
//			if( [str1 isEqual:str2] )
//			{
//				NSLog(@"Do not include");
//			}
//			else
//			{
//			    [_csvFileName addObject:[fielddata lastObject]];
//			}
//		}
	}
	
	return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
