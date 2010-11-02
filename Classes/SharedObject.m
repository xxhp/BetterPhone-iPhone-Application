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

@synthesize repetion   = _repetion;
@synthesize personNo   = _personNo;
@synthesize sharedList = _sharedList;
@synthesize sharedContacts = _sharedContacts;

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
		_sharedList		= [[NSMutableArray alloc] init];
	    _sharedContacts = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(void)addMutableArrayElements:(NSString*)str
{
	[_sharedList      addObject:str];
	//[_sharedContacts  addObject:str];

}

-(void)addMutableArrayElements1:(NSString*)str
{
	//[_sharedList      addObject:str];
	[_sharedContacts  addObject:str];
	
}


- (void)dealloc {
    [super dealloc];
}


@end
